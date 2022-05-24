class TWS {
    private int state = 1;
    
    public synchronized void first() {
        while(state!=1) {
            wait();
        }
        state=2;
        println "1";
        notifyAll();
    }

    public synchronized void second() {
        while(state!=2) {
            wait();
        }
        state=3;
        println "2";
        notifyAll();
    }

    public synchronized void third() {
        while(state!=3) {
            wait();
        }
        state=1;
        println "3";
        notifyAll();
    }
}

TWS tws = new TWS();

3.times {
    int operation = (new Random()).nextInt(3);
    Thread.start {
        if(operation==0) {
            tws.first();
        } else if(operation==1) {
            tws.second();
        } else if(operation==2) {
            tws.third();
        }
    }
}