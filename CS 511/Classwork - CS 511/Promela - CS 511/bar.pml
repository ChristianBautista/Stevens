byte ticket = 0;
byte mutex = 1;
byte jets = 0;
byte pats = 0;


inline acquire(sem) {
    atomic {
        sem>0 -> sem--
    }
}

inline release(sem) {
    sem++
}

active [20] proctype Jets() {
    acquire(mutex);
    acquire(ticket);
    acquire(ticket);
    jets++;
    printf("Pats: %d\nJets: %d",pats,jets);
    release(mutex);
}

active [20] proctype Patriots() {
    pats++;
    printf("Pats: %d\nJets: %d",pats,jets);
    release(ticket);
}