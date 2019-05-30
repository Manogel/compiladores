EMAIL       [A-z0-9]+@[A-z]+\.(com)(\.[A-z]{2,3})*
DECIMAL     -?[0-9]+,[0-9]+
BINARIO     b[0+1]+
PALAVRA     [A-z]+
PLACA       [A-Z]{3}-[0-9]{4}
NUMERO      -?[0-9]+
WHITE_SPACE [ \t\r\n]
COMENTARIO  [^*/]*
IP          [0-1]{0,1}[0-9]{1,2}|[2][5][0-5]|[2][0-4][0-9]

%%

"TRUE"      {printf("PALAVRA RESERVADA: %s\n", yytext);}
"FALSE"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"IF"        {printf("PALAVRA RESERVADA: %s\n", yytext);}
"WHILE"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"FOR"       {printf("PALAVRA RESERVADA: %s\n", yytext);}
"BEGIN"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"ELSE"      {printf("PALAVRA RESERVADA: %s\n", yytext);}
">"         {printf("OPERADOR RELACIONAL: %s\n", yytext);}
"<"         {printf("OPERADOR RELACIONAL: %s\n", yytext);}
"="         {printf("OPERADOR RELACIONAL: %s\n", yytext);}
"=="        {printf("OPERADOR RELACIONAL: %s\n", yytext);}
">="        {printf("OPERADOR RELACIONAL: %s\n", yytext);}
"<="        {printf("OPERADOR RELACIONAL: %s\n", yytext);}
"!="        {printf("OPERADOR RELACIONAL: %s\n", yytext);}
"+"         {printf("OPERADOR ARITIMETICO: %s\n", yytext);} 
"-"         {printf("OPERADOR ARITIMETICO: %s\n", yytext);} 
"*"         {printf("OPERADOR ARITIMETICO: %s\n", yytext);} 
"/"         {printf("OPERADOR ARITIMETICO: %s\n", yytext);} 
"&&"        {printf("OPERADOR LOGICO: %s\n", yytext);}
"||"        {printf("OPERADOR LOGICO: %s\n", yytext);}

{IP}"."{IP}"."{IP}"."{IP}   {printf("IP: %s\n", yytext);}
{NUMERO}{3}"."{NUMERO}{3}"."{NUMERO}{3}"-"{NUMERO}{2}   {printf("CPF: %s\n", yytext);}
{EMAIL}                     {printf("EMAIL: %s\n", yytext);}
{PALAVRA}                   {printf("PALAVRA: %s\n", yytext);}
{NUMERO}                    {printf("NUMERO: %s\n", yytext);}
{NUMERO}"."{NUMERO}         {printf("REAL: %s\n", yytext);}
{BINARIO}                   {printf("BINARIO: %s\n,", yytext);}
{DECIMAL}                   {printf("DECIMAL: %s\n", yytext);}
{PLACA}                     {printf("PLACA: %s\n", yytext);}
{WHITE_SPACE}+ /*EliminarEspacoEmBranco*/
.   /*CaracterNaoReconhecido*/  {printf("NAO RECONHECIDO: %s\n", yytext);}
"/*"{COMENTARIO}"*/" {printf("COMENTARIO: %s\n", yytext);}

%%
int yywrap() {
    return 1;
}

int main(void) {
    yylex();
    return 0;
}