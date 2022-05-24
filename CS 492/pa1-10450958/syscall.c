#include <stdio.h>
#include <linux/kernel.h>
#include <sys/syscall.h>
#include <unistd.h>

int main() {
    char string1[] = "This string has too many characters";
    char string2[] = "Adieu my lady";
    long v1 = 0;
    long v2 = 0;

    printf("%s\n",string1);
    v1 = syscall(548, string1);
    printf("%d\n",v1);
    printf("%s\n",string1);

    printf("%s\n",string2);
    v2 = syscall(548, string2);
    printf("%d\n",v2);
    printf("%s\n",string2);

    return 0;
}
