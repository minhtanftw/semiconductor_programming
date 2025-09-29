#include <iostream>
#include <vector>

using namespace std;

void print(vector<int> vec) {
    for ( auto v: vec ){
        cout << v << "";
    }
}
int main() {
    vector<int> v1,v2;
    auto byRef = [&] (int m ) {
        v1.push_back(m);
        v2.push_back(m*m);
    };
    auto byVal = [&]  (int m) {
        v1.push_back(m);
        v2.push_back(m*m);

    };
    auto mixed = [&v1, &v2] (int m){
        v1.push_back(m);
        v2.push_back(m*m);

    };
    byRef(2);
    byVal(3);
    mixed(4);
    print(v1);
    print(v2);
    return 0;
    
}