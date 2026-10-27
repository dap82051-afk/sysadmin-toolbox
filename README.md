# SysAdmin Toolbox

Коллекция **готовых для продакшена** юнитов systemd, скриптов и конфигов для быстрой настройки VDS.

## Что внутри

- **`systemd-units/`** — Захарденепные юниты для **Nginx**, **Docker**, **PostgreSQL**(позже добавлю).
- **`scripts/`** — Скрипты для **бэкапа** и **мониторинга** диска.
- **`configs/`** — Шаблоны для **UFW** и **Fail2ban**.

## Зачем это нужно

Стандартные юниты в Ubuntu/Debian **не** защищены (`systemd-analyze security` показывает **9.6 UNSAFE**). Я **харденил** их (снизил риск до **8.0-8.7**), используя:
- `PrivateTmp=yes` — изолируем временные файлы `/tmp`.
- `ProtectSystem=strict` — read-only для всей файловой системы (соответственно кроме `ReadWritePaths`) Strict использовался только для долгоживущих сервисов.
- `ProtectHome=yes` — скрываем от процессов сервиса домашние директории `/home` и `/root`. Или можно было перевести в режим read-only.
- `NoNewPrivileges=yes` — запрещаем повышения прав.

**Пример:** для Nginx рейтинг упал с **9.6** до **8.7**. Подробный разбор — в `systemd-units/nginx/README.md`.

## Как использовать

1. Клонируй репозиторий:
   ```bash
   git clone https://github.com/dap82051-afk/sysadmin-toolbox.git
