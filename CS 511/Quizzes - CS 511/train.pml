#define PT 10 /* Number of Passenger Trains */
#define FT 5 /* Number of Freight Trains */

byte permToLoad = 0;
byte doneLoading = 0;
byte track [2];
byte mutex =1;

inline acquire ( s ) {
    atomic {
        s>0 -> s--
    }
}

inline release ( s ) {
    s++
}

proctype PassengerTrain (int i ) {
    printf("PT acquiring track %d", i);
    acquire(track[i]);
    printf("PT releasing track %d", i);
    release(track[i]);
}

proctype FreightTrain () {
    acquire(mutex);
    printf("FT waiting for track 0");
    acquire(track[0]);
    printf("FT waiting for track 1");
    acquire(track[1]);
    release(mutex);
    printf("FT permission to load");
    release(permToLoad);
    printf("FT waiting for done loading");
    acquire(doneLoading);
    printf("FT releasing track 0");
    release(track[0]);
    printf("FT releasing track 1");
    release(track[1]);
}

proctype LoadingMachine () {
    do
        :: acquire(permToLoad);
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
                :: run PassengerTrain (0); break;
                :: run PassengerTrain (1); break;
            od
        }

        for ( i :0..( FT )) { /* spawn freight trains */
            run FreightTrain ();
        }
        run LoadingMachine (); /* spawn loading machine */
    }
}