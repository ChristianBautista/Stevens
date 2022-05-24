import  java.util.concurrent.locks.*;
class  TrainStation {

    boolean nt = true;
    boolean st = true; 

    Lock lock = new ReentrantLock(); 
    Condition northTrack = lock.newCondition();
    Condition southTrack = lock.newCondition();

    void acquireNorthTrackP() {
        lock.lock(); 
        try {
            while(!nt) {
                northTrack.wait();
            }
            nt = false; 

        } finally {
            lock.unlock();
        }
    }
    
    void releaseNorthTrackP() {
        lock.lock();
        try {
            nt = true;
            northTrack.signal();

        } finally {
            lock.unlock();
        }
    }
    
    void acquireSouthTrackP() {
        lock.lock(); 
        try {
            while(!st) {
                southTrack.wait();
            }
            nt = false; 

        } finally {
            lock.unlock();
        }        
    }

    void releaseSouthTrackP() {
        lock.lock();
        try {
            st = true;
            southTrack.signal();

        } finally {
            lock.unlock();
        }
    }
    
    void acquireTracksF() {
        lock.lock();
        try {
            while (!nt) {
                northTrack.wait();
            }
            nt = false;

            while (!st) { 
                southTrack.wait();
            }
            st = false;
        } finally {
            lock.unlock();
        } 
    }

    void releaseTracksF() {
        lock.lock();
        try {
            if (!nt) {
                northTrack.signal();   
            }
            if (!st) {
                southTrack.signal();
            }
            nt = true;
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