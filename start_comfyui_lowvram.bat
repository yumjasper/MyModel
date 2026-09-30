@echo off
setlocal
cd /d "%~dp0ComfyUI"
set PYTHONUTF8=1
"..\.venv\Scripts\python.exe" main.py --listen 127.0.0.1 --port 8188 --preview-method auto --lowvram --cpu-vae
pause
