package tree;

public class Not extends Tree {
    Tree left;

    public Not(Tree l) {
        left = l;
        
    }

    public Integer eval(Environment e) {
    	int a =0;
    	if(left.eval(e)==1){
    		a=0;
    	}else{
    		a=1;
    	}
        return a;
    }
    public void print() {
        System.out.print("(NOT");
        left.print();
        System.out.print(")");
    }
}

