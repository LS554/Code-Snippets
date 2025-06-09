savedcmd_km.ko := ld -r -m elf_x86_64 -z noexecstack --no-warn-rwx-segments --build-id=sha1  -T /usr/src/kernels/6.14.9-300.fc42.x86_64/scripts/module.lds -o km.ko km.o km.mod.o .module-common.o
