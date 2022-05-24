/* Solution 1
Semaphore ticket = new Sempahore(0);
Semaphore mutex = new Sempahore(1,true);
NP.times {
    Thread.start { //Patriots
        ticket.release();
    }
}

NJ.times {
    Thread.start { //Jets
        mutex.acquire();
        ticket.acquire();
        ticket.acquire();
        mutex.release();
    }
}
*/

Semaphore ticket = new Sempahore(0);
Semaphore mutex = new Sempahore(1,true);
NP.times {
    Thread.start { //Patriots
        ticket.release();
    }
}

NJ.times {
    Thread.start { //Jets
        if(!lateFlag) {
            mutex.acquire();
            ticket.acquire();
            ticket.acquire();
            mutex.release();
        }
    }
}

Thread.start {
    sleep(x);
    lateFlag=true;
    ticket.release();
    ticket.release();
}