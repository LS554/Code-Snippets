savedcmd_km.mod := printf '%s\n'   km.o | awk '!x[$$0]++ { print("./"$$0) }' > km.mod
