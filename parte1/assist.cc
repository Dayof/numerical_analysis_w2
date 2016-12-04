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
    double denom;
    double value[17] = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0,
                    1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7};
    int desired;
    int degree;
    int N = 17;

    for(int u=0; u<N; ++u)
    {
        degree = 0;
        denom = 1;
        desired = u;
        if(N >= 100) return 1;

        memset(coef, 0, sizeof(coef));
        memset(old_coef, 0, sizeof(old_coef));
        coef[0] = 1;
        old_coef[0] = 1;

        for(int i=0; i<N; ++i)
        {
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

        printf("\nL %d\n", desired);
        for(int i=0; i<=degree; ++i)
            printf("%lf*x^{%d} ", coef[i], degree-i);
    }

    return 0;
}
