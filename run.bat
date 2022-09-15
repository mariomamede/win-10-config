@echo off

::Disable UAC
ECHO Disabling UAC...
%windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
ECHO.

::Disable: Hide extensions for known file types
ECHO Disabling Hide extensions for known file types...
%windir%\System32\reg.exe ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f
ECHO.

::Disable: Let's finish setting up your device
ECHO Disabling 'Let's finish setting up your device'
%windir%\System32\reg.exe ADD HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f
ECHO.

::Replacing PowerShell with Command Prompt in Windows + X
::https://www.itprotoday.com/windows-10/replacing-command-prompt-powershell-windows-10-start-menu
ECHO Replacing PowerShell to Command Prompt...
%windir%\System32\reg.exe ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v DontUsePowerShellOnWinX /t REG_DWORD /d 1 /f
ECHO.

::File Explorer open "This PC" by default
::https://superuser.com/questions/819521/how-do-i-make-windows-10s-file-explorer-open-this-pc-by-default
ECHO Set file explorer open 'This PC' by default...
%windir%\System32\reg.exe ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v LaunchTo /t REG_DWORD /d 1 /f
ECHO.

::Disabling "Quick Access" from explorer folders (Default: not exist)
::https://answers.microsoft.com/en-us/windows/forum/windows_10-files/how-to-really-completely-disable-quick-access-in
ECHO Disabling 'Quick Access' from explorer
%windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v HubMode /t REG_DWORD /d 1 /f
ECHO.

::Remove 3D Objects folder explorer
::https://www.thewindowsclub.com/remove-3d-objects-folder-winows-10
ECHO Removing 3D Objects folder explorer
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
ECHO.

::Set sound communications to 'Do Nothing'...
::https://community.spiceworks.com/topic/479903-set-the-option-sound-communications-do-nothing-via-group-policy
ECHO Set sound communications to 'Do Nothing'...
%windir%\System32\reg.exe ADD HKCU\Software\Microsoft\Multimedia\Audio /v UserDuckingPreference /t REG_DWORD /d 3 /f
ECHO.

::Disable Sticky Keys In Windows 10
::https://blog.pcrisk.com/windows/12938-cant-turn-off-sticky-keys
::https://www.tenforums.com/tutorials/115391-turn-off-sticky-keys-windows-10-a.html#post1436819
ECHO Disabling Sticky Keys
::26 - disable all: reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "26" /f
%windir%\System32\reg.exe ADD "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f
ECHO.

::Disable switch between different input languages (Default: not exist)
::https://answers.microsoft.com/en-us/windows/forum/windows_xp-desktop/how-can-disable-switch-between-different-input
ECHO Disabling switch between different input languages
%windir%\System32\reg.exe ADD "HKCU\Keyboard Layout\Toggle" /v Hotkey /t REG_SZ /d 3 /f
%windir%\System32\reg.exe ADD "HKCU\Keyboard Layout\Toggle" /v "Language Hotkey" /t REG_SZ /d 3 /f
%windir%\System32\reg.exe ADD "HKCU\Keyboard Layout\Toggle" /v "Layout Hotkey" /t REG_SZ /d 3 /f
ECHO.

::Disabling device passwordless
::https://www.askvg.com/fix-users-must-enter-a-user-name-and-password-to-use-this-computer-checkbox-missing-in-windows-10/
ECHO Disabling device passwordless
%windir%\System32\reg.exe ADD “HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device” /v DevicePasswordLessBuildVersion /t REG_DWORD /d 0 /f
ECHO.

::Change power plan to 'High performance'
ECHO Changing power plan to 'High performance'...
powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
control.exe powercfg.cpl,,3
pause
ECHO.

::Disable hibernate
::https://www.cnet.com/news/if-a-600-stimulus-check-happens-which-of-these-5-payment-groups-would-be-yours/
ECHO Disabling hibernate...
powercfg.exe /hibernate off
ECHO Done.

ECHO.
pause
