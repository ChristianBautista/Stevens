import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JDialog;

/* Some explanation about how this works and relates to Blackjack.java:
 * Essential parts of the logic in the main Blackjack.java loop were copied here.
 * Specifically, the deck/hand/card handling and calculation of the results.
 * Since this is a GUI, there's no main loop that we can control.
 * The main GUI thread is handled via the java toolkits (awt and/or swing).
 * So, we need to add code in handlers for key GUI events like button presses.
 * The canvas (described more in BlackjackCanvas.java, is responsible for drawing
 * the canvas component (the green one). This class handles all other GUI components,
 * including all of the buttons (like dealButton, hitButton, etc.).
 * This class also puts together all of the GUI components into a frame (main window)
 * or a dialog (the popups like for insurance, split, or results).
 * In general, code that was in Blackjack.java that handled a user input is handled
 * by a button action event handler. For each button, an action listener is added
 * that listens for button actions (button presses). The method called in the case
 * of a butotn press is called actionPerformed. That's where
 * the code goes that is called when the user presses the given button.
 * 
 * I added some GUI controls on the bottom to handle funds (the users pot).
 * This is called value in Blackjack.java. The amount is held in the static field funds.
 * The bet is held in the static field bet. The testInsurance is a boolean that I added
 * in just to test insurance. If you set it to true, it will force an Ace to be showing
 * for each dealer hand. The testSplit is a boolean that I added just to test splitting.
 * If you set it to true, it will force a split with every hand. These should only be
 * used for testing.
 */

public class BlackjackGUI {
    static Deck deck = new Deck();
    static int bet;
    static int funds=0;
    static boolean testInsurance = false; // force insurance test
    static boolean testSplit = false; // force split test
    
    /* This is called when the dealer has to play, which should be
     * when all of the hands have finished playing (either by bust or stand).
     * This method will check for all hands, but really the code currently just
     * allows a single split so should have at most 2 hands.
     */
    public static void playDealer(Hand dealerHand, Hands allHands)
    {
    	System.out.println("\nDealer Hand: " + dealerHand.toString() + "\nDealer Total: " + dealerHand.total());
    	// if all hands have busted, dealer does nothing
    	boolean allBusted = true;
    	for (Hand h: allHands.getHands())
    	{
    		if (h.total() <= 21)
    		{
    			allBusted = false;
    		}
    	}
    	if (allBusted)
    	{
    		System.out.println("all hands have busted, dealer will not hit");
    	}
    	// The following loop (except for allBusted) was copied form Blackjack.java
        while(!allBusted && dealerHand.total()<17) {
            dealerHand.addCard(deck.deal());
            System.out.println("Dealer Hand: " + dealerHand.toString() + "\nDealer Total: " + dealerHand.total() + (dealerHand.total()>21 ? " DEALER BUSTS!" : ""));
        }
    }
    
    /* This method is called after all card play is done (player(s) and dealer).
     * It figures out the result of the final hands (dealer and player(s)).
     * This includes who won and what the amount back to the player will be.
     * It will also adjust the funds value accordingly.
     * This was essentially copied from Blackjack.java. The output string is
     * used to display in the results dialog when the round is over.
     */
    public static String processResults(Hand dealerHand, Hands allHands)
    {
    	StringBuffer sb = new StringBuffer();
    	sb.append("\nDealer Hand: " + dealerHand.toString() + "\nDealer Total: " + dealerHand.total());
    	sb.append("\n");
        for(int i=0; i<allHands.getHands().size(); i++) {
            Hand current = allHands.getHand(i);
            sb.append("Player Hand #" + (i+1) + ": " + current.toString() + "\nTotal: " + current.total() + (current.total()>21 ? " BUST!" : "") + ((current.total()==21 && current.getHand().size()==2) ? " BLACKJACK! " : ""));
            sb.append("\n");
            if(current.total()>21) {
                sb.append("Loss: $" + current.getBet() + "\n");
            }
            else if(current.total()==21 && current.getHand().size()==2) {
            	sb.append("Win: $" + ((current.getBet()*2)+(current.getBet()/2)) + "\n");
                funds+=((current.getBet()*2)+(current.getBet()/2));
            }
            else if(dealerHand.total()>21) {
                sb.append("Win: $" + current.getBet()*2 + "\n");
                funds+=(current.getBet()*2);
            }
            else if(current.total()<dealerHand.total()) {
                sb.append("Loss: $" + current.getBet() + "\n");
            }
            else if(current.total()>dealerHand.total()) {
                sb.append("Win: $" + current.getBet()*2 + "\n");
                funds+=(current.getBet()*2);
            }
            else {
                sb.append("Push: $" + current.getBet() + "\n");
                funds+=current.getBet();
            }
        }
        
        return sb.toString();
    }
    
