import java.awt.*;
import java.awt.geom.Rectangle2D;

/*
 * This class is responsible for painting the canvas (green part).
 * It will check if there's a dealerHand and if so will display it.
 * If not will indicate dealer area.
 * It will check if there's a playerHand and if so will display it.
 * If not will indicate player area.
 * It will check if there's a playerHand2 (as a result of a split).
 * If so, it will display it on the right half of the canvas.
 * If there are 2 hands, will indicate which hand is currently being played at the top.
 * In the case of a dealer hand Ace showing, will indicate if insurance was bought.
 * 
 * For showing the hand, the cards are drawn as rounded rectangles with the "number" on the upper left hand corner
 * with the suit underneath and shown in bigger font in the middle of the card. 
 * The cards are "stacked" with just a portion of the card underneath shown.
 * This is represented by cardxOffset, currently cardwidth/3.5. 
 * I played around with that ratio to see what looked good.
 * Same thing for the fonts and font sizes.
 * I tried to have everything relative to the width and height of the canvas so it would resize well.
 * The hand drawing is repetitive (dealerHand, playerHand, and if split playerHand2.
 * This could probably be put in a method instead of repeating but it works as it is.
 * If any changes are made to the card drawing, it would need to happen in all 3 places.
 */

public class BlackjackCanvas extends Canvas {

	static final long serialVersionUID = 1;
    Hands allHands = null;
    Hand playerHand = null;
    Hand playerHand2 = null;
    Hand dealerHand = null;
    boolean insurance = false;
    boolean showDealerHand = false; // when this is true, the bottom card is face up and the total is shown
	
	public BlackjackCanvas()
	{
		setBackground(Color.GREEN.darker()); 
		setForeground(Color.WHITE);
	}
	
	
	
