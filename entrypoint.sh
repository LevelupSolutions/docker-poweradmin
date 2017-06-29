#!/bin/sh

SESSION_KEY="$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c"${1:-32}"; echo)"
export SESSION_KEY

MYSQL="mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} --host=${MYSQL_HOST}"

if echo "QUIT;" | $MYSQL "$MYSQL_DB" >/dev/null 2>&1; then
    echo "Database ${MYSQL_DB} already exists"
else
    $MYSQL -e "CREATE DATABASE ${MYSQL_DB}"
    $MYSQL "$MYSQL_DB" < /poweradmin.sql
    rm /poweradmin.sql
fi

exec apache2-foreground
