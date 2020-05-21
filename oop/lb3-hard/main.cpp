#include <cstdio>

int main() {
    int n;
    do {
        printf("Введите N>0: ");
        scanf("%d", &n);
    } while (n <= 0);
    int count = 0;
    int p = 2;
    while (p - 1 <= n) {
        printf("%d\n", p - 1);
        count++;
        p <<= 1;
    }
    printf("M_n <= %d  - %dшт.", n, count);
}
