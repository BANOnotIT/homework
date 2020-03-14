#include <iostream>

using namespace std;

struct Item {
    int val;
    Item *next;
};

int main() {
    cout << "Enter chars" << endl;
    string input;
    cin >> input;

    auto start = new Item;
    auto last = start;

    for (char ch:input) {
        last->val = ch - 0x30;
        last->next = new Item;
        last = last->next;
    }


    int sum(0);
    int stat[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    auto cur = start;
    while (cur != nullptr && cur->next != nullptr) {
        sum += cur->val;
        stat[cur->val]++;

        cout << cur->val << " : ";

        cur = cur->next;
    }
    cout << endl;

    cout << "Sum: " << sum << endl << endl;

    cout << "Table" << endl;
    cout.flush();

    for (int i = 0; i < 10; ++i)
        if (stat[i])
            printf("%d: %4d\n", i, stat[i]);

    // cleaning up
    cur = start;
    Item *tmp;
    while (cur != nullptr) {
        tmp = cur;
        cur = cur->next;
        delete tmp;
    }
}
/// 1234567876543456789 => 100