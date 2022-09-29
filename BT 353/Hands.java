import java.util.ArrayList;
import java.util.List;

public class Hands {
    private List<Hand> hands = new ArrayList<Hand>();

    public void addHand(Hand hand) {
        hands.add(hand);
    }
    public void dd(int index, Card hit) {
        hands.get(index).setBet(hands.get(index).getBet()*2);
        hands.get(index).addCard(hit);
        hands.get(index).stop = true;
    }
    public void split(int index, Card first, Card second) {
        List<Card> hand = hands.get(index).getHand();
        int bet = hands.get(index).getBet();
        hands.remove(index);
        Hand split1 = new Hand(hand.get(0),first,bet);
        Hand split2 = new Hand(hand.get(1),second,bet);
        hands.add(split1);
        hands.add(split2);
        if(hand.get(0).getVal()==1) {
            split1.stop = true;
            split2.stop = true;
        }
    }
    public Hand getHand(int index) {
        return hands.get(index);
    }
    public List<Hand> getHands() {
        return hands;
    }
}