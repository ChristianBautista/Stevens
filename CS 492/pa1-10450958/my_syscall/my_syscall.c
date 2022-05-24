#include <linux/syscalls.h>
#include <linux/printk.h>
#include <linux/kernel.h>

SYSCALL_DEFINE1(christian_syscall, char *, string) {
    char s[32];
    long l;
    int i = 0;
    char c;
    int count = 0;
    long errs = 0;

    if(string==NULL) {
	return -1;
    }
    l = strnlen_user(string,32);
    if(l>32) {
	return -1;
    }
    errs = strncpy_from_user(s,string,32);
    if(errs<0 || errs>l) {
	return -1;
    }
    printk(KERN_ALERT "before: %s\n",s);
    while(i<(l-1)) {
	c = s[i];
	if(c=='a' || c=='e' || c=='i' || c=='o' || c=='u' || c=='y') {
            s[i] = 'X';
	    count++;
        }
	if(c=='A' || c=='E' || c=='I' || c=='O' || c=='U' || c=='Y') {
	    s[i] = 'X';
	    count++;
	}
        i++;
    }
    errs = copy_to_user(string,s,l);
    if(errs!=0) {
	return -1;
    }
    printk(KERN_ALERT "after: %s\n",s);
    return count;
}
