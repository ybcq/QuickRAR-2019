@echo off

::获取管理员权限
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

regsvr32.exe "%~dp0shellentry.dll" /s
regsvr32.exe "%~dp0shellentry1.0.1.100.dll" /s
regsvr32.exe "%~dp0shellentry64.dll" /s