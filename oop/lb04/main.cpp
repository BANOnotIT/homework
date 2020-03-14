#include <cstdio>

int main() {
    int n(3), m(4);

    int a[n][m];
    printf("\n\nВведите метрицу по 1 элементу на ячейку:\n");
    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            scanf("%d", &a[i][j]);


    printf("Исходная матрица:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++)
            printf("%4d", a[i][j]);
        printf("\n");
    }

    printf("\n\nПреобразование матрицы:\n");
    for (int i = 0; i < n; i++) {
        int mxj = 0;
        for (int j = 1; j < m; ++j)
            if (a[i][j] > a[i][mxj]) mxj = j;

        printf("Наибольшой элемент %d на %d (%p)\n", a[i][mxj], mxj, &a[i][mxj]);

        int s = a[i][0];
        for (int j = 1; j < mxj; ++j) {
            s += a[i][j];
        }
        a[i][mxj] = s;
    }

    printf("\n\nПреобразованная матрица:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++)
            printf("%4d", a[i][j]);
        printf("\n");
    }
}