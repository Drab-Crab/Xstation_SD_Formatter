@echo off
@title Extract CHD to Xstation ODE SD Card
setlocal enabledelayedexpansion
set RUNPATH=%~dp0
echo Enter drive letter for Xstation SD card (Example: H: or H:\)
set /p OUTPUT="SD Card Drive Letter: "
echo Enter path to CHD backups (Press enter for default: Source_CHD)
set /p INPUT="Path to CHD Backups: "
if "%INPUT%" == "" set INPUT="%RUNPATH%Source_CHD"
echo **************************************************
echo Using %INPUT% as source location for .CHD backups...
for /r %INPUT% %%i in (*.chd) DO (
	set filename=%%~ni
	set firstchar=!filename:~0,1!
	echo.1234567890 | findstr /C:"!firstchar!" 1>nul
	if errorlevel 1 (
		rem
		) else (
		set firstchar=#
	)
	set createfilepath=%OUTPUT%\!firstchar!\!filename!
	mkdir "!createfilepath!"
	set outputpath=!createfilepath!\!filename!
	%RUNPATH%chdman extractcd -i "%%i" -o "!outputpath!.cue"
)
echo **************************************************
echo Insert SD card into the Xstation ODE.  Enjoy!
PAUSE
