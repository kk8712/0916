@echo off
title PC Setup - Auto Install (winget)
echo ============================================
echo   PC Setup: Installing required programs
echo ============================================
echo.

where winget >nul 2>nul
if errorlevel 1 (
    echo [ERROR] winget is not installed.
    echo Please install "App Installer" from the Microsoft Store first.
    pause
    exit /b 1
)

echo [1/5] Installing Git...
winget install --id Git.Git -e --silent --accept-package-agreements --accept-source-agreements

echo [2/5] Installing Visual Studio Code...
winget install --id Microsoft.VisualStudioCode -e --silent --accept-package-agreements --accept-source-agreements

echo [3/5] Installing Node.js LTS...
winget install --id OpenJS.NodeJS.LTS -e --silent --accept-package-agreements --accept-source-agreements

echo [4/6] Installing LibreOffice...
winget install --id TheDocumentFoundation.LibreOffice -e --silent --accept-package-agreements --accept-source-agreements

echo [5/6] Installing Python...
winget install --id Python.Python.3.12 -e --silent --accept-package-agreements --accept-source-agreements

echo [6/6] Installing Claude...

winget install --id Anthropic.Claude -e --silent --accept-package-agreements --accept-source-agreements

echo.
echo ============================================
echo   Verifying installations...
echo ============================================
echo.

echo [Git]
winget list --id Git.Git -e

echo.
echo [Visual Studio Code]
winget list --id Microsoft.VisualStudioCode -e

echo.
echo [Node.js LTS]
winget list --id OpenJS.NodeJS.LTS -e

echo.
echo [LibreOffice]
winget list --id TheDocumentFoundation.LibreOffice -e

echo.
echo [Python]
winget list --id Python.Python.3.12 -e

echo.
echo [Claude]
winget list --id Anthropic.Claude -e

echo.
echo ============================================
echo   Done! If any item above says "No installed package found",
echo   that program failed to install - install it manually.
echo ============================================
pause
