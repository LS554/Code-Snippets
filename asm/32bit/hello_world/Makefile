CC = nasm
CFLAGS = -f elf
LD = ld
LDFLAGS = -m elf_i386

all:
	$(CC) $(CFLAGS) -o hello.o hello.asm
	$(LD) $(LDFLAGS) -o hello hello.o
clean:
	rm -f hello.o hello