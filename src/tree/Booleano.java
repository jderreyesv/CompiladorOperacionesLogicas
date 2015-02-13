package tree;

public class Booleano extends Tree {

    Integer val;
    public Booleano(Integer i) {
        val = i;
    }

    public Integer eval(Environment e) {
        return val;
    }
    public void print() {
        System.out.print("(BOOLEANO " + val + ")");
    }
}

