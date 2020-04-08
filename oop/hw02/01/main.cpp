#include <iostream>
#include <cmath>

using namespace std;

bool isArmstrong(unsigned int const obj, unsigned int n) {
    auto tmp = obj;
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        sum += pow(tmp % 10, n);
        tmp /= 10;
    }
    return sum == obj;
}

int main() {
    unsigned int n;
    cout << "Enter N: ";
    cin >> n;

    unsigned int start = pow(10, n - 1);
    auto end = (unsigned int) pow(10, n) - 1;

    auto count = 0;
    for (auto i = start; i <= end; ++i)
        if (isArmstrong(i, n)) {
            cout << i << endl;
            count++;
        }

    cout << "Total count: " << count << endl;
}

