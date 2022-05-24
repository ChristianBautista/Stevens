import java.util.concurrent.Semaphore;
Semaphore mutexFelines = new Semaphore(1);
Semaphore mutexMice = new Semaphore(1);
Semaphore feedingLot = new Semaphore(N);
Semaphore mutex = new Semaphore(1);

int felines = 0;
int mice = 0;

20.times { //Felines
    Thread.start {
        mutex.acquire();
        mutexFelines.acquire();
        if(felines==0) {
            mutexMice.acquire();
        }
        felines++;
        mutexFelines.release();
        mutex.release();
        
        feedingLot.acquire();
        feedingLot.release();

        mutexFelines.acquire();
        if(felines==1) {
            mutexMice.release();
        }
        felines--
        mutexFelines.release();
    }
}

20.times { //Mice
    Thread.start {
        mutex.acquire();
        mutexMice.acquire();
        if(mice==0) {
            mutexFeline.acquire();
        }
        mice++;
        mutexMice.release();
        mutex.release();

        feedingLot.acquire();
        feedingLot.release();

        mutexMice.acquire();
        if(mice==1) {
            mutexFeline.release();
        }
        mice--;
        mutexMice.release();
    }
}