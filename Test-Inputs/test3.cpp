#include <iostream>
using namespace std;


int main()
{
    int n;
    cout << "Enter an option\n";
    cout << "1. Course\n";
    cout << "2. Project\n";
    cout << "3. Exit\n";
    cin >> n;

    switch (n)
    {
    case 1:
        cout << "CS 224";
        break;
    case 2:
        cout << "Lexical ANalyzer";
        break;
    case 3:
        break;
    default:
        break;
    }


}