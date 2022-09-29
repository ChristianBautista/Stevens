import java.awt.*;

import javax.swing.JFrame;
import javax.swing.JButton;

import java.util.Scanner;

//FIX FOR CONDITIONALS IN ACTIONPERFORMED:
//Define exterior static methods within Blackjack class

public class Blackjack {

    public static String betCheck(String ip, int value) {
        if(ip==null || ip.length()==0) {
            return "No input detected.";
        }
        for(char c : ip.toCharArray()) {
            if (!Character.isDigit(c)) {
                return "Please bet with numerical values.";
            }
        }
        int bet = Integer.parseInt(ip);
        if(bet<2) {
            return "Bet must be greater than 1.";
        }
        else if(bet%2==1) {
            return "Bet must be even.";
        }
        else if(bet>value) {
            return "Bet must be less than " + value + ".";
        }
        return "valid";
    }
    public static void main(String[]args) {
        Scanner scan = new Scanner(System.in);
        String ip = "";
        boolean numeric;
        int value = 0;
        //Menu Screen
        BlackjackCanvas canvas = new BlackjackCanvas();
        //Main Window
        JFrame f=new JFrame(); 
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //Button Positional Setup
		BorderLayout blayout = new BorderLayout();
        f.setLayout(blayout);
        //Canvas setup
        f.add(canvas,BorderLayout.CENTER);
        //Button Panel Setup
        //Text Field Creation for Bets

        //NOTE: Possibly change to Prompt

        //Button Creations: Bet, Deal, Stand, Hait
	    JButton betButton = new JButton("Bet");
	    betButton.setEnabled(true);
	    JButton dealButton = new JButton("Deal");
	    dealButton.setEnabled(false);
	    JButton hitButton = new JButton("Hit");
	    hitButton.setEnabled(false);
	    JButton standButton = new JButton("Stand");
	    standButton.setEnabled(false);
        //Prompt Player for Starting Value
        while(value<2) {
            System.out.print("Enter starting value: ");
            ip = scan.nextLine();
            if(ip!=null && ip.length()!=0) {
                numeric = true;
                for(char c : ip.toCharArray()) {
                    if (!Character.isDigit(c)) {
                        numeric = false;
                        break;
                    }
                }
                if(numeric) {
                    value = Integer.parseInt(ip);
                }
            }
        }
        //While loop until player wants to stop playing
        Deck deck = new Deck();
        deck.create();
        while(true) {
            //Betting Round
            int bet = 0;
            while(bet<2 || bet%2==1 || bet>value) {
                System.out.print("Place your wager: ");
                ip = scan.nextLine();
                if(ip!=null && ip.length()!=0) {
                    numeric = true;
                    for(char c : ip.toCharArray()) {
                        if (!Character.isDigit(c)) {
                            numeric = false;
                            break;
                        }
                    }
                    if(numeric) {
                        bet = Integer.parseInt(ip);
                    }
                }
            }
            value-=bet;
            //Deal Cards
            deck.reset();
            deck.shuffle();
            Hands allHands = new Hands();
            Hand playerHand = new Hand(deck.deal(),deck.deal(),bet);
            allHands.addHand(playerHand);
            Hand dealerHand = new Hand(deck.deal(),deck.deal());
            //State Player's Hand then Dealer's Hand
            System.out.println("\nBet: " + bet + "\nPlayer Value: " + value + "\n");
            System.out.println("Player Hand: " + playerHand.toString() + "\nPlayer Hand Value: " + playerHand.total() + (playerHand.total()==21 ? " BLACKJACK!" : "") + "\n");
            System.out.println("Dealer Face Up Card: " + dealerHand.getHand().get(0) + "\nDealer Face Up Card Value: " + (dealerHand.getHand().get(0).getVal()==1 ? "11" : dealerHand.getHand().get(0).getVal()) + "\n");
            //If player has Blackjack, skip to bottom
            boolean skip = playerHand.total()==21 ? true : false;
            //If dealer has an Ace face up, offer insurance
            //FIX THIS: have to check whether player has enough money for insurance AND it should still run the code regardless
            if(dealerHand.getHand().get(0).getVal()==1) {
                if(value>=(bet/2)) {
                    ip = "";
                    while(!ip.equals("Y") && !ip.equals("N")) {
                        System.out.print("Would you like to buy insurance? (Y/N): ");
                        ip = scan.nextLine();
                    }
                    if(ip.equals("Y")) {
                        value-=(bet/2);
                    }
                }
                if(dealerHand.total()==21) {
                    skip = true;
                    System.out.println("\nDealer Hand: " + dealerHand.toString() + "\nDealer Total: " + dealerHand.total() + " DEALER BLACKJACK!" + "\n");
                    if(ip.equals("Y")) {
                        System.out.println("Win: " + (bet+(bet/2)));
                        value+=(bet+(bet/2));
                    }
                    if(playerHand.total()==21) {
                        System.out.println("Push: " + bet);
                        value+=bet;
                    }
                    else {
                        System.out.println("Loss: " + bet);
                    }
                    System.out.println();
                } 
                else {
                    System.out.println("Dealer does not have Blackjack.\n");
                    //if player has blackjack, payout
                    if(skip) {
                        System.out.println("Win: " + (playerHand.getBet()*2.5) + "\n");
                        value+=((bet*2)+(bet/2));
                    }
                }
            } 
            //Must account for when there's a Blackjack with only 10 showing
            else if(skip) {
                System.out.println("Dealer Hand: " + dealerHand.toString() + "\nDealer Total: " + dealerHand.total() + (dealerHand.total()==21 ? " DEALER BLACKJACK!" : "") + "\n");
                if(dealerHand.total()==21) {
                    System.out.println("Push: " + bet + "\n");
                    value+=bet;
                }
                else {
                    System.out.println("Win: " + ((bet*2)+(bet/2)) + "\n");
                    value+=((bet*2)+(bet/2));
                }
                
            }
            if(!skip) {
                boolean first = true;
                //Loop through all the hands (in case of splits)
                for(int i=0; i<allHands.getHands().size(); i++) {
                    Hand current = allHands.getHand(i);
                    //Show hand if it wasn't the same hand
                    if(!first) {
                        System.out.println("Bet: " + current.getBet() + "\nPlayer Value: " + value + "\n");
                        System.out.println("Current Hand: " + current.toString() + "\nCurrent Hand Total: " + current.total() + (current.total()==21 ? " BLACKJACK!" : "") + "\n");
                        System.out.println("Dealer Face Up Card: " + dealerHand.getHand().get(0) + "\nDealer Face Up Card Value: " + (dealerHand.getHand().get(0).getVal()==1 ? "11" : dealerHand.getHand().get(0).getVal()) + "\n");
                    }
                    first = false;
                    //If a player gets BlackJack, skip iteration
                    if(current.total()==21) {
                        continue;
                    }
                    //If cards are the same, offer split
                    if(current.getHand().get(0).getVal() == current.getHand().get(1).getVal() && value>=current.getBet()) {
                        ip = "";
                        while(!ip.equals("Y") && !ip.equals("N")) {
                            System.out.print("Would you like to split? (Y/N): ");
                            ip = scan.nextLine();
                        }
                        //If yes skip iteration
                        if(ip.equals("Y")) {
                            allHands.split(i,deck.deal(),deck.deal());
                            value-=bet;
                            i--;
                            continue;
                        }
                    }
                    //Offer double down
                    if(value>=current.getBet()) {
                        ip = "";
                        while(!ip.equals("Y") && !ip.equals("N")) {
                            System.out.print("Would you like to double down? (Y/N): ");
                            ip = scan.nextLine();
                        }
                        if(ip.equals("Y")) {
                            allHands.dd(i,deck.deal());
                            value-=bet;
                        }
                    }
                    //After all previous are asked, ask for hit or stand
                    //While loop until player stands or busts
                    if(!current.stop) {
                        while(!ip.equals("Stand") && current.total()<=21) {
                            ip = "";
                            while(!ip.equals("Hit") && !ip.equals("Stand")) {
                                System.out.print("Would you like to hit or stand? (Hit/Stand): ");
                                ip = scan.nextLine();
                            }
                            if(ip.equals("Hit")) {
                                current.addCard(deck.deal());
                                System.out.println("\nCurrent Hand: " + current.toString() + "\nCurrent Hand Total: " + current.total() + "\n");
                            }
                        }
                    }
                }
                //Showdown with Dealer
                System.out.println("\nDealer Hand: " + dealerHand.toString() + "\nDealer Total: " + dealerHand.total());
                while(dealerHand.total()<17) {
                    dealerHand.addCard(deck.deal());
                    System.out.println("Dealer Hand: " + dealerHand.toString() + "\nDealer Total: " + dealerHand.total() + (dealerHand.total()>21 ? " DEALER BUSTS!" : ""));
                }
                System.out.println();
                for(int i=0; i<allHands.getHands().size(); i++) {
                    Hand current = allHands.getHand(i);
                    System.out.println("Player Hand #" + (i+1) + ": " + current.toString() + "\nTotal: " + current.total() + (current.total()>21 ? " BUST!" : "") + ((current.total()==21 && current.getHand().size()==2) ? " BLACKJACK!" : ""));
                    if(current.total()>21) {
                        System.out.println("Loss: " + current.getBet() + "\n");
                    }
                    else if(current.total()==21 && current.getHand().size()==2) {
                        System.out.println("Win: " + ((current.getBet()*2)+(current.getBet()/2)) + "\n");
                        value+=((current.getBet()*2)+(current.getBet()/2));
                    }
                    else if(dealerHand.total()>21) {
                        System.out.println("Win: " + current.getBet()*2 + "\n");
                        value+=(current.getBet()*2);
                    }
                    else if(current.total()<dealerHand.total()) {
                        System.out.println("Loss: " + current.getBet() + "\n");
                    }
                    else if(current.total()>dealerHand.total()) {
                        System.out.println("Win: " + current.getBet()*2 + "\n");
                        value+=(current.getBet()*2);
                    }
                    else {
                        System.out.println("Push: " + current.getBet() + "\n");
                        value+=current.getBet();
                    }
                }
            }
            System.out.println("Player Value: " + value + "\n");
            //Ask if player wants to stop playing
            if(value<2) {
                System.out.println("Game Over!");
            }
            else{
                ip = "";
                while(!ip.equals("Y") && !ip.equals("N")) {
                    System.out.print("Play Again? (Y/N): ");
                    ip = scan.nextLine();
                }
                if(ip.equals("N")) {
                    break;
                }
            }
        }
        scan.close();
        System.out.println("\nFinal Score: " + value);
    }   
}
