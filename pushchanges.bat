@echo off
setlocal

set /p COMMIT_MSG=Commit message:

if "%COMMIT_MSG%"=="" (
    echo Je moet wel iets invullen
    exit /b 1
)

git add .

git commit -m "%COMMIT_MSG%"

git push

endlocal
pause