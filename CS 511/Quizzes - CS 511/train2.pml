#define PT 10 /* Number of Passenger Trains */
#define FT 5 /* Number of Freight Trains */

byte permToLoad = 0;
byte doneLoading = 0;
byte track[2];
byte mutex = 1;

byte f = 0;
byte p = 0;

inline acquire ( s ) {
    atomic {
        s>0 -> s--
    }
}

inline release ( s ) {
    s++
}

proctype PassengerTrain (int i ) {
    acquire(track[i]);
    p++;
    assert(f==0);
    p--;
    release(track[i]);
}

proctype FreightTrain () {
    acquire(mutex);
    acquire(track[0]);
    acquire(track[1]);
    f++;
    assert(f==1 && p==0);
    release(mutex);
    release(permToLoad);
    acquire(doneLoading);
    f--;
    release(track[0]);
    release(track[1]);
}

proctype LoadingMachine () {
    do
        :: acquire(permToLoad);
           assert(f==1 && p==0);
           release(doneLoading);
    od
}

init {
    byte i ;

    track [0]=1;
    track [1]=1;

    atomic {
        for ( i :1..( PT )) { /* spawn passenger trains */
            do /* randomly choose a direction */
                :: run PassengerTrain(0); break;
                :: run PassengerTrain(1); break;
            od
        }

        for ( i :0..( FT )) { /* spawn freight trains */
            run FreightTrain();
        }
        run LoadingMachine(); /* spawn loading machine */
    }
}