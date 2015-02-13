/* --------------------------Seccion de Codigo de Usuario------------------------ */
package codigo;
import java_cup.runtime.*;

%%

/* -----------------Seccion de Opciones y Declaraciones----------------- */

/* 
   El nombre de la clase FLEX que sera creada con el Lexer.
   Este escribira el codigo generado en el archivo Lexer.java. 
*/
%class Lexer
%unicode

/* 
   Cambia al modo de compatibilidad CUP para interactuar con un el analizador CUP generado.
*/
%cup

/*
  Acceso al numero de linea actual con la variable yyline
  y el numero de columna actual con la variable yycolumn.
*/
%line
%column

/*
  Declaraciones
   
  Código entre% {y%}, los cuales deben estar al principio de una línea, 
  se copiará letra a letra en el codigo fuente de la clase analizadora. 
  Aquí se declara variables y funciones que se utilizan dentro de las 
  acciones del escáner.
*/

%{

	/* 	Para crear un nuevo java_cup.runtime.Symbol con informacion acerca
		del token actual, el token no tendra valor en este caso. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
     /* Tambien crea un nuevo java_cup.runtime.Symbol  con informacion acerca
		del token actual, pero este objeto ya tiene un valor. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

/*
  Macro Declaraciones
  
  Estas declaraciones son las expresiones regulares se usaran despues 
  en la seccion de reglas lexicas.  
*/

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace    = {LineTerminator} | [ \t\f]

/* Un literal entero que es un numero que inicia con un numero entre 
  0 y 9 seguido por 0 mas numeros entre 0 y 9 o solo un 0.  */
Digit          = [0-1]
Number         = {Digit}

/* Un identificado entero que es una palabra iniciando con una letra entre A y Z
   Z, a y z, seguida por 0 o mas letras enter A y Z, a y z, ó, 0 y 9*/
Letter         = [a-zA-Z]
Identifier     = {Letter} ({Letter}|{Digit})* 

/*Codigo para capturar el fin de archivo, se usa para evitar errores en el simbolo EOF o #0*/
%eofval{
return new Symbol(sym.EOF);
%eofval}
%%

/* ------------------------Seccion de Reglas Lexicas---------------------- */

<YYINITIAL> { 
    {Number}        { return symbol(sym.NUMBER, new Integer(Integer.parseInt(yytext()))); }
    {Identifier}    { return symbol(sym.IDENT, yytext()); }
    
    /* Imprime el token encontrado que fue declarado en la clase sym y lo retorna. */
       
    "&&"             { return symbol(sym.AND); }
    "||"             { return symbol(sym.OR); }
    "¬"             { return symbol(sym.NOT); }
    "("             { return symbol(sym.LPAREN); }
    ")"             { return symbol(sym.RPAREN); }
    "="             { return symbol(sym.ASSIGN); }

    {WhiteSpace} {}
}

/* mensajes de error al hallar un error en el analizador lexico */
.|\n            /*{ throw new Error("Illegal character <" + yytext() + ">");}*/ {System.out.println("token ilegal <" + yytext()+ ">  linea: " + (yyline+1) + " columna: " + (yycolumn+1));}

