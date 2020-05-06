#include <cstdio>

int main() {
    int n, m;
    do {
        printf("Введите N, M (N < M) через запятую: ");
        scanf("%d, %d", &n, &m);
    } while (n >= m);

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

        printf("Наибольшой элемент %d на %d\n", a[i][mxj], mxj);

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

    printf("\n\nВывод змейки:\n");
    for (int z = 0; z < n * m / 2 ; ++z) {
        int i = z / m;
        int j = z % m;

        if (i % 2) j = m - 1 - j;


        printf("%d - ", a[i][j]);
        if (i != (n - i - 1) || j != (m - j - 1))
            printf("%d - ", a[n - i - 1][m - j - 1]);
    }
}