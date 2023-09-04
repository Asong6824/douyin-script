cls && cd %~dp0
@echo off
@REM 参数初始化----------------------------------------------------------------
CALL 00.docker-set.cmd && cd %~dp0
@REM 容器-停止所有容器的运行---------------------------------------------------
for /f "skip=1" %%i in ('docker ps -aq') do (
    docker stop %%i
)
@REM 镜像-下载-----------------------------------------------------------------
docker pull %IMG_ORIG%
@REM 容器-删除-----------------------------------------------------------------
docker rm -f %CON_NAME% >nul 2>&1 || (echo No such container & exit /b 0)
@REM 容器-创建和运行-----------------------------------------------------------
docker run -dit                             ^
    --net=bridge                            ^
    --restart=always                        ^
    --privileged=true                       ^
    --publish 2022:22                       ^
    --publish 2080:80                       ^
    --publish 8080:8080                     ^
    --volume %WIN_PATH%\binary:%RUN_PATH%   ^
    --volume %WIN_PATH%\source:%DEV_PATH%   ^
    --volume %WIN_PATH%\script:%SCR_PATH%   ^
    --name %CON_NAME% %IMG_ORIG%:%TAG_NAME%
@REM 容器-列表-----------------------------------------------------------------
docker ps -a
@REM 暂停----------------------------------------------------------------------
pause
