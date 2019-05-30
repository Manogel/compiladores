%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "exemplo.tab.h"
	extern int yylval;
	void yyerror (char *);
%}

WHITE_SPACE [ \t\r\n]
COMENTARIO	[^*/]*

%%
[0-9]+	{printf("TOKEN NUM: %s\n",yytext);
		yylval = atoi(yytext);
		return (NUM);
		}
		
"if" {printf ("TOKEN IF: %s\n", yytext); return(IF);}
"("	 {printf ("TOKEN AP: %s\n", yytext); return(AP);}
")"	 {printf ("TOKEN FP: %s\n", yytext); return(FP);}
"+"	 {printf ("TOKEN ADD: %s\n", yytext); return(ADD);}
"-"	 {printf ("TOKEN SUB: %s\n", yytext); return(SUB);}

{WHITE_SPACE}+					/*EliminaEspacoEmBranco*/
. 								/*CaracterNaoReconhecido*/{printf("Caracter Nao Reconhecido: %s\n",yytext);}
"/*"{COMENTARIO}"*/"			{printf("COMENTARIO: %s\n",yytext);}
%%

int yywrap(void){
	return 1;
}