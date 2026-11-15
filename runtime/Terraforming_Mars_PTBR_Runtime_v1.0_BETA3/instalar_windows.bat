@echo off
cd /d "%~dp0"

echo ===============================================
echo  Terraforming Mars PT-BR Runtime - Windows
echo ===============================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0instalar_windows.ps1"

echo.
pause