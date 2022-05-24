/* Size 1 Example

Object buffer; //size 1
Semaphore consume = new Sempahore(0);
Sempahore produce = new Sempahore(1);

10.times {
    Thread.start { //Producer
        produce.acquire();
        buffer = produceItem();
        consume.release;
    }
}

Thread.start { //Consumer
    consume.acquire();
    consumeItem(buffer);
    produce.release:
}

*/

Object buffer; //size n
Semaphore consume = new Sempahore(0);
Sempahore produce = new Sempahore(N);
Semaphore mutexP = new Semaphore(1);
Sempahore mutexC = new Semaphore(1);
int start = 0;
int rear = 0;
final int NP = 100;
final int NC = 40;

NP.times {
    Thread.start { //Producer
        produce.acquire();
        mutexP.acquire();
        buffer[start] = produceItem();
        start = (start+1) % N;
        mutexP.release();
        consume.release;
    }
}

NC.times {
    Thread.start { //Consumer
        consume.acquire();
        mutexC.acquire();
        consumeItem(buffer[rear]);
        rear = (rear+1) % N;
        mutexC.release();
        produce.release:
    }
}