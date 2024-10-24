# Simple_Calculator
A simple calculator based on yacc and flex.

## Environment: Ubuntu 22.04

```
apt install yacc flex gcc
```

## How to edit

1. Edit **calc.l** and **calc.y** .

2. Compile:
```
flex calc.l
yacc -d calc.y
gcc lex.yy.c y.tab.c -o calc -lm
```

## How to run
```
./calc
```

## Authors

NUDT homework by LSF (^_^)