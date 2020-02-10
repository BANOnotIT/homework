#include <cstdio>

int main() {
    int a;
    printf("Введите A: ");
    scanf("%d", &a);

    int prev, cur, tmp;
    prev = cur = 1;
    while (cur <= a) {
        tmp = cur;
        cur = cur + prev;
        prev = tmp;
    }

    printf("Факториал %d > %d", cur, a);
}
