@echo off
setlocal

if "%1"=="help" goto help
if "%1"=="dev-frontend" goto dev-frontend
if "%1"=="dev-backend" goto dev-backend
if "%1"=="dev" goto dev
if "%1"=="" goto dev

:help
echo Available commands:
echo   dev.bat help           - Shows this help message
echo   dev.bat dev-frontend   - Starts the frontend development server (Vite)
echo   dev.bat dev-backend    - Starts the backend development server (Uvicorn with reload)  
echo   dev.bat dev            - Starts both frontend and backend development servers
goto end

:dev-frontend
echo Starting frontend development server...
cd frontend
npm run dev
goto end

:dev-backend
echo Starting backend development server...
cd backend
langgraph dev
goto end

:dev
echo Starting both frontend and backend development servers...
echo Opening frontend in new window...
start cmd /k "cd frontend && npm run dev"
echo Starting backend...
cd backend
langgraph dev
goto end

:end 