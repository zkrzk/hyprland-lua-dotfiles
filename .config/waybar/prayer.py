#!/usr/bin/env python3
import datetime
import json
import os
import requests
import sys

LATITUDE = 33.6936
LONGITUDE = -7.3694
METHOD = 3
CACHE_FILE = os.path.expanduser("~/.cache/prayer_times.json")

def get_prayer_times():
    today_str = str(datetime.date.today())
    
    if os.path.exists(CACHE_FILE):
        with open(CACHE_FILE, 'r') as f:
            try:
                cache = json.load(f)
                if cache.get("date") == today_str:
                    return cache["timings"]
            except:
                pass

    try:
        url = f"https://api.aladhan.com/v1/timingsByAddress?address=Mohammedia,Morocco&method={METHOD}"
        response = requests.get(url, timeout=10)
        data = response.json()
        if data["code"] == 200:
            timings = data["data"]["timings"]
            with open(CACHE_FILE, 'w') as f:
                json.dump({"date": today_str, "timings": timings}, f)
            return timings
    except Exception as e:
        if os.path.exists(CACHE_FILE):
            with open(CACHE_FILE, 'r') as f:
                return json.load(f)["timings"]
        print(json.dumps({"text": "لا يوجد اتصال", "tooltip": "تحقق من الشبكة"}))
        sys.exit(0)

timings = get_prayer_times()

def to_mins(t_str):
    h, m = map(int, t_str.split(':'))
    return h * 60 + m

def format_time(diff):
    if diff >= 60:
        return f"{diff // 60}س {diff % 60}د"
    return f"{diff}د"

f_m = to_mins(timings['Fajr'])
d_m = to_mins(timings['Dhuhr'])
a_m = to_mins(timings['Asr'])
ma_m = to_mins(timings['Maghrib'])
i_m = to_mins(timings['Isha'])

now = datetime.datetime.now()
c_m = now.hour * 60 + now.minute

if f_m <= c_m < f_m + 30:
    text = f"مضى على الفجر: {c_m - f_m}د"
elif d_m <= c_m < d_m + 30:
    text = f"مضى على الظهر: {c_m - d_m}د"
elif a_m <= c_m < a_m + 30:
    text = f"مضى على العصر: {c_m - a_m}د"
elif ma_m <= c_m < ma_m + 30:
    text = f"مضى على المغرب: {c_m - ma_m}د"
elif i_m <= c_m < i_m + 30:
    text = f"مضى على العشاء: {c_m - i_m}د"
elif c_m < f_m:
    text = f"الفجر بعد {format_time(f_m - c_m)}"
elif c_m < d_m:
    text = f"الظهر بعد {format_time(d_m - c_m)}"
elif c_m < a_m:
    text = f"العصر بعد {format_time(a_m - c_m)}"
elif c_m < ma_m:
    text = f"المغرب بعد {format_time(ma_m - c_m)}"
elif c_m < i_m:
    text = f"العشاء بعد {format_time(i_m - c_m)}"
else:
    text = f"الفجر بعد {format_time((1440 - c_m) + f_m)}"

tooltip = (
    "🌅 الفجر     ←  {F}\n"
    "☀️ الظهر     ←  {D}\n"
    "🕒 العصر     ←  {A}\n"
    "🌆 المغرب    ←  {MA}\n"
    "🌙 العشاء    ←  {I}"
).format(F=timings['Fajr'], D=timings['Dhuhr'], A=timings['Asr'], MA=timings['Maghrib'], I=timings['Isha'])

print(json.dumps({"text": text, "tooltip": tooltip}, ensure_ascii=False))
