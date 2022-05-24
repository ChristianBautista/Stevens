/*  Ankit Patel & Christian Bautista
*   cs 511 hw 2
*   Bakery.java
*   I pledge my honor that I have abided by the Stevens Honor System.
*/

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

public class Bakery implements Runnable {
    private static final int TOTAL_CUSTOMERS = 200;
    private static final int ALLOWED_CUSTOMERS = 50;
    private static final int FULL_BREAD = 20;
    private Map<BreadType, Integer> availableBread; //#bread for each type
    private ExecutorService executor;
    private float sales = 0;

    Map<BreadType,Integer> dict; // Map each BreadType to an integer from 0 to 2.

    Semaphore[] shelves = {new Semaphore(1), new Semaphore(1), new Semaphore(1)}; // 1 semaphore for each bread shelf
    Semaphore checkout = new Semaphore(4, true);  // 4 cashiers. Strong semaphore to simulate a checkout queue.
    Semaphore salesUpdate = new Semaphore(1);   //the sales variable must be updated atomically

    /**
     * Remove a loaf from the available breads and restock if necessary
     */
    public void takeBread(BreadType bread) {    
        //No need for mutex in takeBread when restocking bc theres already a mutex in the customer thread
        // which executes the entire takeBread function for each bread atomically.
        int breadLeft = availableBread.get(bread);
        if (breadLeft > 0) {
            availableBread.put(bread, breadLeft - 1);
        } else {
            System.out.println("No " + bread.toString() + " bread left! Restocking...");
            // restock by preventing access to the bread stand for some time
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ie) {
                ie.printStackTrace();
            }
            availableBread.put(bread, FULL_BREAD - 1);
        }
    }

    /**
     * Add to the total sales
     */
    public void addSales(float value) {
        sales += value;
    }

    /**
     * Run all customers in a fixed thread pool
     */
    public void run() {
        availableBread = new ConcurrentHashMap<BreadType, Integer>();
        availableBread.put(BreadType.RYE, FULL_BREAD);
        availableBread.put(BreadType.SOURDOUGH, FULL_BREAD);
        availableBread.put(BreadType.WONDER, FULL_BREAD);

        //dictionary which makes each BreadType to an integer from [0,2]. (Makes semaphore management easier)
        dict = new ConcurrentHashMap<BreadType, Integer>();
        dict.put(BreadType.RYE, 0);
        dict.put(BreadType.SOURDOUGH, 1);
        dict.put(BreadType.WONDER, 2);

        int servicedCustomers;

        executor = Executors.newFixedThreadPool(ALLOWED_CUSTOMERS); // 50 threads (50 customers capacity in bakery)

        // execute 200 customers on the thread pool -- customers over-capacity are added to queue
        for (servicedCustomers = 0; servicedCustomers < TOTAL_CUSTOMERS; servicedCustomers++) {

            // Allow a customer to enter the bakery OR add them to the queue
            executor.execute(new Customer(this));
        }

        if(servicedCustomers == TOTAL_CUSTOMERS) {
            executor.shutdown();    //schedule shutdown of executor when all customers have been serviced
        }

        // wait for all threads to end (customers to leave)
        try {
            if (executor.awaitTermination(60,TimeUnit.SECONDS)) {
                System.out.println("All threads have terminated successfully.");
            } else {     // Failed to wait for termination of all threads, so forcefully terminate
                System.out.println("**Failed to wait for thread termination. Attempting to force terminate.**");
                executor.shutdownNow();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
         
        //Print the sales value:
        System.out.printf("SALES = $%.2f\n", sales);

    }
}