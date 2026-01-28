@echo off
setlocal EnableExtensions EnableDelayedExpansion

title Google / Android / Flutter Access Check

echo.
echo Google / Android / Flutter Access Check
echo ==================================================
echo RESULT    HTTP   URL
echo --------------------------------------------------

set URLS=https://dl.google.com/android/repository/repository2-1.xml ^
 https://plugins.gradle.org/m2/ ^
 https://dl.google.com/dl/android/maven2/index.html ^
 https://maven.google.com/web/index.html ^
 https://accounts.google.com/.well-known/openid-configuration ^
 https://www.googleapis.com/oauth2/v3/certs

where curl >nul 2>nul
if %errorlevel% neq 0 (
  echo FAIL -   ----   curl not found on this Windows
  goto END
)

for %%U in (%URLS%) do (
  set "CODE="

  for /f "delims=" %%C in ('
    curl -I -L --max-time 15 -s -o NUL -w "%%{http_code}" "%%U"
  ') do set "CODE=%%C"

  if "!CODE!"=="000" (
    echo FAIL -   ----   %%U
  ) else (
    if !CODE! GEQ 200 if !CODE! LSS 400 (
      echo PASS +   !CODE!   %%U
    ) else (
      echo FAIL -   !CODE!   %%U
    )
  )
)

:END
echo --------------------------------------------------
echo Done.
pause
