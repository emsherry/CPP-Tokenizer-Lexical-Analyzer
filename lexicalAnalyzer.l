%{
    int lines = 1;

    void writeFile(char *keyword, char *value, int line) {
        FILE *outputFile = fopen("output.txt", "a");
        fprintf(outputFile, "Line No: %i\t\t%s\t--->\t%s\n", line, value, keyword);
        fclose(outputFile);
    }

%}

RESERVEDWORDS if|else|for|while|do|new|delete|class|private|public|friend|return|static|cout|cin|endl
LIBRARY "#include"" "*"<".*">"
NAMESPACE using" "namespace" "{VARIABLENAME}
NUMBER [0-9]
CHAR '.'|''
INTEGER [+-]?{NUMBER}+
FLOAT [+-]?{NUMBER}*"."{NUMBER}+
STRING \"(\\.|[^"\\])*\"
OPERATORS [+\-\*/\^<>=&%]|"<<"|">>"|"=="|"!="|">="|"<="|"++"|"--"
VARIABLENAME (\$|_|[a-zA-Z])+(\$|_|[a-zA-Z0-9])*
DATATYPE int|string|float|char|bool|double
ARRAY {VARIABLENAME}\[{INTEGER}\]
ARRAYVALUES \{" "*{INTEGER}(," "*{INTEGER})*\}|\{" "*{STRING}(," "*{STRING})*\}|\{" "*{CHAR}(," "*{CHAR})*\}|\{" "*{FLOAT}(," "*{FLOAT})*\}
FUNCTION {DATATYPE}" "+{VARIABLENAME}\((({DATATYPE}" "{VARIABLENAME})(," "*{DATATYPE}" "{VARIABLENAME})*)*\)
FUNCTIONCALL {VARIABLENAME}\(((" "*({VARIABLENAME}|{INTEGER}|{STRING}|{CHAR}|{FLOAT}))(," "({VARIABLENAME}|{INTEGER}|{STRING}|{CHAR}|{FLOAT}))*)*\)
BRACKETOPEN [\(\[\{]
BRACKETCLOSE [\)\]\}]
LOOPS (for" "*\([^;]*;[^;]*;[^\)]*\))|(while" "*\(.+?\))
DELIMITER [ \t;,]*

%%
{DELIMITER} {;}
{LOOPS} {writeFile("Loop", yytext, lines);}
{RESERVEDWORDS} {writeFile("Reserved Word", yytext, lines);}
{NAMESPACE} {writeFile("Namespace", yytext, lines);}
{LIBRARY} {writeFile("Library", yytext, lines);}
{FLOAT} {writeFile("Float", yytext, lines);}
{INTEGER} {writeFile("Integer", yytext, lines);}
{OPERATORS} {writeFile("Operator", yytext, lines);}
{STRING} {writeFile("String", yytext, lines);}
{CHAR} {writeFile("Character", yytext, lines);}
{FUNCTION} {writeFile("Function Declaration", yytext, lines);}
{FUNCTIONCALL} {writeFile("Function Call", yytext, lines);}
{DATATYPE} {writeFile("Datatype", yytext, lines);}
{VARIABLENAME} {writeFile("Variable", yytext, lines);}
{ARRAY} {writeFile("Array Decleration", yytext, lines);}
{ARRAYVALUES} {writeFile("Array", yytext, lines);}
{BRACKETOPEN} {writeFile("Opening Bracket", yytext, lines);}
{BRACKETCLOSE} {writeFile("Closing Bracket", yytext, lines);}
\n {lines++;}
%%

int yywrap() {}
int main() {
    FILE *fp;
    fp = fopen("test1.cpp","r");
    yyin = fp;
    yylex();
    return 0;
}