	public static void main(String[] args) {
		BlackjackCanvas canvas = new BlackjackCanvas();  // this is the canvas (just the green part) component
        deck.create(); // we start by creating the deck, like in Blackjack.java

		JFrame f=new JFrame(); // the main window
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		BorderLayout blayout = new BorderLayout(); // sets up where the buttons are relative to the canvas
		f.setLayout(blayout);
	    f.add(canvas,BorderLayout.CENTER); // canvas is where we draw the cards and other stuff other than the buttons
		//f.add(canvas);  
	    JPanel buttonPanel = new JPanel(); // panel where all the buttons are added, which will be at the top of the window
	    JPanel bottomButtonPanel = new JPanel(); // panel where the funds stuff go
	    JLabel alabel = new JLabel("Add Amount:  $");
        JTextField addFundsTextfield = new JTextField(7); // this is where the user adds to the funds amount
	    JButton addButton = new JButton("Add Funds");
	    addButton.setEnabled(true);
	    JLabel fundsLabel = new JLabel("Player Funds: $"+funds);
	    //JTextField playerFundsTextfield = new JTextField(7);
	    //playerFundsTextfield.setEnabled(false);
	    JLabel wlabel = new JLabel("Wager Amount:  $");
        JTextField wagerTextfield = new JTextField(7); // this is where the user puts in the wager amount
	    JButton betButton = new JButton("Bet");
	    betButton.setEnabled(true);
	    

	    JButton dealButton = new JButton("Deal");
	    dealButton.setEnabled(false);
	    JButton hitButton = new JButton("Hit");
	    hitButton.setEnabled(false);
	    JButton standButton = new JButton("Stand");
	    standButton.setEnabled(false);

	    addButton.addActionListener(new ActionListener()
	    {
	    	/* This just takes the amount the user put in the textfield and adds it to funds.
	    	 * It does a check for non-integer data by catching the parse exception.
	    	 * In the case of a parse exception will popup a dialog indicating the amount is invalid.
	    	 */
	    	public void actionPerformed(ActionEvent e) // this is called when the add funds button is clicked
	    	{
	    		int addFunds = 0;
	    		try
	    		{
	    			addFunds = Integer.parseInt(addFundsTextfield.getText());
	    			funds += addFunds;
	    			fundsLabel.setText("Player Funds: $"+funds);
	    			// playerFundsTextfield.setText(""+funds);
	    		}
	    		catch (Exception parseException)
	    		{
		    		JDialog d = new JDialog(f, "Add funds amount is $"+ addFundsTextfield.getText() + "is invalid amount, try again", true);
		    		d.setSize(400,100);
		    		d.setLocationRelativeTo(f);
		    		d.setVisible(true);
	    		}
	    		
	    	}
	    });


	    betButton.addActionListener(new ActionListener()
	    {
	    	/* The bet button checks if the wagerTextfield text is an integer.
	    	 * If so, it will check if there are funds to cover the bet amount in the textfield.
	    	 * If not, will popup a message that the funds are insufficient.
	    	 * If the funds are there, will subtract the bet from the funds
	    	 * and update the fundsLabel (which should always show the current funds).
	    	 */
	    	public void actionPerformed(ActionEvent e) // this is called when the bet button is clicked
	    	{
	    		boolean valid = false;
	    		try
	    		{
	    			bet = Integer.parseInt(wagerTextfield.getText());
	    			valid = true;
	    		}
	    		catch (Exception parseException)
	    		{
	    			valid = false;
	    		}
	    		// display/center the jdialog when the button is pressed
	    		String message = valid?"Bet amount is $"+ wagerTextfield.getText():"Invalid amount, try again";
	    		if (bet > funds)
	    		{
	    			message = "Funds insufficient to cover bet amount, try again";
	    			valid = false;
	    		}
	    		JDialog d = new JDialog(f, message, true);
	    		d.setSize(400,100);
	    		d.setLocationRelativeTo(f);
	    		d.setVisible(true);
	    		if (valid)
	    		{
	    			funds -= bet;
	    			fundsLabel.setText("Player Funds: $"+funds);
	    			wagerTextfield.setEnabled(false);
	    			betButton.setEnabled(false);
	    			dealButton.setEnabled(true);
	    			hitButton.setEnabled(false);
	    			standButton.setEnabled(false);
	    		}
	    	}
	    });

	    dealButton.addActionListener(new ActionListener()
	    {
	    	/* This starts a new deal. It will reset the deck and shuffle it (this is from Blackjack.java).
	    	 * The canvas.showDealerHand is what determines if the first card is face down.
	    	 * The dealerHand and allHands are saved in the canvas which is a BlackjackCanvas.
	    	 * In reality, the canvas only really uses playerHand and playerHand2 but if we 
	    	 * eventually support more than 1 split, we can use allHands instead.
	    	 * It was just easier to deal with 2 for now.
	    	 * The canvas.insurance indicates if the user bought insurance.
	    	 * It will check if the 2nd dealer card (the one face up) is an Ace and if so
	    	 * will check if the user can afford insurance.
	    	 * If not, will indicate that they don't have enough money to buy it in the label
	    	 * on the popup dialog.  If they can, it will ask the user if they want to buy
	    	 * insurance and include yes and no buttons. If no is pressed, the dialog disappears
	    	 * and play resumes as normal. If yes is pressed, canvas.insurance is set to true.
	    	 * Then it will check if the dealer has blackjack and if so will give back some money.
	    	 * I think this is what happens in Blackjack.java from what I can tell but I'm not
	    	 * 100% sure. After this, play goes on. That way, if the user ends up getting 21, it
	    	 * will be a push. I'm not sure if that's really how insurance works.
	    	 * Then, it will check if the user can split (if they have 2 of the same card value).
	    	 * If so, it will check if the user has funds to support a split. If not,
	    	 * just like with the insurance, it will set the dialog label to indicate that the
	    	 * user can't split. Otherwise, the dialog will ask the user if they want to split.
	    	 * In this case there are yes and no buttons. If the no button is pressed, play goes on
	    	 * as normal. If the yes button is pressed, the hand is split by calling
	    	 * canvas.allHands.split(0,deck.deal(),deck.deal()), which was in Blackjack.java.
	    	 * The canvas.playerHand is reset to the first hand, and canvas.playerHand2 is set to 
	    	 * the second hand.
	    	 * Finally, it has special handling for the blackjack case (where player has 21 with 2 cards).
	    	 * In this case, the player's hand is done so it calls playDealer and will process/show the results.
	    	 */
	    	public void actionPerformed(ActionEvent e) // this is called when the deal button is clicked
	    	{
	    		wagerTextfield.setEnabled(false);
	    		
	            deck.reset();
	            deck.shuffle();
	            canvas.showDealerHand = false;
	            canvas.allHands = new Hands();
	            canvas.playerHand = new Hand(deck.deal(),deck.deal(),bet);
	            canvas.allHands.addHand(canvas.playerHand);
	            canvas.dealerHand = new Hand(deck.deal(),deck.deal());
	            canvas.insurance = false;
	            
	            if (testInsurance)
	            {
	            	// just for testing insurance
	            	canvas.dealerHand.getHand().set(1, new Card(1, "Ace", "Hearts"));
	            }
	            
	            // insurance case (top card is Ace)
	            if (canvas.dealerHand.getHand().get(1).getVal() == 1)
	            {
		            canvas.repaint();
		            // offer insurance if shown card is Ace
		    		JDialog d = new JDialog(f, "Insurance Option", true);
		    		// check if enough funds to buy insurance
		    		boolean canBuy = (funds >= bet + bet/2);
		    		JLabel insLabel = new JLabel(canBuy?"Would you like to buy insurance?":"You do not have enough funds to buy insurance");
		    		JButton yesButton = new JButton("Yes");
		    		JButton noButton = new JButton("No");
		    		d.setLayout(new BorderLayout());
		    		canvas.insurance = false;

		    		yesButton.addActionListener(new ActionListener()
		    		{
		    			public void actionPerformed(ActionEvent e) // this is called when the yes button is clicked
		    			{
		    				// player has chosen to buy insurance
		    				canvas.insurance = true;
		    				funds -= bet/2;
		    				wagerTextfield.setText(Integer.toString(bet));
		    			    fundsLabel.setText("Player Funds: $"+funds);
		    			    if (canvas.dealerHand.total() == 21) // dealer has blackjack
		    			    {
		    			    	funds+=(bet+(bet/2));
		    			    }
		    				
		    				d.setVisible(false);
		    				canvas.repaint();
		    			}
		    		});
		    		noButton.addActionListener(new ActionListener()
		    		{
		    			public void actionPerformed(ActionEvent e) // this is called when the no button is clicked
		    			{
		    				canvas.insurance = false;
		    				d.setVisible(false);
		    			}
		    		});
		    		JPanel qpanel = new JPanel();
		    		qpanel.add(insLabel);
		    		d.add(qpanel, BorderLayout.NORTH);
		    		JPanel bpanel = new JPanel();
		    		bpanel.add(yesButton);
		    		bpanel.add(noButton);
		    		if (canBuy)
		    			d.add(bpanel, BorderLayout.SOUTH);
		    		d.setLocationRelativeTo(f);
		    		d.setSize(250,100);
		    		d.setVisible(true);
	            }
	            
	            if (testSplit)
	            {
	            	// next 3 lines are just for testing split
	            	Card firstCard = canvas.playerHand.getHand().get(0);
	            	Card sameValCard = new Card(firstCard.getVal(), firstCard.getName(), firstCard.getSuit().equals("Hearts") ? "Clubs" : "Hearts");
	            	canvas.playerHand.getHand().set(1, sameValCard);
	            }
	            
	            // split case (2 cards of same value)
	            if (canvas.playerHand.getHand().get(0).getName().equals(canvas.playerHand.getHand().get(1).getName())) // offer split
	            {
		            canvas.repaint(); // repaint here to show status of insurance
		            // offer insurance if shown card is Ace
		    		JDialog d = new JDialog(f, "Split Option", true);
		    		// check if enough funds to buy insurance
		    		boolean canBuy = (funds >= 2*bet);
		    		JLabel insLabel = new JLabel(canBuy?"Would you like to split?":"You do not have enough funds to split");
		    		JButton yesButton = new JButton("Yes");
		    		JButton noButton = new JButton("No");
		    		d.setLayout(new BorderLayout());

		    		yesButton.addActionListener(new ActionListener()
		    		{
		    			public void actionPerformed(ActionEvent e) // this is called when the yes button is clicked
		    			{
		    				// player has chosen to split
		    				canvas.allHands.split(0,deck.deal(),deck.deal()); // only handling 1 split for now
		    				canvas.playerHand = canvas.allHands.getHand(0);
		    				canvas.playerHand2 = canvas.allHands.getHand(1);
		    				funds -= bet;
		    				bet += bet;
		    				wagerTextfield.setText(Integer.toString(bet));
			    			fundsLabel.setText("Player Funds: $"+funds);

		    				d.setVisible(false);
		    			}
		    		});
		    		noButton.addActionListener(new ActionListener()
		    		{
		    			public void actionPerformed(ActionEvent e) // this is called when the no button is clicked
		    			{
		    				canvas.playerHand2 = null;
		    				d.setVisible(false);
		    			}
		    		});
		    		JPanel qpanel = new JPanel();
		    		qpanel.add(insLabel);
		    		d.add(qpanel, BorderLayout.NORTH);
		    		JPanel bpanel = new JPanel();
		    		bpanel.add(yesButton);
		    		bpanel.add(noButton);
		    		if (canBuy)
		    			d.add(bpanel, BorderLayout.SOUTH);
		    		d.setLocationRelativeTo(f);
		    		d.setSize(250,100);
		    		d.setVisible(true);

	            }
	            
	            betButton.setEnabled(false);
	    		dealButton.setEnabled(false);
	    		hitButton.setEnabled(true);
	    		standButton.setEnabled(true);
	            //State Player's Hand then Dealer's Hand
	            System.out.println("Player Hand: " + canvas.playerHand.toString() + "\nPlayer Hand Value: " + canvas.playerHand.total() + (canvas.playerHand.total()==21 ? " BLACKJACK!" : "") + "\n");
	            System.out.println("Dealer Face Up Card: " + canvas.dealerHand.getHand().get(0) + "\nDealer Face Up Card Value: " + (canvas.dealerHand.getHand().get(0).getVal()==1 ? "11" : canvas.dealerHand.getHand().get(0).getVal()) + "\n");
	            canvas.repaint();
	            boolean splitAces = (canvas.playerHand2 != null && canvas.playerHand.stop && canvas.playerHand2.stop);
	            if (canvas.playerHand.total() == 21 || splitAces) // blackjack or split aces so player's hand is over
	            {
	            	playDealer(canvas.dealerHand, canvas.allHands); // dealer plays
	            	canvas.showDealerHand = true;
		    		canvas.repaint(); // this will show the dealer hand
	            	JDialog d = new JDialog(f, "Result", true);
	            	String resultString = processResults(canvas.dealerHand, canvas.allHands);
	    			fundsLabel.setText("Player Funds: $"+funds);

		    		JTextArea resultsTextArea = new JTextArea(resultString);
		    		d.add(resultsTextArea);
		    		d.setSize(400, 200);

		    		d.setLocationRelativeTo(f);
		    		d.setVisible(true);
		    		wagerTextfield.setEnabled(true);
		    		betButton.setEnabled(true);
		    		dealButton.setEnabled(false);
		    		hitButton.setEnabled(false);
		    		standButton.setEnabled(false);
		    		canvas.allHands = null;
		            canvas.playerHand = null;
		            canvas.playerHand2 = null;
		            canvas.dealerHand = null;
		            canvas.repaint();
	            }
	    	}
	    });

	    hitButton.addActionListener(new ActionListener()
	    {
	    	/* This is called when the hit button is pressed.
	    	 * This will add a card to the current player's hand.
	    	 * If canvas.playerHand2 is null, then there's no split so there's only one hand. 
	    	 * Here playerHand.stop is used to indicate that the hand is done (via stand or bust).
	    	 * In the case where there is a second hand, canvas.playerHand2 is not null and 
	    	 * playerHand2.stop is used to indicate that the 2nd hand is done (via stand or bust).
	    	 * If after the hit, the hand is done (via bust in this case), it will call the
	    	 * playDealer and process/show results.
	    	 */
	    	public void actionPerformed(ActionEvent e) // this is called when the hit button is clicked
	    	{
	    		wagerTextfield.setEnabled(false);
	    		betButton.setEnabled(false);
	    		dealButton.setEnabled(false);
	    		hitButton.setEnabled(true);
	    		standButton.setEnabled(true);
	    		if (!canvas.playerHand.stop)
	    		{
	    			canvas.playerHand.addCard(deck.deal());
	    			System.out.println("\nCurrent Hand: " + canvas.playerHand.toString() + "\nCurrent Hand Total: " + canvas.playerHand.total() + "\n");
	    		} 
	    		else if (canvas.playerHand2 != null && !canvas.playerHand2.stop)
	    		{
	    			canvas.playerHand2.addCard(deck.deal());
	    			System.out.println("\nCurrent Hand 2: " + canvas.playerHand2.toString() + "\nCurrent Hand 2 Total: " + canvas.playerHand2.total() + "\n");

	    		}
	    		if (!canvas.playerHand.stop && canvas.playerHand.total()>=21) // check for bust, if so set stop to true
	    		{
	    			canvas.playerHand.stop = true;
	    			canvas.repaint();
	    		}
	    		// if 2nd hand is in play, check for bust and if so, set its stop to true
	    		if (canvas.playerHand2 != null && !canvas.playerHand2.stop && canvas.playerHand2.total()>=21)
	    		{
	    			canvas.playerHand2.stop = true;
	    			canvas.repaint();
	    		}
	    		// if play is done, playDealer and process/show results
                if ((canvas.playerHand2 == null && canvas.playerHand.stop) || (canvas.playerHand2 != null && canvas.playerHand.stop && canvas.playerHand2.stop))
                {
                	hitButton.setEnabled(false);
                	standButton.setEnabled(false);
                	playDealer(canvas.dealerHand, canvas.allHands);
                	canvas.showDealerHand = true;
    	    		canvas.repaint();
    	    		JDialog d = new JDialog(f, "Result", true);
    	    		String resultString = processResults(canvas.dealerHand, canvas.allHands);
	    			fundsLabel.setText("Player Funds: $"+funds);

    	    		JTextArea resultsTextArea = new JTextArea(resultString);
    	    		d.add(resultsTextArea);
    	    		d.setSize(400, 200);

		    		d.setLocationRelativeTo(f);
		    		d.setVisible(true);
		    		wagerTextfield.setEnabled(true);
		    		betButton.setEnabled(true);
		    		dealButton.setEnabled(false);
		    		hitButton.setEnabled(false);
		    		standButton.setEnabled(false);
		    		canvas.allHands = null;
		            canvas.playerHand = null;
		            canvas.playerHand2 = null;
		            canvas.dealerHand = null;
		            canvas.repaint();
                }
                else
                {
                	canvas.repaint();
                }
	    	}
	    });


	    standButton.addActionListener(new ActionListener()
	    {
	    	public void actionPerformed(ActionEvent e) // this is called when the stand button is clicked
	    	{
	    		/* The hand is over at least for the first hand. 
	    		 * If there's a second hand, keep going.
	    		 * If there is no more play, do the dealer play by
	    		 * calling playDealer and process/show the results.
	    		 */
	    		if (!canvas.playerHand.stop) // if the first hand (possibly the onlye one) is still going, stop it
	    		{
	    			canvas.playerHand.stop = true;
	    			if (canvas.playerHand2 != null) // if there's a second hand to play, return before dealer play
	    			{
	    				canvas.repaint();
	    				return;
	    			}
	    		}
	    		else if (canvas.playerHand2 != null && !canvas.playerHand2.stop) // if the 2nd hand is going, stop it
	    		{
	    			canvas.playerHand2.stop = true;
	    		}
	    		// play is done so do dealer play and process/show results
            	playDealer(canvas.dealerHand, canvas.allHands);
            	canvas.showDealerHand = true;
	    		canvas.repaint();
	    		JDialog d = new JDialog(f, "Result", true);
	    		String resultString = processResults(canvas.dealerHand, canvas.allHands);
    			fundsLabel.setText("Player Funds: $"+funds);
	    		JTextArea resultsTextArea = new JTextArea(resultString);
	    		d.add(resultsTextArea);
	    		d.setSize(400, 200);

	    		d.setLocationRelativeTo(f);
	    		d.setVisible(true);
	    		wagerTextfield.setEnabled(true);
	    		betButton.setEnabled(true);
	    		dealButton.setEnabled(false);
	    		hitButton.setEnabled(false);
	    		standButton.setEnabled(false);
	    		canvas.allHands = null;
	            canvas.playerHand = null;
	            canvas.playerHand2 = null;
	            canvas.dealerHand = null;
	            canvas.repaint();
	    	}
	    });

	    bottomButtonPanel.add(alabel);
	    bottomButtonPanel.add(addFundsTextfield);
	    bottomButtonPanel.add(addButton);
	    bottomButtonPanel.add(fundsLabel);
	    //buttonPanel.add(playerFundsTextfield);
	    buttonPanel.add(wlabel);
	    buttonPanel.add(wagerTextfield);
	    buttonPanel.add(betButton);
	    buttonPanel.add(dealButton);
	    buttonPanel.add(hitButton);
	    buttonPanel.add(standButton);
	    f.add(buttonPanel, BorderLayout.NORTH);
	    f.add(bottomButtonPanel, BorderLayout.SOUTH);
	    
		f.setSize(900,800);  

		f.setVisible(true);  

	}

}