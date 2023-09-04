#!/bin/bash
# --MySQL连接信息----------------------------------------------------------------------------------
mysql_hostname="127.0.0.1"
mysql_database="douyin"
mysql_username="root"
mysql_password="123456"
mysql_oldpaswd=""
# --修改MySQL密码同时修改phpmyadmin连接密码--------------------------------------------------------
/opt/lampp/bin/mysql -u"${mysql_username}" -p"${mysql_oldpaswd}" -h"${mysql_hostname}" -e "ALTER USER '${mysql_username}'@'localhost' IDENTIFIED BY '${mysql_password}';"
phpmyadmin_cnf="/opt/lampp/phpmyadmin/config.inc.php"
sed -i "s/\$cfg\['Servers'\]\[\$i\]\['password'\] = '';/\$cfg\['Servers'\]\[\$i\]\['password'\] = '${mysql_password}';/" "${phpmyadmin_cnf}"
# --删除已存在的数据库并创建新的数据库-------------------------------------------------------------
/opt/lampp/bin/mysql -u"${mysql_username}" -p"${mysql_password}" -h"${mysql_hostname}" -e "DROP DATABASE IF EXISTS ${mysql_database};"
/opt/lampp/bin/mysql -u"${mysql_username}" -p"${mysql_password}" -h"${mysql_hostname}" -e "CREATE DATABASE ${mysql_database};"
/opt/lampp/bin/mysql -u"${mysql_username}" -p"${mysql_password}" -h"${mysql_hostname}" -e "USE ${mysql_database};"
# --遍历目录中的所有SQL文件------------------------------------------------------------------------
sql_files_dir="./__database__"
for file in "${sql_files_dir}"/*.sql; do
    if [ -f "$file" ]; then
        echo "Executing SQL file: $file"
        /opt/lampp/bin/mysql -u"${mysql_username}" -p"${mysql_password}" -h"${mysql_hostname}" "${mysql_database}" < "$file"
    fi
done
