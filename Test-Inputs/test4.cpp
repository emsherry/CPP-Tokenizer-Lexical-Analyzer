#include <iostream>
#include <math.h>

using namespace std;
int greatervalue(int a, int b)
{
    if(a<b)
        return a;
    else 
        return b;
}

int main()
{
    int a = 3;
    int b = 5;
    int c =  greatervalue(a,b);
    cout << "Which of the following values is greater?";
   cout << "The greater value is " << c;


}