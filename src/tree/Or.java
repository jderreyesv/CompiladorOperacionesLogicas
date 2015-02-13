package tree;

public class Or extends Tree {
    Tree left;
    Tree right;

    public Or(Tree l, Tree r) {
        left = l;
        right = r;
    }

    public Integer eval(Environment e) {
    	int a=0;
    	if(left.eval(e)==1&&right.eval(e)==1 || left.eval(e)==0&&right.eval(e)==1 || left.eval(e)==1&&right.eval(e)==0){
    		a=1;
    	}else{
    		a=0;
    	}
        return a;
    }
    public void print() {
        System.out.print("(OR");
        left.print();
        System.out.print(", ");
        right.print();
        System.out.print(")");
    }
}

