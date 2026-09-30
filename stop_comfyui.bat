@echo off
setlocal
powershell -NoProfile -Command "$p = (Get-NetTCPConnection -LocalAddress 127.0.0.1 -LocalPort 8188 -State Listen -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty OwningProcess); if ($p) { Stop-Process -Id $p -ErrorAction SilentlyContinue; Write-Host 'ComfyUI stopped.' } else { Write-Host 'ComfyUI is not running on port 8188.' }"
pause
