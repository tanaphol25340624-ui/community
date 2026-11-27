@echo off
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
    echo ไม่พบ Python ใน .venv กรุณาตรวจสอบโฟลเดอร์โปรเจกต์
    pause
    exit /b 1
)

set /p STICKER_NUMBER=ใส่หมายเลขสติ๊กเกอร์ที่ต้องการสร้าง (1-24): 
".venv\Scripts\python.exe" "make_sticker_prompts.py" --sticker "%STICKER_NUMBER%" > "sticker_prompt.txt"
if errorlevel 1 (
    echo หมายเลขไม่ถูกต้อง กรุณาใส่เลข 1 ถึง 24
    pause
    exit /b 1
)

echo คัดลอกพรอมป์ต์จาก Notepad ไปวางใน Canva แล้วกดสร้างภาพ
start "" "https://www.canva.com/"
start "" notepad "sticker_prompt.txt"
