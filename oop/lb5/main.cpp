#include <iostream>

using namespace std;

int main() {
    cout << "Enter text" << endl;
    string text;
    cin >> text;

    bool f(false), s(false), r(false);

    bool *cur;

    for (int i = 0; i < text.length(); ++i) {
        switch (text[i]) {
            case 'f':
                cur = &f;
                break;
            case 's':
                cur = &s;
                break;
            case 'r':
                cur = &r;
                break;
            default:
                continue;
        }

        if (!*cur) {
            *cur = true;
            cout << text[i + 1] << " -> " << static_cast<void *>(&text[i + 1]) << endl;

            if (f && s && r) break;
        }
    }

    return 0;
}
