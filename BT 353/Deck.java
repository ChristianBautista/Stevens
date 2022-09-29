import java.util.Arrays;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Deck {
    private List<Card> deck = new ArrayList<Card>();
    private List<Card> discard = new ArrayList<Card>();
    private String[] suits = {"Diamonds", "Spades", "Hearts", "Clubs"};
    private String[] names = {"Jack", "Queen", "King"};

    public void create() {
        for(int i=0; i<4; i++) {
            Card ace = new Card(1, "Ace", suits[i]);
            deck.add(ace);
            for(int j=2; j<=10; j++) {
                Card num = new Card(j, suits[i]);
                deck.add(num);
            }
            for(int k=0; k<3; k++) {
                Card face = new Card(10, names[k], suits[i]);
                deck.add(face);
            }
        }
    }
    public void shuffle() {
        Collections.shuffle(deck);
    }
    public Card deal() {
        Card top = deck.get(0);
        discard.add(top);
        deck.remove(0);
        return top;
    }
    public void reset() {
        while(discard.size()!=0) {
            deck.add(discard.get(0));
            discard.remove(0);
        }
    }
    public String toString() {
        return Arrays.toString(deck.toArray());
    }
}