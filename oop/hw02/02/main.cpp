#include <iostream>
#include <string>
#include <vector>

/*
 * Дана последовательность строк. Каждая строка состоит из слов, разделенных пробелами. Написать программу,
 * обеспечивающую ввод строк и их корректировку. Корректировка заключается в удалении или замене слов.
 * Если слово стоит на четном месте и начинается на букву «е», то оно удаляется;
 * если слово стоит на четном месте и начинается на букву «с», то оно замещается на слово, введенное с клавиатуры.
 * Вывести на печать исходную и скорректированную последовательности строк.
 */

using namespace std;

int main() {
    vector<string> inputv, resultv;
    cout << "Enter string or leave empty:" << endl;
    while (true) {
        string tmp;
        getline(cin, tmp);
        if (tmp.empty())
            break;
        inputv.push_back(tmp);
        resultv.emplace_back("");
    }

    for (int r = 0; r < inputv.size(); r++) {
        auto &input = inputv[r];
        auto &result = resultv[r];
        auto len = input.length();

        int words = 0;
        bool nextIsWord = false;
        for (int i = 0; i < len; i++) {

            if (nextIsWord && words % 2 == 1) {
                switch (input[i]) {
                    case 'c': {
                        string tmp;
                        cout << "Enter replacement:" << endl;
                        cin >> tmp;
                        result.append(tmp);
                        // skip until next space
                        while (i + 1 < len && input[i + 1] != ' ')
                            i++;
                        break;
                    }
                    case 'e':
                        // skip after next word
                        while (i < len && input[i] != ' ')
                            i++;
                        break;
                    default:
                        result.push_back(input[i]);
                }
            } else {
                result.push_back(input[i]);
            }

            if (input[i] == ' ') {
                words++;
                nextIsWord = true;
            } else {
                nextIsWord = false;
            }
//            words += (nextIsWord = (input[i] == ' '));
        }
    }

    cout << endl << "Source lines:" << endl;
    for (const auto &str : inputv)
        cout << str << endl;

    cout << endl << "Result lines:" << endl;
    for (const auto &str : resultv)
        cout << str << endl;

    return 0;
}
