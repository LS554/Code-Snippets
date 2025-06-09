#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("Dual BSD/GPL");

int init_module() {
  printk(KERN_INFO "My module loaded!\n");
  return 0;
}

void cleanup_module() {
  printk(KERN_INFO "My module unloaded!\n");
}

