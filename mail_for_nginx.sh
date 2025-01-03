#!/bin/bash
echo -e "Статистика формируется каждый час, за все время \n"

echo -e "Список IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта."
awk '{print $1}' /var/log/nginx/access.log* | sort| uniq -c | sort -n

echo -e "Список запрашиваемых URL (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта."
awk '{print $6$7$8}' /var/log/nginx/access.log* | sort| uniq -c | sort -n

echo -e "Ошибки веб-сервера/приложения c момента последнего запуска."
cat /var/log/nginx/error.log* | sort | uniq -c

echo -e  "Список всех кодов HTTP ответа с указанием их кол-ва с момента последнего запуска скрипта."
awk '{print $9}' /var/log/nginx/access.log* | grep -P "[0-9]{3}" | sort | uniq -c| sort -n
