#!/bin/sh

export MYSQL_HOST="${MYSQL_HOST:-db}"
export MYSQL_PORT="${MYSQL_PORT:-3306}"
export MYSQL_USER="${MYSQL_USER:-root}"
export MYSQL_PASSWORD="${MYSQL_PASS:-$DB_ENV_MYSQL_ROOT_PASSWORD}"
export MYSQL_DB="${MYSQL_DB:-pdns}"

export POWERADMIN_HOSTMASTER=${POWERADMIN_HOSTMASTER:-}
export POWERADMIN_NS1=${POWERADMIN_NS1:-}
export POWERADMIN_NS2=${POWERADMIN_NS2:-}

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
