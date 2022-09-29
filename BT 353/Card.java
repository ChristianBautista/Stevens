public class Card {
    private int val;
    private String name;
    private String suit;

    public Card(int val, String suit) {
        this.val = val;
        this.suit = suit;
        this.name = "";
    }
    public Card(int val, String name, String suit) {
        this.val = val;
        this.name = name;
        this.suit = suit;
    }

    public int getVal() {
        return val;
    }
    public String getName() {
        return name.isEmpty() ? Integer.toString(val) : name;
    }
    public String getSuit() {
        return suit;
    }
    public String toString() {
        return getName() + " of " + suit;
    }
}
