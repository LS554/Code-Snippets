ASM= nasm
ASMFLAGS= -felf64

LD= ld
LDFLAGS= 

SRC= hello.asm
TARGET= hello.o
OBJ= hello

all:
	$(ASM) $(ASMFLAGS) $(SRC) -o $(TARGET)
	$(LD) $(LDFLAGS) $(TARGET) -o $(OBJ)

$(OBJ):
	$(ASM) $(ASMFLAGS) $(SRC) -o $(TARGET)
	$(LD) $(LDFLAGS) $(TARGET) -o $(OBJ)
	rm $(TARGET)

clean:
	rm $(TARGET) $(OBJ)
