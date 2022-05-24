byte c=0;

proctype P() {
    byte tmp=0;
    byte i=0;
    do
        :: i<10 ->
            tmp=c;
            c=tmp+1;
            i++;
        :: else ->
            break
    od
}

proctype Q() {
    byte tmp=0;
    byte i=0;
    do
        :: i<10 ->
            tmp=c;
            c=tmp+1;
            i++;
        :: else ->
            break
    od
}

init {
    atomic {
        run P();
        run Q();
    }
    (_nr_pr==1); /* guard */
    printf("Total: %d\n",c);
    assert(c>2);
}