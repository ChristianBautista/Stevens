import java.util.concurrent.Semaphore;

final int N = 20;
// Declare all necessary semaphores here
Semaphore[] permToBoard = [new Semaphore(0),new Semaphore(0)]; // List of two semaphores
Semaphore permToContinue = new Semaphore(0);
Semaphore permToDisembark = new Semaphore(0);

Thread.start { // Ferry
    int coast=0;
    while (true) {
        // allow passengers on
        N.times {
            permToBoard[coast].release();
        }
        N.times {
            permToContinue.acquire();
        }
        // move to opposite coast
        coast = 1-coast;
        // wait for all passengers to get off
        N.times {
            permToDisembark.release();
        }
        N.times {
            permToContinue.acquire();
        }
    }
}

100.times {
    Thread.start { // Passenger on East coast
        // get on
        permToBoard[0].acquire();
        permToContinue.release();
        // get off at opposite coast
        permToDisembark.acquire();
        permToContinue.release();
    }
}

100.times {
    Thread.start { // Passenger on West coast
        // get on
        permToBoard[1].acquire();
        permToContinue.release();
        // get off at opposite coast
        permToDisembark.acquire();
        permToContinue.release();
    }
}