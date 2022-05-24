#include <linux/module.h>
#include <linux/init.h>
#include <linux/sched.h>

static int hwNameID(void) {
    printk(KERN_ALERT "Hello World from CHRISTIAN (10450958)\n");
    return 0;
}
static void pidandname(void) {
    printk(KERN_ALERT "%d rmmod\n", current->pid);
}
module_init(hwNameID);
module_exit(pidandname);
