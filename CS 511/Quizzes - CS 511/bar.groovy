/*
Quiz 5B - 15 Oct 2021

Name1: Christian Bautista
Name2: Ankit Patel
Pledge: I pledge my honor that I have abided by the Stevens Honor System.

*/
//import java.util.concurrent.locks.*;

class Bar {
    int pt=0; // for printing state
    int jt=0; // for printing state

    // your code here
    int perm = 0;
    //Lock lock = new ReentrantLock();
    //Condition jets = lock.newCondition();

    synchronized void patriots() {
        // complete
        
        perm++;
        if(perm>=2) {
            notify();
        }

        pt++;
        printState();

        }

    synchronized void jets() {
        // complete

        while(perm<2) {
            wait();
        }
        perm-=2;

        jt++;
        printState();
        
    }
   synchronized printState() {
        println "pt: "+pt+", jt: "+jt+", jt/pt: "+jt/pt;
    }
}
  
Bar b = new Bar();

// Following code will allow all patriots fans to go in, but only 50 jets fans.
100.times {
    Thread.start {// jets
	b.jets();
    }
}

100.times {
    sleep(100); // delay patriots' entry
    Thread.start {// patriots
	b.patriots();
    }
}

