@echo off
cd /d "%~dp0"
echo Uninstalling ...
CLS
install_wim_tweak.exe /o /l
install_wim_tweak.exe /o /c Microsoft-PPIProjection /r
install_wim_tweak.exe /o /c Microsoft-Windows-Cortana /r
install_wim_tweak.exe /o /c Microsoft-Windows-Holographic-Desktop-Analog-Package /r
install_wim_tweak.exe /o /c Microsoft-Windows-Holographic-Desktop-Merged-Package /r
install_wim_tweak.exe /o /c Microsoft-Windows-Holographic-Desktop-Merged-WOW64-Package /r
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
RD "%UserProfile%\OneDrive" /Q /S
RD "%LocalAppData%\Microsoft\OneDrive" /Q /S
RD "%ProgramData%\Microsoft OneDrive" /Q /S
RD "C:\OneDriveTemp" /Q /S
REG Delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
REG Delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
install_wim_tweak.exe /h /o /l
install_wim_tweak.exe /o /c "Windows-Defender" /r
install_wim_tweak.exe /o /c Microsoft-Windows-Internet-Browser-Package /r
echo y|takeown /f "%ProgramFiles%\Windows Defender\*.*"
echo y|icacls "%ProgramFiles%\Windows Defender\*.*" /grant administrators:F
rd /s /q "%ProgramFiles%\Windows Defender\"
echo y|takeown /f "%ProgramFiles%\Windows Defender Advanced Threat Protection\*.*"
echo y|icacls "%ProgramFiles%\Windows Defender Advanced Threat Protection\*.*" /grant administrators:F
rd /s /q "%ProgramFiles%\Windows Defender Advanced Threat Protection\"
taskkill /im smartscreen.exe /f
echo y|takeown /f "%windir%\System32\smartscreen.exe"
echo y|icacls "%windir%\System32\smartscreen.exe" /grant administrators:F
del "%windir%\System32\smartscreen.exe" /f
echo It should be uninstalled. Please reboot Windows 10.
pause