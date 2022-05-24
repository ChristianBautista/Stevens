inline acquire(s) {
    atomic {
        s>0;
        s--;
    }
}

inline release(s) {
    s++;
}

byte aAfterD=0;

proctype P() {
    acquire(aAfterD);
    printf("A\n");
    printf("B\n");
}

proctype Q() {
    printf("C\n");
    printf("D\n");
    release(aAfterD);
}