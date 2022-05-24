bool wantP = false;
bool wantQ = false;
byte cr = 0;

proctype P() {
    do
        :: wantP = true;
        do
            :: !wantQ -> break;
            :: else
        od;
        /*
        cr++;
        assert(cr==1);
        cr--;
        */
        progress1:
        wantP = false;
    od
}

proctype Q() {
    do
        :: wantQ = true;
        do
            :: !wantP -> break;
            :: else
        od;
        /*
        cr++;
        assert(cr==1);
        cr--;
        */
        progress2:
        wantQ = false;
    od
}

init {
    atomic {
        run P();
        run Q();
    }
}