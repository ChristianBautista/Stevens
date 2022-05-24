/*  Ankit Patel & Christian Bautista
*   cs 511 hw 2
*   Customer.java
*   I pledge my honor that I have abided by the Stevens Honor System.
*/

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class Customer implements Runnable {
    private Bakery bakery;
    private Random rnd;
    private List<BreadType> shoppingCart;   //shopping list
    private int shopTime;
    private int checkoutTime;

    /**
     * Initialize a customer object and randomize its shopping cart
     */
    public Customer(Bakery bakery) {
        this.bakery = bakery;
        
        // randomly generate shopTime & checkoutTime:
        // Let times be between 0.10 and 0.20 seconds
        rnd = new Random();
        shopTime = 100 + rnd.nextInt(100);
        checkoutTime = 100 + rnd.nextInt(100);
        // shopTime = 0;
        // checkoutTime = 0;

        // instantiate the shoppingCart (shopping list)
        shoppingCart = new ArrayList<BreadType>();

        //generate the customer's shopping list
        fillShoppingCart();

        // System.out.println("cust obj initialized: st: " + this.shopTime + "ck: " + this.checkoutTime);
    }

    /**
     * Run tasks for the customer
     */
    public void run() {
        
        // received permission to enter bakery
        // System.out.println("Customer " + hashCode() + " has entered the bakery & started shopping w/ shopping list:" + Arrays.toString(shoppingCart.toArray()));
        System.out.println(toString() + ", has entered the bakery.");

        for(BreadType b: shoppingCart) {
            // wait for shelf to clear if necessary ie: get permission to go to shelf
            try {
                bakery.shelves[bakery.dict.get(b)].acquire();
                System.out.println("Customer " + hashCode() +  " is accessing the " + b.name() + " shelf.");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            // fill shopping cart of customer (ie: remove bread from shelves)
            // System.out.println("Customer " + hashCode() + " is about to take " + b.name() + " from shelf.");
            bakery.takeBread(b);
            System.out.println("Customer " + hashCode() + " took " + b.name() + " from shelf.");

            // sleeping simulates the time spent shopping (shopping = taking bread from shelf)
            // sleep a bit each time customer takes bread from shelf
            try {
                Thread.sleep(shopTime/shoppingCart.size());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        
            System.out.println("Customer " + hashCode() +  " is leaving the " + b.name() + " shelf.");
            bakery.shelves[bakery.dict.get(b)].release(); // leave shelf - give back shelf permission
        }

        //after customer is done shopping:
        // go to checkout (wait in line if necessary) - ie: get permission to go to checkout
        try {
            System.out.println("Customer " + hashCode() + " is done shopping and is attempting to checkout."); 
            bakery.checkout.acquire();
            System.out.println("Customer " + hashCode() + " is now at the checkout.");
        } catch (InterruptedException e1) {
            e1.printStackTrace();
        }
        
        // wait for some time to simulate the checkout process
        try {
            Thread.sleep(checkoutTime);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // sales variable must be updated atomically
        try {
            bakery.salesUpdate.acquire();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        bakery.addSales(getItemsValue());   //update the bakery's sales
        System.out.printf("At checkout, Customer %d bought $%.2f of bread.%n", hashCode() ,getItemsValue());

        bakery.salesUpdate.release();

        // checkout complete. leave checkout - give back checkout permission
        System.out.println("Customer " + hashCode() + " is leaving the checkout area.");
        bakery.checkout.release();

        // leave store - give back the permission to enter bakary
        System.out.println("Customer " + hashCode() + " has left the store.");

    }

    /**
     * Return a string representation of the customer
     */
    public String toString() {
        return "Customer " + hashCode() + ": shoppingCart=" + Arrays.toString(shoppingCart.toArray()) + ", shopTime=" + shopTime + ", checkoutTime=" + checkoutTime;
    }

    /**
     * Add a bread item to the customer's shopping cart
     */
    private boolean addItem(BreadType bread) {
    //     do not allow more than 3 items, chooseItems() does not call more than 3 times

        if (shoppingCart.size() >= 3) {
            return false;
        }

        shoppingCart.add(bread);
        return true;
    }

    /**
     * Fill the customer's shopping cart with 1 to 3 random breads
     */
    private void fillShoppingCart() {
        int itemCnt = 1 + rnd.nextInt(3);
        while (itemCnt > 0) {
            addItem(BreadType.values()[rnd.nextInt(BreadType.values().length)]);
            itemCnt--;
        }
    }

    /**
     * Calculate the total value of the items in the customer's shopping cart
     */
    private float getItemsValue() {
        float value = 0;
        for (BreadType bread : shoppingCart) {
            value += bread.getPrice();
        }
        return value;
    }
}