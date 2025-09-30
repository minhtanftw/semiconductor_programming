#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;

int main() {
    vector <int> vec = {10 -23, 30, -40, 50, -60};

    cout << "Original vector before applying lamda function: ";
    for (auto i: vec) {
        cout << i << " ";
    }
    cout << endl;
    //capture vector by reference
    // clause
    auto lamda = [&vec] (){
        cout << "vector values inside lamda function: ";
        for (auto &i: vec) {
            i  *= 100;
            cout << i << " ";
    
        }
        cout << endl;
    };
    lamda();
    cout << "Vector after applying lamda function: ";
    for (auto i: vec) {
        cout << i << " ";
    }

}