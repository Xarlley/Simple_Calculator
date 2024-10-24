%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN
%left PLUS MINUS  // 加法和减法的优先级
%left MULTIPLY DIVIDE  // 乘法和除法的优先级

%%

calculation:
    expression '\n' { printf("Result: %d\n", $1); }
  | calculation expression '\n' { printf("Result: %d\n", $2); }
  ;

expression:
    expression PLUS expression { $$ = $1 + $3; }
  | expression MINUS expression { $$ = $1 - $3; }
  | expression MULTIPLY expression { $$ = $1 * $3; }
  | expression DIVIDE expression { 
        if ($3 == 0) {
            yyerror("Division by zero!");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
    }
  | LPAREN expression RPAREN { $$ = $2; }
  | NUMBER { $$ = $1; }
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter an expression: \n");
    return yyparse();
}
