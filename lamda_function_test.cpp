#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    vector<int> v = {5,1,8,3,7,2,4,5,2,9};
    sort(v.begin(), v.end(), [](int a, int b) { return a < b; });
    for (auto i: v) {
        cout << i << " ";
    }
    return 0;
}