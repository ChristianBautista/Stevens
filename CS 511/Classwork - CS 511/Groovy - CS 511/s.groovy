class Semaphore {
    private int permits;
    
    Semaphore(int init) {
        permits = init;
    }

    public synchronized void acquire() {
        while(permits==0) {
            wait();
        }
        permits--;
    }

    public synchronized void release() {
        notify();
        permits++;
    }
}

Semaphore s = new Semaphore(1);
int c=0;

def P = Thread.start {
    10.times {
        s.acquire();
        c++;
        s.release();
    }
}

def Q = Thread.start {
    10.times {
        s.acquire();
        c++;
        s.release();
    }
}

P.join();
Q.join();
println c;