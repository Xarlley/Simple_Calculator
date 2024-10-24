%{
#include "y.tab.h"  // 包含 Yacc 生成的头文件
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUMBER; }  // 匹配数字，并返回标记 NUMBER
"+"             { return PLUS; }                            // 匹配加号
"-"             { return MINUS; }                           // 匹配减号
"*"             { return MULTIPLY; }                        // 匹配乘号
"/"             { return DIVIDE; }                          // 匹配除号
"("             { return LPAREN; }                          // 匹配左括号
")"             { return RPAREN; }                          // 匹配右括号
[ \t]           { /* 忽略空白符和制表符 */ }
\n              { return '\n'; }                            // 将换行符返回给 Yacc

.               { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
