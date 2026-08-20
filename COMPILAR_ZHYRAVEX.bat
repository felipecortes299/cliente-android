@echo off
setlocal
cd /d "%~dp0"
echo ============================================================
echo              ZHYRAVEX - GRADLE BUILD
echo ============================================================
echo.
where java >nul 2>nul || (
  echo ERROR: Gradle moderno requiere Java 17.
  echo Alternativa: usa el workflow de GitHub Actions incluido en .github\workflows
  pause
  exit /b 1
)
if exist gradlew.bat (
  call gradlew.bat :app:assembleDebug
) else (
  where gradle >nul 2>nul || (
    echo ERROR: No se encontro Gradle ni Gradle Wrapper.
    echo Puedes compilar en la nube con GitHub Actions.
    pause
    exit /b 1
  )
  call gradle :app:assembleDebug
)
if errorlevel 1 exit /b %errorlevel%
echo.
echo APK: app\build\outputs\apk\debug\app-debug.apk
pause
