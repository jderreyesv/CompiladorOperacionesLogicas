package tree;

public class And extends Tree {
    Tree left;
    Tree right;

    public And(Tree l, Tree r) {
        left = l;
        right = r;
    }

    public Integer eval(Environment e) {
    	int a=0;
    	if(left.eval(e)==1&&right.eval(e)==1){
    		a=1;
    	}else{
    		a=0;
    	}
        return a;
    }
    public void print() {
        System.out.print("(AND ");
        left.print();
        System.out.print(", ");
        right.print();
        System.out.print(")");
    }
}

