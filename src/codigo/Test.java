package codigo;

import java.io.FileReader;
import java_cup.runtime.*;

class Test{
    public static void main (String [] args)
    {
        try {
        	System.out.println("entro");
            parser p = new parser(new Lexer(new FileReader("C:\\Users\\Juan\\Workspace\\eclipseworkspace\\AnalizadorCalculadora\\src\\codigo\\input")));
            Symbol s = p.parse();
            
            if (s == null) {
                System.out.println("Parsing error.");
            }
            else
            {
                System.out.println("Result = " + (Integer)s.value);
            }
        }
        catch (Exception e) {
            System.out.println("Parsing error.");
            System.out.println(e);
        };
    }
}
