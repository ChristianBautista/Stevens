import java.util.concurrent.locks.*;

class PC {
    private Object buffer;
    Lock lock = new ReentrantLock();
    Condition empty = lock.newCondition();
    Condition full = lock.newCondition();
    
    public synchronized void produce(Object o) {
        lock.lock();
        try {
            while(buffer!=null) {
                empty.await();
            }
            buffer = o;
            full.signal();
        } finally {
            lock.unlock();
        }
    }

    public synchronized Object consume() {
        lock.lock(); 
        try {
            while(buffer==null) {
                full.await();
            }
            Object temp = buffer;
            buffer = null;
            empty.signal();
            return temp;
        } finally {
            lock.unlock();
        }
    }
}

PC b = new PC();

10.times {
    int id = it;
    Thread.start { //Producer
        println "${id} produced an item";
        b.produce((new Random()).nextInt(33));
    }
}

10.times {
    int id = it;
    Thread.start { //Consumer
        println "${id} consumed an item";
        b.consume();
    }
}