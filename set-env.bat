@echo off
setlocal enabledelayedexpansion

REM 指定.env文件路径
set "env_file=C:\GitRepo\gemini-fullstack-langgraph-quickstart\backend\.env"

echo 正在从 "%env_file%" 加载环境变量...
echo.

for /f "usebackq delims=" %%i in ("%env_file%") do (
    set "line=%%i"
    
    REM 跳过注释行（以#开头）和空行
    if not "!line:~0,1!"=="#" (
        if not "!line!"=="" (
            REM 提取KEY和VALUE（支持等号前后有空格）
            for /f "tokens=1,* delims==" %%a in ("!line!") do (
                set "key=%%a"
                set "value=%%b"
                
                REM 去除KEY和VALUE的前后空格
                for /f "tokens=*" %%k in ("!key!") do set "key=%%k"
                for /f "tokens=*" %%v in ("!value!") do set "value=%%v"
                
                REM 如果VALUE非空，则设置环境变量
                if not "!value!"=="" (
                    echo 设置环境变量: !key!=!value!
                    setx "!key!" "!value!" >nul
                )
            )
        )
    )
)

echo.
echo 所有环境变量已设置完成！
echo 注意：新环境变量可能需要重启终端或应用程序才能生效。
pause