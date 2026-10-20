#!/bin/sh
# >>> isoloom-1.0 secret-from-file shim (auto-added by convert-lab.py) >>>
# Inputs now arrive as files (isoloom.yml `files:`), not environment variables.
# Read each into its old variable when unset, keeping the dev/CI fallback working.
for __p in CTF_FLAG_MAIN:/run/lab/ctf_flag_main; do
  __n=${__p%%:*}; __f=${__p#*:}
  eval "__v=\${$__n:-}"
  if [ -z "$__v" ] && [ -s "$__f" ]; then
    __v=$(tr -d '\r\n' < "$__f"); eval "export $__n=\"\$__v\""
  fi
done
unset __p __n __f __v 2>/dev/null || true
# <<< isoloom-1.0 secret-from-file shim <<<
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) as the clear-text password of a seeded top player;
# without one (CI, a run by hand) the development flag.
dev='FLAG{dev-secdevlabs-snake-pro}'
flag="${CTF_FLAG_MAIN:-$dev}"
i=0; until mongo --quiet --eval 'db.runCommand({ping: 1})' >/dev/null 2>&1; do i=$((i+1)); [ $i -gt 90 ] && exit 1; sleep 2; done
mongo --quiet snake_pro --eval "var flag = '$flag'; db.users.deleteMany({username: 'snakemaster'}); db.users.insertOne({username: 'snakemaster', password: flag, userID: 'snakemaster-0001', 'highest-score': 9999});"
