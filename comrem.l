%{
    int myflag;
%}

%%
\"([^\\\"\n]|((\\)+[^\\\"])|(\\(\\\\)*\"))*(\\\\)*\"     {
  ECHO;
  myflag = 0;
  }
\/\/([^\n])*		{
    printf(" ");
    myflag = 0;
     }
\/\*([^\*]|[\n\r]|(\*+([^\*\/]|[\n\r])))*(\*)+\/     {
    myflag = 0;
    for(int i=0;i<yyleng;i++){
        if(yytext[i]=='\n'){
            printf("\n");
        }
        else{
        printf(" ");
        }
    }
  }
(\/\*([^\/\*]|\n|(\*+[^\/])|([^\*]\/))*)      {
      myflag = 1;
      ECHO;
      }
.		{
      ECHO;
        myflag = 0;
    }
%%
int yywrap(void) {
    return 1;
}

int main() {
  yylex();
  if(myflag){
      fprintf(stderr,"Unmatched Comment");
      return EXIT_FAILURE;
  }
  else{
      return EXIT_SUCCESS;
  }
}
