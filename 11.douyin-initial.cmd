cls && cd %~dp0
@echo off
@REM 参数初始化----------------------------------------------------------------
CALL 00.docker-set.cmd && cd %~dp0
@REM 容器-执行-----------------------------------------------------------------
docker exec -w %SCR_PATH% -it %CON_NAME% bash -c "bash douyin-initial.sh"
@REM 暂停----------------------------------------------------------------------
pause

