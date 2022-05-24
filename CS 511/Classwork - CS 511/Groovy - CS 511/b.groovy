class Barrier {
    final int N = 3;
    int c = 0

    public synchronized void waitAtBarrier() {
        c++;
        while(c<N) {
            wait();
        }
        notify();
    }
}

Barrier b = new Barrier();

Thread.start {
    print('a');
    b.waitAtBarrier();
    print(1);
}
Thread.start {
    print('b');
    b.waitAtBarrier();
    print(2);
}
Thread.start {
    print('c');
    b.waitAtBarrier();
    print(3);
}
