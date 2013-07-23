@echo off

:::::::::::::::::::::::
:: option parsing
:::::::::::::::::::::

: see what can be done
: export PATH="/usr/local/bin:$PATH"

:::::::::::::::::::::::
:: option parsing
:::::::::::::::::::::

:: default values

set simflag=0
set plotflag=0
set persistflag=0
set filename="out"
: california uber alles
set climate="USA_CA_San.Francisco.Intl.AP.724940_TMY3" 

:GETOPTS
:: if /I %1 == -s set simflag=1 & set plotflag=1
 if /I %1 == -s set simflag=1
 if /I %1 == -p set plotflag=1 & set persistflag=%2& shift
 if /I %1 == -c set climate=%2& shift
 if /I %1 == -f set filename=%2& shift
 if /I %1 == -h goto USAGE
 shift
if /I %1 == -s goto GETOPTS
if /I %1 == -p goto GETOPTS
if /I %1 == -c goto GETOPTS
if /I %1 == -f goto GETOPTS
if /I %1 == -h goto GETOPTS

:: so how many flags remain
echo First remaining argument is: 
echo %1

:: level to lessen priority to leave processor time to applet realtime 
:: START /b /low or /belownormal   ...
:: see below

:: do what is requested
:TEST
if %simflag% EQU 1 goto SIM
if %plotflag% EQU 1 goto PLOT
goto done


:::::::::::::::::::::
:: display usage
:::::::::::::::::::::
:USAGE
ECHO usage: $0 options
ECHO
ECHO This is the ANAR+ EnergyPlus simulation script 
ECHO 
ECHO OPTIONS:
ECHO	-h	
ECHO		Show this message
ECHO	-s
ECHO		EnergyPlus simulation
ECHO	-p
ECHO		plot already computed results
ECHO	-c  
ECHO   		specifies climate file (must be priorly installed for E+)
ECHO	-f filename      
ECHO   		specifies optional filename
ECHO
exit


:::::::::::::::::::::::::::::
:: simulation 
:::::::::::::::::::::::::::::

:SIM
:: note that parameters can now be used as normal since $OPTIND rewinded above
:: %1 = simulation directory
if (%1)==() ECHO EnergyPluss simulation usage: energyPlus.bat -s -f filename -c climatefile dir & exit

:: move ot sim folder
chdir %1
:: up to sketch folder
cd ..
:: check if exist weather file in sketch folder
:: if yes copy to C:\ANAR\EnergyPlus\WeatherData\
if exist "%climate%.epw" copy "%climate%.epw" C:\ANAR\EnergyPlus\WeatherData\%climate%.epw  

echo local path %cd%
echo batch path %~dp0


:: move to simulation dir
chdir %1
echo local path %cd%
echo batch path %~dp0

:: calculation
C:\ANAR\EnergyPlus\RunEPlus.bat "%~1\%filename%" %climate%

set simflag=0
goto TEST


:::::::::::::::::::::::::::::
:: plotting results 
:::::::::::::::::::::::::::::
:PLOT
:: note that parameters can now be used as normal since shifted above
:: %1 = simulation directory
if (%1)==() ECHO EnergyPluss simulation usage: energyPlus.bat -s -f filename -c climatefile dir & exit
    
:: move to simulation dir
chdir %1
echo local path %cd%
echo batch path %~dp0

:: display the graph(s) using gnuplot
IF %persistflag% EQU 1 (
  ECHO plotting persistent 
  C:\ANAR\gnuplot\bin\gnuplot -persist energyPlus.plt
) ELSE (
  ECHO plotting non persistent 
  C:\ANAR\gnuplot\bin\gnuplot energyPlus.plt
)

set plotflag=0
goto TEST
	
:done
exit
