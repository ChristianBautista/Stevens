/*
Quiz 3B - 29 Sep 2021

Names: Christian Bautista & Ankit Patel
Pledge: I pledge my honor that I have abdied by the Stevens Honor System.

You may not add print statements. 
You may declare semaphores (as many as you want) and make use of 
acquire and release operations.
You must ensure that the output is:

byebyebyebye....

*/

import java.util.concurrent.Semaphore;

Semaphore BbeforeY = new Semaphore(0);
Semaphore YbeforeE = new Semaphore(0);
Semaphore newWord = new Semaphore(1);

Thread.start { // P

    while (true) {
        newWord.acquire();
	    print("b");
        BbeforeY.release();
    }
}

Thread.start { // Q

    while (true) {
        BbeforeY.acquire();
	    print("y");
        YbeforeE.release();
    }
}

Thread.start { // R

    while (true) {
        YbeforeE.acquire();
	    print("e");
        newWord.release();
    }
}