#include <cstdio>
#include <cstring>
#include <vector>

void ddump(double old[], double newer[], int size)
{
    for(int i=0; i<=size; ++i)
        old[i] = newer[i];
}

int main()
{
    double coef[100];
    double old_coef[100];
    double value[100];
    double denom = 1;
    int desired;
    int degree = 0;
    int N;

    scanf("%d %d", &N, &desired);
    if(N >= 100) return 1;

    memset(coef, 0, sizeof(coef));
    memset(old_coef, 0, sizeof(old_coef));
    coef[0] = 1;
    old_coef[0] = 1;

    for(int i=0; i<N; ++i)
    {
        scanf("%lf", &value[i]);
        if(i == desired) continue;
        ++degree;
        for(int j=0; j<degree; ++j)
        {
            coef[j+1] -= value[i] * old_coef[j];
        }
        ddump(old_coef, coef, degree);
    }
    for(int i=0; i<=degree; ++i)
    {
        if(i == desired) continue;
        denom *= (value[desired] - value[i]);
    }
    for(int i=0; i<=degree; ++i)
    {
        coef[i] /= denom;
    }

    for(int i=0; i<=degree; ++i)
        printf("%lf\n", coef[i] );

    return 0;
}
