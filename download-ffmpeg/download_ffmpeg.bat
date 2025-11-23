@echo off
rem The goal of the script is to easily download ffmpeg release build by gyan.dev
rem A single link provides access to the essential package that provides three exe files
rem ffmpeg.exe
rem ffplay.exe
rem ffprobe.exe
rem Upon extraction, the file path to the host bin\ directory will be provided as output
rem Windows 10 or greater required

rem Script by: Jalees A. Nasir 
rem GitHub: @Jaleezyy

set startDir=%CD%
set installLocation=%USERPROFILE%\ffmpeg
set binLocation=%installLocation%\bin

set ffmpeg=False
set ffplay=False
set ffprobe=False


rem Create the necessary output directory
echo "Searching for %installLocation%
if not exist %installLocation% (
	echo "Creating directory: %installLocation%
	md %installLocation%
	cd %installLocation%
) else (
	echo "Install directory already exists! Continuing..."
	cd %installLocation%
)

rem Pre-existing bin indicates the script has already run, we can just provide the ending output
if exist %binLocation% (
	echo "FFMPEG already installed! Exiting..."
	echo "Add the following line when linking to ffmpeg"
	echo "--ffmpeg-location %binLocation%"
	echo "Place quotation marks around the filepath"
	pause
	exit /b
)

pause


rem Download latest build of essentials using curl
if not exist %installLocation%\ffmpeg-release-essentials.zip (
	echo "Downloading ffmpeg essentials!"
	curl -L -v -o %installLocation%\ffmpeg-release-essentials.zip "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"
) else (
	echo "Download of zipped directory already exists! Proceeding..."
	rem Extract using tar, no files will be overwritten
	echo "Extracting..."
	tar -x -k -v --strip-components 1 -f %installLocation%\ffmpeg-release-essentials.zip -C %installLocation%
)

pause

rem Verify bin directory found
rem Add cleanup removing .zip
if exist %binLocation% (
	echo "Cleaning up..."
	rm %installLocation%\ffmpeg-release-essentials.zip
) else (
	echo "Something went wrong with extraction! Exiting..."
	pause
	rem exit /b
)

rem Check files are where we expect them to be
if exist %binLocation% (
	if not exist %binLocation%\ffmpeg.exe (
		echo "Missing ffmpeg.exe"
	) else (
		echo "Found ffmpeg.exe"
		set ffmpeg=True
	)
	if not exist %binLocation%\ffplay.exe (
		echo "Missing ffplay.exe"
	) else (
		echo "Found ffplay.exe"
		set ffplay=True
	)
	if not exist %binLocation%\ffprobe.exe (
		echo "Missing ffprobe.exe"
	) else (
		echo "Found ffprobe.exe"
		set ffprobe=True
	)
)

echo "FFMPEG successfully installed! Exiting..."
echo "Add the following line when linking to ffmpeg"
echo "--ffmpeg-location %binLocation"
echo "Place quotation marks around the filepath"
pause
exit /b
	
REM if "%ffmpeg% == %ffprobe%" if "%ffmpeg% == %ffplay%" if "%ffprobe% == %ffplay%" (
	REM echo "FFMPEG successfully installed! Exiting..."
	REM echo "Add the following line when linking to ffmpeg"
	REM echo "--ffmpeg-location %installLocation%\bin"
	REM echo "Place quotation marks around the filepath"
	REM pause
	REM rem exit /b
REM ) else
	REM echo "Files seems to be missing! Something went wrong! Exiting..."
	REM pause
	REM rem exit /b
REM )


REM :CheckFiles 
REM SETLOCAL
REM if not exist %~1\bin\ffmpeg.exe (
	REM echo "Missing ffmpeg.exe"
REM ) else (
	REM set ffmpeg=True
REM )
REM if not exist %~1\bin\ffplay.exe (
	REM echo "Missing ffplay.exe"
REM ) else (
	REM set ffplay=True
REM )
REM if not exist %~1\bin\ffprobe.exe (
	REM echo "Missing ffprobe.exe"
REM ) else (
	REM set ffprobe=True
REM )
REM ENDLOCAL
