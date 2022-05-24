Sempahore resource = new Sempahore(1);
Semaphore mutex = new Sempahore(1);
Semaphore accessProtocol = new Sempahore(1,true);
final int NW = 100;
final int NR = 40;
int readers = 0;

NW.times {
    Thread.start { //Writer
        accessProtocol.acquire();
        resource.acquire(); //access protocol
        accessProtocol.release();
        //write to resource
        resource.release();
    }
}

NR.times {
    Thread.start { //Reader
        accessProtocol.acquire();
        mutex.acquire(); //access protocol
        if(readers==0) {
            resource.acquire();
        }
        readers++;
        mutex.release(); //end of access protocol
        accessProtocol.release();
        //reads from resource
        mutex.acquire();
        if(readers==1) {
            resource.release();
        }
        readers--;
        mutex.release();
    }
}