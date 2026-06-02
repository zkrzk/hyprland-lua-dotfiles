#!/usr/bin/env python3
import urllib.request
import json
import sys

LAT = "33.6936"
LON = "-7.3694"
URL = f"https://api.open-meteo.com/v1/forecast?latitude={LAT}&longitude={LON}&current=temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m&timezone=auto"

WEATHER_EMOJIS = {
    0: "☀️", 
    1: "🌤️", 2: "⛅", 3: "☁️", 
    45: "🌫️", 48: "🌫️",    
    51: "🌧️", 53: "🌧️", 55: "🌧️", 
    56: "🌨️", 57: "🌨️",  
    61: "🌧️", 63: "🌧️", 65: "🌧️",
    66: "🌨️", 67: "🌨️",   
    71: "🌨️", 73: "🌨️", 75: "🌨️", 
    77: "🌨️",           
    80: "🌦️", 81: "🌦️", 82: "🌦️",
    85: "🌨️", 86: "🌨️",  
    95: "⛈️", 96: "⛈️", 99: "⛈️"  
}

try:
    req = urllib.request.Request(URL, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req, timeout=5) as response:
        data = json.loads(response.read())
        current = data["current"]
        
        temp = round(current["temperature_2m"])
        humidity = current["relative_humidity_2m"]
        wind = round(current["wind_speed_10m"])
        code = current["weather_code"]
        
        emoji = WEATHER_EMOJIS.get(code, "✨")
        
        sign = "+" if temp > 0 else ""
        
        text_out = f"{sign}{temp}°C"
        tooltip_out = f"📍 Mohammedia: {emoji} {sign}{temp}°C  💨 {wind} km/h  💧 {humidity}%"
        
        print(json.dumps({"text": text_out, "tooltip": tooltip_out}, ensure_ascii=False))

except Exception:
    print(json.dumps({"text": "N/A", "tooltip": "تعذر الاتصال بخدمة الطقس"}, ensure_ascii=False))
    sys.exit(1)