	public void paint(Graphics g) {
		Graphics2D g2d = (Graphics2D) g;
		int width = getWidth();
		int height = getHeight();
		int cardwidth = (int) (width/7.5);
		int cardheight = height/5;
		// cards and areas proportional to window size so that cards will size with window
		if (dealerHand == null)
		{
			setForeground(Color.WHITE);  
			g.drawString("Dealer Area",width/10,height/10);
		}
		else // draw dealer hand
		{
			int cardx = width/5;
			int cardy = height/5;
			Font font = new Font("Arial", Font.BOLD, cardwidth/6);
			String cardString;
			Rectangle2D r2d;
			int cardxOffset = (int) (cardwidth/3.5); // this is the distance between the cards, big enough to show upper left hand corner
			boolean firstCard = true;
			if (dealerHand.getHand().get(1).getVal() == 1)
			{
				// indicate if player has purchased insurance
				g.setColor(Color.WHITE);
				font = new Font("Arial", Font.BOLD, cardwidth/6);
				g.setFont(font);
				if (insurance)
				{
					if (dealerHand.total() == 21)
					{
						g.drawString("Dealer has blackjack",width/10,height/20); // money was already added to funds, is that right or do we wait until hand is over?
					}
					else
					{
						g.drawString("Dealer does not have blackjack",width/10,height/20); // life goes on
					}

				}
				else
				{
					g.drawString("Player has not purchased insurance",width/10,height/20);
				}
			}
			if (playerHand2 != null)
			{
				g.setColor(Color.WHITE);
				font = new Font("Arial", Font.BOLD, cardwidth/6);
				g.setFont(font);
				
				if (!playerHand.stop)
				{
					g.drawString("Playing Hand #1",width/10,height/10);
				}
				if (playerHand.stop && !playerHand2.stop)
				{
					g.drawString("Playing Hand #2",width/2 + width/10,height/10);
				}
			}
			if (showDealerHand)
			{
				g.setColor(Color.WHITE);
				font = new Font("Arial", Font.BOLD, cardwidth/6);
				g.setFont(font);
				g.drawString("Dealer Total: "+dealerHand.total(),width/10,9*height/20);	
			}
			for (Card card : dealerHand.getHand())
			{
				if (!showDealerHand && firstCard) // show first card face down if !showDealerHand
				{
					// face down
					g2d.setColor(Color.BLACK);
					g2d.drawRoundRect(cardx, cardy, cardwidth, cardheight, cardwidth/7, cardheight/7);
					g2d.setColor(Color.RED);
					g2d.fillRoundRect(cardx+1, cardy+1, cardwidth-2, cardheight-2, cardwidth/7, cardheight/7);

					firstCard = false;
					cardx += cardxOffset;
					continue;
				}
				
				// what string to draw on card, like K for King, 9 for 9...  10 is the only one with >1 character
				cardString = card.getName().startsWith("10") ? card.getName().substring(0,2) : card.getName().substring(0,1);
				
				// draw border of card
				g2d.setColor(Color.BLACK);
				g2d.drawRoundRect(cardx, cardy, cardwidth, cardheight, cardwidth/7, cardheight/7);
				// draw white part of card
				g2d.setColor(Color.WHITE);
				g2d.fillRoundRect(cardx+1, cardy+1, cardwidth-2, cardheight-2, cardwidth/7, cardheight/7);
				
				if (card.getSuit().equalsIgnoreCase("Hearts"))
				{
					g2d.setColor(Color.RED);
					font = new Font("Arial", Font.BOLD, cardwidth/6);
					g2d.setFont(font); // font for number/letter
					r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
					g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
					font = new Font("Arial", Font.BOLD, cardwidth/5); // font for suit in corner
					g2d.setFont(font);
					g2d.drawString("\u2665", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
					font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25)); // font for big suit in middle of card
					g2d.setFont(font);
					g2d.drawString("\u2665", cardx+cardwidth/4, cardy+(3*cardheight/4));
				}
				else if (card.getSuit().equalsIgnoreCase("Diamonds"))
				{
					g2d.setColor(Color.RED);
					font = new Font("Arial", Font.BOLD, cardwidth/6);
					g2d.setFont(font);
					r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
					g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
					font = new Font("Arial", Font.BOLD, cardwidth/5);
					g2d.setFont(font);
					g2d.drawString("\u2666", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
					font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
					g2d.setFont(font);
					g2d.drawString("\u2666", cardx+cardwidth/3, cardy+(3*cardheight/4));				
				}
				else if (card.getSuit().equalsIgnoreCase("Spades"))
				{
					g2d.setColor(Color.BLACK);
					font = new Font("Arial", Font.BOLD, cardwidth/6);
					g2d.setFont(font);
					r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
					g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
					font = new Font("Arial", Font.BOLD, cardwidth/5);
					g2d.setFont(font);
					g2d.drawString("\u2660", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
					font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
					g2d.setFont(font);
					g2d.drawString("\u2660", cardx+cardwidth/4, cardy+(3*cardheight/4));
				}
				else // clubs
				{
					g2d.setColor(Color.BLACK);
					font = new Font("Arial", Font.BOLD, cardwidth/6);
					g2d.setFont(font);
					r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
					g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
					font = new Font("Arial", Font.BOLD, cardwidth/5);
					g2d.setFont(font);
					g2d.drawString("\u2663", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
					font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
					g2d.setFont(font);
					g2d.drawString("\u2663", cardx+cardwidth/4, cardy+(3*cardheight/4));	
				}

				cardx += cardxOffset;
				
			}

		}
		
		if (playerHand == null)
		{
			g2d.setColor(Color.WHITE);
			g.drawString("Player Area",width/10,9*height/10);  
		}
		else
		{
			int cardx = width/5;
			int cardy = 3*height/5;
			Font font = new Font("Arial", Font.BOLD, cardwidth/6);
			String cardString;
			Rectangle2D r2d;
			int cardxOffset = (int) (cardwidth/3.5);
			for (Card card : playerHand.getHand())
			{
				// draw card
				cardString = card.getName().startsWith("10") ? card.getName().substring(0,2) : card.getName().substring(0,1);
				
				g2d.setColor(Color.BLACK);
				g2d.drawRoundRect(cardx, cardy, cardwidth, cardheight, cardwidth/7, cardheight/7);
				g2d.setColor(Color.WHITE);
				g2d.fillRoundRect(cardx+1, cardy+1, cardwidth-2, cardheight-2, cardwidth/7, cardheight/7);
				
				if (card.getSuit().equalsIgnoreCase("Hearts"))
				{
					g2d.setColor(Color.RED);
					font = new Font("Arial", Font.BOLD, cardwidth/6);
					g2d.setFont(font);
					r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
					g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
					font = new Font("Arial", Font.BOLD, cardwidth/5);
					g2d.setFont(font);
					g2d.drawString("\u2665", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
					font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
					g2d.setFont(font);
					g2d.drawString("\u2665", cardx+cardwidth/4, cardy+(3*cardheight/4));
				}
				else if (card.getSuit().equalsIgnoreCase("Diamonds"))
				{
					g2d.setColor(Color.RED);
					font = new Font("Arial", Font.BOLD, cardwidth/6);
					g2d.setFont(font);
					r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
					g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
					font = new Font("Arial", Font.BOLD, cardwidth/5);
					g2d.setFont(font);
					g2d.drawString("\u2666", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
					font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
					g2d.setFont(font);
					g2d.drawString("\u2666", cardx+cardwidth/3, cardy+(3*cardheight/4));	
				}
				else if (card.getSuit().equalsIgnoreCase("Spades"))
				{
					g2d.setColor(Color.BLACK);
					font = new Font("Arial", Font.BOLD, cardwidth/6);
					g2d.setFont(font);
					r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
					g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
					font = new Font("Arial", Font.BOLD, cardwidth/5);
					g2d.setFont(font);
					g2d.drawString("\u2660", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
					font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
					g2d.setFont(font);
					g2d.drawString("\u2660", cardx+cardwidth/4, cardy+(3*cardheight/4));
				}
				else // clubs
				{
					g2d.setColor(Color.BLACK);
					font = new Font("Arial", Font.BOLD, cardwidth/6);
					g2d.setFont(font);
					r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
					g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
					font = new Font("Arial", Font.BOLD, cardwidth/5);
					g2d.setFont(font);
					g2d.drawString("\u2663", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
					font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
					g2d.setFont(font);
					g2d.drawString("\u2663", cardx+cardwidth/4, cardy+(3*cardheight/4));		
				}

				cardx += cardxOffset;
				
			}
			// indicate player total
			font = new Font("Arial", Font.BOLD, cardwidth/6);
			g.setFont(font);
			if (playerHand.total() > 21)
			{
				g.setColor(Color.WHITE);
				g.drawString("Player total: " +playerHand.total(),width/10,9*height/10);
				g.setColor(Color.RED);
				g.drawString("BUST!",width/10,19*height/20);
			}
			else if (playerHand.getHand().size() == 2 && playerHand.total() == 21)
			{
				g.setColor(Color.WHITE);
				g.drawString("Player total: " +playerHand.total(),width/10,9*height/10);
				g.setColor(Color.RED);
				g.drawString("BLACKJACK!",width/10,19*height/20);
			} 
			else
			{
				g.setColor(Color.WHITE);
				g.drawString("Player total: " +playerHand.total(),width/10,9*height/10);
				
			}

			// check for 2nd hand as a result of split
			if (playerHand2 != null)
			{
				cardx = 3*width/5;
				cardy = 3*height/5;
				font = new Font("Arial", Font.BOLD, cardwidth/6);
				cardxOffset = (int) (cardwidth/3.5);
				for (Card card : playerHand2.getHand())
				{
					// draw card
					cardString = card.getName().startsWith("10") ? card.getName().substring(0,2) : card.getName().substring(0,1);
					
					g2d.setColor(Color.BLACK);
					g2d.drawRoundRect(cardx, cardy, cardwidth, cardheight, cardwidth/7, cardheight/7);
					g2d.setColor(Color.WHITE);
					g2d.fillRoundRect(cardx+1, cardy+1, cardwidth-2, cardheight-2, cardwidth/7, cardheight/7);
					
					if (card.getSuit().equalsIgnoreCase("Hearts"))
					{
						g2d.setColor(Color.RED);
						font = new Font("Arial", Font.BOLD, cardwidth/6);
						g2d.setFont(font);
						r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
						g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
						font = new Font("Arial", Font.BOLD, cardwidth/5);
						g2d.setFont(font);
						g2d.drawString("\u2665", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
						font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
						g2d.setFont(font);
						g2d.drawString("\u2665", cardx+cardwidth/4, cardy+(3*cardheight/4));
					}
					else if (card.getSuit().equalsIgnoreCase("Diamonds"))
					{
						g2d.setColor(Color.RED);
						font = new Font("Arial", Font.BOLD, cardwidth/6);
						g2d.setFont(font);
						r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
						g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
						font = new Font("Arial", Font.BOLD, cardwidth/5);
						g2d.setFont(font);
						g2d.drawString("\u2666", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
						font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
						g2d.setFont(font);
						g2d.drawString("\u2666", cardx+cardwidth/3, cardy+(3*cardheight/4));	
					}
					else if (card.getSuit().equalsIgnoreCase("Spades"))
					{
						g2d.setColor(Color.BLACK);
						font = new Font("Arial", Font.BOLD, cardwidth/6);
						g2d.setFont(font);
						r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
						g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
						font = new Font("Arial", Font.BOLD, cardwidth/5);
						g2d.setFont(font);
						g2d.drawString("\u2660", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
						font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
						g2d.setFont(font);
						g2d.drawString("\u2660", cardx+cardwidth/4, cardy+(3*cardheight/4));
					}
					else // clubs
					{
						g2d.setColor(Color.BLACK);
						font = new Font("Arial", Font.BOLD, cardwidth/6);
						g2d.setFont(font);
						r2d = font.getStringBounds(cardString, g2d.getFontRenderContext());
						g2d.drawString(cardString, cardx+cardwidth/10, cardy+cardheight/20 + (int) r2d.getHeight());
						font = new Font("Arial", Font.BOLD, cardwidth/5);
						g2d.setFont(font);
						g2d.drawString("\u2663", cardx+cardwidth/10, cardy+(cardheight/20) + 2*((int) r2d.getHeight()));
						font = new Font("Arial", Font.BOLD, (int) (cardwidth/1.25));
						g2d.setFont(font);
						g2d.drawString("\u2663", cardx+cardwidth/4, cardy+(3*cardheight/4));		
					}

					cardx += cardxOffset;
					
				}
				// indicate player total
				font = new Font("Arial", Font.BOLD, cardwidth/6);
				g.setFont(font);
				if (playerHand2.total() > 21)
				{
					g.setColor(Color.WHITE);
					g.drawString("Second Hand total: " +playerHand2.total(),6*width/10,9*height/10);
					g.setColor(Color.RED);
					g.drawString("BUST!",6*width/10,19*height/20);
				}
				else if (playerHand2.getHand().size() == 2 && playerHand2.total() == 21)
				{
					g.setColor(Color.WHITE);
					g.drawString("Player total: " +playerHand2.total(),6*width/10,9*height/10);
					g.setColor(Color.RED);
					g.drawString("BLACKJACK!",6*width/10,19*height/20);
				} 
				else
				{
					g.setColor(Color.WHITE);
					g.drawString("Second Hand total: " +playerHand2.total(),6*width/10,9*height/10);
					
				}

			}
		}


	}  

}