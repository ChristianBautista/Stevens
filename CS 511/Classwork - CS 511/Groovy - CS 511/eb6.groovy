import java.util.concurrent.*;

// // Exercise 2. (♦)We wish to implement a three-way sequencer using monitors in order to coordinate N threads.  
// // A three-way sequencer provides the following operations first,second,third.  The idea is that each of 
// // the threads can invoke any of these operations.  The sequencer will alternate cyclically the execution
// // of first, then second, and finally third.

class ThreeWaySequencer {
    int state = 1;

    synchronized void first() {
        while (state !=1) {
            wait();
        }
        //exectute operation
        state = 2;
        notifyAll(); //notify() may wake a thread which will end up waiting() (ie: deadlock)
    }

    synchronized void second() {
        while (state !=2) {
            wait();
        }
        //exectute operation
        state = 3;
        notifyAll(); //notify() may wake a thread which will end up waiting() (ie: deadlock)
    }

    synchronized void third() {
        while (state != 3) {
            wait();
        }
        //execute operation
        state = 1;
        notifyAll(); //notify() may wake a thread which will end up waiting() (ie: deadlock)
    }

}

ThreeWaySequencer tws = new ThreeWaySequencer();

N.times {
    int r = 1 + (new Random()).nextInt(2); // random # b/w 1 & 3
    Thread.start {
        if (r==1) {
            tws.first();
        } else if (r==2) {
            tws.second();
        } else {
            tws.third();
        }
    }
}

//Exercise 3: - Countdown latch OR non-cyclic barrier
    // challenge: make this a cyclic barrier (ie: so it can be reused)

class Barrier {

    // my solution: works
    // int waits = 3;
    // synchronized void waitAtBarrier() {
    //     waits--;
    //     while (waits !=0) {
    //         wait();
    //     }
    //     signal(); //or signalAll();
    // }

    //in-class solution:
    final int N = 3;
    int c=0;

    synchronized void waitAtBarrier() {
        c++;
        while(c<N) {
            wait();
        }
        signal();
    }
}

Barrier myBarrier = new Barrier();

thread T1: {
    print('a');  
    myBarrier.waitAtBarrier(); 
    print(1);
}

thread T2:{
    print('b');  
    myBarrier.waitAtBarrier();  
    print(2);
}

thread T3:{
    print('c');  
    myBarrier.waitAtBarrier();  
    print(3);
}

//------------------
//Exercise 4: similar to Train exercise from eb5.

import  java.util.concurrent.locks.*;
class  TrainStation {

    boolean nt = true; //true = avail. false = unavail
    boolean st = true; 

    Lock lock = new ReentrantLock(); 
    Condition northTrack = lock.newCondition(); //wait if being used.
    Condition southTrack = lock.newCondition(); // signal once its NOT being used.

    void  acquireNorthTrackP() {
        lock.lock();    // locks method
        try {
            while(!nt) { // while nt is unavailable, place thread in wait set of northTrack
                northTrack.wait();
            }
            nt = false; //acquiring northTrack, ie: making nt unavailable

        } finally {
            lock.unlock();
        }
    }
    
    void  releaseNorthTrackP() {
        lock.lock();
        try {
            // while (!nt) {   //include while conditional bc it will prevent 2 signals. (2 signals could result in 2 trains acquiring permission to use north track.)
            //     northTrack.signal();
            // } // not sure if while loop is neccessary. might need to change to if
            nt = true; //set nt to be available
            northTrack.signal();

        } finally {
            lock.unlock();
        }
    }
    
    //symmetric to north:
    void  acquireSouthTrackP() {
        lock.lock();
        
    }

    void  releaseSouthTrackP() {
        lock.lock();
        
    }
    
