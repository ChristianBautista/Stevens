import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;

public class Hand {
    private List<Card> hand = new ArrayList<Card>();
    private int bet = 0;
    public boolean stop = false;

    public Hand(Card first, Card second) {
        hand.add(first);
        hand.add(second);
    }
    public Hand(Card first, Card second, int bet) {
        hand.add(first);
        hand.add(second);
        this.bet = bet;
    }
    public void addCard(Card card) {
        hand.add(card);
    }
    public void setBet(int bet) {
        this.bet = bet;
    }
    public int total() {
        int total = 0, numAces = 0;
        for(int i=0; i<hand.size(); i++) {
            int val = hand.get(i).getVal();
            total+=val;
            if(val==1) {
                numAces++;
            }
        }
        while(numAces!=0 && total+10<=21) {
            total+=10;
            numAces--;
        }
        return total;
    }
    public void clear() {
        hand = new ArrayList<Card>();
    }
    public List<Card> getHand() {
        return hand;
    }
    public int getBet() {
        return bet;
    }
    public String toString() {
        return Arrays.toString(hand.toArray());
    }
}