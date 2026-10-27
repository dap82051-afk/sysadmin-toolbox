#!/bin/bash
# Создаем бекап(резервную копию)
#Если этот бекап пропишите в unit файл в качестве ExecStart, то лчше использутйе Type=oneshot
tar -czf /backup/www-$(date +%Y-%m-%d).tar.gz /var/www
