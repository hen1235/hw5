%{

/* Declarations section */
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "attributes.h"
#include "parser.tab.hpp"

void showToken(const char* name);

%}

%option yylineno
%option noyywrap


STRING							(\"([^\n\r\"\\]|\\[rnt"\\])+\") 
WHITESPACE						([\t ])
CRLF							([\n\r])
COMMENT							(\/\/[^\r\n]*[\r|\n|\r\n]?)
NUM								(0|[1-9][0-9]*)
ID 								([a-zA-Z][a-zA-Z0-9]*)
RELOP							(==|!=|<|>|<=|>=)
EQ								(==)
NEQ								(!=)
LT								(<)
GT								(>)
LTE								(<=)
GTE								(>=)
ADD								([+])
SUB								([-])
MUL								([*])
DIV								([/])

%%


void 							return VOID;
int 							return INT;
byte 							return BYTE;
b 								return B;
bool							return BOOL;
and 							return AND;
or								return OR;
not								return NOT;
true							return TRUE;
false							return FALSE;
return							return RETURN;
if								return IF;
else							return ELSE;
while							return WHILE;
break							return BREAK;
;								return SC;
,								return COMMA;
\(								return LPAREN;
\)								return RPAREN;
\{								return LBRACE;
\}								return RBRACE;
\[								return LBRACK;
\]								return RBRACK;
=								return ASSIGN;
{MUL}							return MUL;
{DIV}							return DIV;
{ADD}							return ADD;
{SUB}							return SUB;
{ID}							{Var var; var.name = yytext; yylval = var;  return ID;}
{NUM}							{Var var; sscanf(yytext, "%d", &(var.val)); yylval = var;  return NUM;}
{EQ}							return EQ;
{NEQ}							return NEQ;
{LT}							return LT;
{GT}							return GT;
{LTE}							return LTE;
{GTE}							return GTE;
{STRING}						return STRING;
{WHITESPACE}|{CRLF}|{COMMENT}	;
.								{ errorLex(yylineno); exit(0); }


										
%%

void showToken(const char* name) {
	
}

