#!/bin/bash



PUID=${PUID:-911}
PGID=${PGID:-911}

if [ ! "$(id -u abc)" -eq "$PUID" ]; then usermod -o -u "$PUID" abc ; fi
if [ ! "$(id -g abc)" -eq "$PGID" ]; then groupmod -o -g "$PGID" abc ; fi

echo "
-----------------------------------
          _     _ _
         | |___| (_) ___
         | / __| | |/ _ \ 
         | \__ \ | | (_) |
         |_|___/ |_|\___/
               |_|

Based on great work by linuxserver.io
-----------------------------------
GID/UID
-----------------------------------
User uid:    $(id -u abc)
User gid:    $(id -g abc)
-----------------------------------
"
chown abc:abc /app
chown abc:abc /config
chown abc:abc /defaults
