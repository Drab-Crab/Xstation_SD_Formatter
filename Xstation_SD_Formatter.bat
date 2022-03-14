@echo off
@title Create Folder Structure for Xstation ODE SD Card

set RUNPATH=%~dp0
echo Enter drive letter for Xstation sd card (Example: H: or H:\)
set /p TARGET="SD Card Drive Letter: "
echo **************************************************
echo Creating folder structure...
FOR %%X IN (00xstation,#,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z) DO (
	if not exist "%TARGET%\%%X" (
	mkdir "%TARGET%\%%X" 
	) else (
	echo Folder "%TARGET%\%%X" already exists; Skipping creation.
	)
)
echo Unzipping firmware...
powershell -Command "Expand-Archive %RUNPATH%update*.zip -DestinationPath %TARGET%\00xstation -Force"
echo **************************************************
echo Xstation SD card successfully created.  
echo Move backup images to the correct folder
echo Insert SD card into the Xstation ODE.  Enjoy!
PAUSE
