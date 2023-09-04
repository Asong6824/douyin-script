<!-- 文件说明： -->

__cargotainer__                     安装包存放路径
__systemfiles__                     系统文件存放路径
__database__                        SQL脚本存放路径
00.docker-set.cmd                   WINDOWS脚本：docker变量初始化
01.docker_pull.cmd                  WINDOWS脚本：docker容器初始化
11.douyin-initial.cmd               WINDOWS脚本：安装相关系统工具、网络工具、开发工具
12.mysql-initial.cmd                WINDOWS脚本：mysql初始化，修改root密码、创建数据库（douyin）、创建表
31.douyin-commit.cmd                WINDOWS脚本：docker备份
35.douyin-reload-bridge.cmd         WINDOWS脚本：docker恢复，需桥接方式，可把内部端口映射为外部端口
99.douyin-inside.cmd                WINDOWS脚本：进入docker内部执行命令
douyin-initial.sh                   LINUX/DEBIAN脚本：安装相关系统工具、网络工具、开发工具
mysql_initial.sh                    LINUX/DEBIAN脚本：mysql初始化，修改root密码、创建数据库（douyin）、创建表
