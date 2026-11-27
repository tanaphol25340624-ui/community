@echo off
cd /d "%~dp0"
set "PYTHON=.venv\Scripts\python.exe"
if not exist "%PYTHON%" (
    where py >nul 2>&1
    if not errorlevel 1 (
        set "PYTHON=py -3"
    ) else (
        set "PYTHON=python"
    )
)

%PYTHON% --version >nul 2>&1
if errorlevel 1 (
    echo ไม่พบ Python กรุณาติดตั้ง Python แล้วลองใหม่
    pause
    exit /b 1
)

set /p STICKER_NUMBER=ใส่หมายเลขสติ๊กเกอร์ที่ต้องการสร้าง (1-24): 
%PYTHON% "make_sticker_prompts.py" --sticker "%STICKER_NUMBER%" > "sticker_prompt.txt"
if errorlevel 1 (
    echo หมายเลขไม่ถูกต้อง กรุณาใส่เลข 1 ถึง 24
    pause
    exit /b 1
)

echo คัดลอกพรอมป์ต์จาก Notepad ไปวางใน Canva แล้วกดสร้างภาพ
start "" "https://www.canva.com/"
start "" notepad "sticker_prompt.txt"
