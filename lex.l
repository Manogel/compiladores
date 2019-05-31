%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
	extern int yylval;
	void yyerror (char *);
%}

WHITE_SPACE [ \t\r\n]
COMENTARIO	[^*/]*
EMAIL       [A-z0-9]+@[A-z]+\.(com)(\.[A-z]{2,3})*
DECIMAL     -?[0-9]+,[0-9]+
BINARIO     b[0+1]+
HEXADECIMAL h[0-9A-F]+
PALAVRA     [A-z]+
IP          [0-1]{0,1}[0-9]{1,2}|[2][5][0-5]|[2][0-4][0-9]

%%
[0-9]+	{printf("TOKEN INTEIRO: %s\n",yytext);
		yylval = atoi(yytext);
		return (INTEIRO);
		}
[0-9]+"."[0-9]+	{printf("TOKEN FLOAT: %s\n",yytext);
		yylval = atoi(yytext);
		return (FLOAT);
		}

{IP}"."{IP}"."{IP}"."{IP} {printf("TOKEN IP: %s\n",yytext);
		yylval = atoi(yytext);
		return (IP);
		}	


{HEXADECIMAL} {printf ("HEXADECIMAL: %s\n", yytext); return(HEXADECIMAL);}
{BINARIO} {printf ("BINARIO: %s\n", yytext); return(BINARIO);}
{EMAIL}	{printf ("EMAIL: %s\n", yytext); return(EMAIL);}
"FALSE"	{printf ("PALAV RESERVADA: %s\n", yytext); return(FALSE);}	
"TRUE"	{printf ("PALAV RESERVADA: %s\n", yytext); return(TRUE);}	
";" 		{printf ("TOKEN FIMLINHA: %s\n", yytext); return(FIMLINHA);}
"if" 		{printf ("TOKEN IF: %s\n", yytext); return(IF);}
"else"  {printf ("TOKEN ELSE: %s\n", yytext); return(ELSE);}
"elif" {printf ("TOKEN ELIF: %s\n", yytext); return(ELIF);}
"while" {printf ("TOKEN WHILE: %s\n", yytext); return(WHILE);}
"("	 		{printf ("TOKEN AP: %s\n", yytext); return(AP);}
")"	 		{printf ("TOKEN FP: %s\n", yytext); return(FP);}
"+"		  {printf ("TOKEN ADD: %s\n", yytext); return(ADD);}
"-"	 		{printf ("TOKEN SUB: %s\n", yytext); return(SUB);}
"*"	 		{printf ("TOKEN MULT: %s\n", yytext); return(MULT);}
"/"	 		{printf ("TOKEN DIV: %s\n", yytext); return(DIV);}
"{"	 		{printf ("TOKEN AC: %s\n", yytext); return(AC);}
"}"	 		{printf ("TOKEN FC: %s\n", yytext); return(FC);}
"and"	 	{printf ("TOKEN AND: %s\n", yytext); return(AND);}
"or"		{printf ("TOKEN OR: %s\n", yytext); return(OR);}
"!"			{printf ("TOKEN NOT: %s\n", yytext); return(NOT);}
"!="		{printf ("TOKEN DIFERENTE: %s\n", yytext); return(DIFERENTE);}
">="		{printf ("TOKEN MAIGUAL: %s\n", yytext); return(MAIGUAL);}
"<="		{printf ("TOKEN MEIGUAL: %s\n", yytext); return(MEIGUAL);}
">"			{printf ("TOKEN MAIOR: %s\n", yytext); return(MAIOR);}
"<" 		{printf ("TOKEN MENOR: %s\n", yytext); return(MENOR);}


{WHITE_SPACE}+					/*EliminaEspacoEmBranco*/
. 								/*CaracterNaoReconhecido*/{printf("Caracter Nao Reconhecido: %s\n",yytext);}
"/*"{COMENTARIO}"*/"			{printf("COMENTARIO: %s\n",yytext);}
%%

int yywrap(void){
	return 1;
}