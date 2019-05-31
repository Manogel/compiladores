%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex();
	void yyerror(char *);
%}

%token	FIMLINHA
HEXADECIMAL
BINARIO
EMAIL
IP
TRUE
FALSE
INTEIRO
FLOAT
IF
ELSE
ELIF
WHILE
AP
FP
ADD
SUB
MULT
DIV
AC
FC
AND
OR
NOT
DIFERENTE
MAIGUAL
MEIGUAL
MAIOR
MENOR  //do outro arquivo
%start programa

%%
programa: 
		 | programa S
		 ;
S : IP {printf("\nIP ACEITO\n");}
| BINARIO {printf("\nBINARIO ACEITO\n");}
| EMAIL {printf("\nEMAIL ACEITO\n");}
| HEXADECIMAL {printf("\nHEXADECIMAL ACEITO\n");}
| TRUE {printf("\nPALAVRA RESERVADA\n");}
| FALSE {printf("\nPALAVRA RESERVADA\n");}
| FIMLINHA	{printf("\nFIM DE LINHA\n");}
| if 
|	WHILE AP Expr1 FP AC FC {printf("\nWHILE ACEITO\n");}
|	if else
| if elif else
| INTEIRO | FLOAT	{printf("\nNUMERO ACEITO\n");}
;

elif : ELIF AP Expr1 FP AC FC {printf("\nELIF ACEITO\n");}

if : IF AP Expr1 FP AC FC {printf("\nIF ACEITO\n");}
;

else : ELSE AC FC {printf("\nELSE ACEITO\n");}
;

Expr1 : INTEIRO Opmat1 INTEIRO
| FLOAT Opmat1 FLOAT
| IP
;

Opmat1 : ADD | SUB | DIV | MULT | AND | OR 
;


%%
void yyerror(char *s){
	fprintf(stderr, "%s\n",s);
}
int main(void){
	return yyparse();
}