    void acquireTracksF() {
        lock.lock();
        try {
             // if both tracks are unavailable, wait until they are available
            while (!nt) {//acquire north track first   
                northTrack.wait();
            }
            nt = false;

            while (!st) { {//acquire south track last
                // freight trains placed in waiting queue of southTrack cond var will already have acquired north track. (ie: waitset of southtrack will contain passanger trains and up to only 1 frieght train.)
                southTrack.wait();

            }
            st = false;
        } finally {
            lock.unlock();
        }
        
    }

    // problem: northtrack.signal and southtrack.signal may awaken a different frieght train thread. How to solve? A: this problem is solved by waiting on the 2 cond vars seperately.

    void  releaseTracksF() {
        lock.lock();
        try {
            //signal both tracks
            if (!nt) {
                northTrack.signal();   
            }

            if (!st) {
                southTrack.signal();
            }

            nt = true; // set both tracks as available
            st = true;
        } finally {
            lock.unlock();
        }
    }
}
TrainStation s = new TrainStation();
10. times {
    int id = it;
    Thread.start { //  Freight  Train  going  in any  direction
        s.acquireTracksF();
        print "FT${id} ";
        s.releaseTracksF()
    }
}

100.times {
    int id = it;
    Thread.start { //  Passenger  Train  going  North
        s.acquireNorthTrackP();
        print "NPT${id} ";
        s.releaseNorthTrackP()
    }
}

100.times { 
    int id = it;
    Thread.start { //  Passenger  Train  going  
        s.acquireSouthTrackP();
        print "SPT${id} ";
        s.releaseSouthTrackP()
    }
}

// Exercise 5: inefficient

Class SmartGrid {
    int num_p = 0;  // #producers
    int num_c = 0; // #consumers
    final int max_p = N;   // pt2: max # of producers allowed

    synchronized void startConsuming() {
        while (num_c >= num_p) {
            wait();
        }
        num_c++;
        notifyAll();
    }

    synchronized void stopConsuming() {
        num_c--;
        notifyAll();
    }

    synchronized void startProducing() {

        while (num_p >= max_p) {    // while loop added for pt 2
            wait();                 // while loop added for pt 2
        }                           // while loop added for pt 2

        num_p++;
        notifyAll();
    }

    synchronized void stopProducing() { //solution for pt 1 & 2
        while (num_p <= num_c) {
            wait();
        }
        num_p--;
        notifyAll();
    }

    synchronized void stopProducing() { //solution for pt 3
        if (num_p <= num_c) {
            num_c--;
        }
        num_p--;
        notifyAll();
    }
}

SmartGrid grid = new SmartGrid();

10.times {
    Thread.start {
        grid.startConsuming();
        sleep(1h);
        grid.stopConsuming();
        grid.startProducing );
        sleep(2h);
        grid.stopProducing();
    }
}


// Exercise 5: EFFICIENT VERSION (using explicit Locks & Cond Vars)

Class SmartGrid {
    int num_p = 0;
    int num_c = 0;
    final int max_p = N;
    
    Lock lock = new ReentrantLock();

    Condition produce = lock.newCondition();
    Condition consume = lock.newCondition();

void startConsuming() {
    lock.lock();
    try {
        while (num_c >= num_p) {
            consume.wait();
        }
        num_c++;
    } finally {
        lock.unlock();
    }
}

void stopConsuming() {
    lock.lock();
    try {
        num_c--;
        producer.signal();
    } finally {
        lock.unlock();
    }
}

void startProducing() {
    lock.lock();
    try {
        while (num_p >= max_p) {
            producer.wait();
        }
        num_p++;
        consume.signal();
    } finally {
        lock.unlock();
    }
}

void stopProducing() {
    lock.lock();         
    try {
        while (num_p <= num_c) {
            producer.wait();
        }
        num_p--;
        producer.signal();
    } finally {
        lock.unlock();
    }
}

    /* Producer Priority
    void stopProducing() { 
        lock.lock();
        try {
            if (num_p <= num_c) {
                num_c--;
            }
            num_p--;
            producer.signal();
        } finally {
            lock.unlock();
        }
    }    
    */   

}

SmartGrid grid = new SmartGrid();

10.times {
    Thread.start {
        grid.startConsuming();
        sleep(1h);
        grid.stopConsuming();
        grid.startProducing );
        sleep(2h);
        grid.stopProducing();
    }
}

//exericse 7:

class pizzaShop {

    //num pizzas on counter
    int small = 0;  
    int large = 0;
    int counterCap = N;

    Lock lock = new ReentrantLock();
    Condition prod = new lock.newCondition();
    Condition cons = new lock.newCondition();

    void produceSmall() {
        lock.lock();
        try {
            while (small + large >= counterCap) {
                prod.wait();
            }
            small++;
            cons.signal();
        } finally {
            lock.unlock();
        }
    }

    void produceLarge() {
        lock.lock();
        try {
            while (small + large >= counterCap) {
                prod.wait();
            }
            large++;
            cons.signal();
        } finally {
            lock.unlock();
        }
    }

    void consumeLarge() {
        lock.lock();
        try {        
            if (large == 0) {
                if (small >=2) {
                    small--;
                    small--;
                } else {
                    while (large !=0) {
                        cons.wait();
                    }
                    large--;
                }
            } else {
                large--;
            }
            prod.signal();
        } finally {
            lock.unlock();
        }
    }
    
    void consumeSmall() {
        lock.lock();
        try {
            while (small <= 0) {
                cons.wait();
            }
            small--;
            prod.signal();
        } finally {
            lock.unlock();
        }
    }
}

pizzaShop p = new pizzaShop();

10.times {
    Thread.start {
        p.produceSmall();       
    }
}


10.times {
    Thread.start {
        p.produceLarge();       
    }
}


5.times {
    Thread.start {
        p.consumeSmall();       
    }
}


15.times {
    Thread.start {
        p.consumeLarge();       
    }
}