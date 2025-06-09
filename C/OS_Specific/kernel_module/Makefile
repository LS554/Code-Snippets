obj-m := km.o

#all:
#	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

#module:
#	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
#	rm *.mod* *.o module* Module* .k* .m* .M* ..m*

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	@rm *.mod* *.o module* Module* .k* .m* .M* ..m*

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	@rm *.mod* *.o module* Module* .k* .m* .M* ..m* *.ko

load:
	@sudo insmod km.ko
	@sudo dmesg | tail

unload:
	@sudo rmmod km
	@sudo dmesg | tail
