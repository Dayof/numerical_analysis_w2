#include <cstdio>
#include <cstring>
#include <vector>
#include <cmath>

void ddump(double old[], double newer[], int size)
{
    for(int i=0; i<=size; ++i)
        old[i] = newer[i];
}

int main()
{
    double coef[100];
    double all_coef[100];
    double old_coef[100];
    double denom, sum =0;
    double value[17] = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0,
                    1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7};
    double y[17] = {8.3827801, 8.9531612, 1.2518859, 7.7934885, 1.7538714, 1.6550660, 5.3359199, 0.42043209, 2.8155446, 0.11795521, 5.7835269, 4.6180773, 2.5036669, 2.6098585, 3.3071423, 3.3925891, 4.1093898};
    int desired;
    int degree;
    int N = 17;

    memset(all_coef, 0, sizeof(all_coef));

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
            printf("%lf*t^{%d} + ", coef[i], degree-i);

        for(int k=0; k<=degree; ++k)
            all_coef[k] += y[desired]*coef[k];
    }

    printf("\n\nPolinômio Interpolador de Lagrange\n");
    for(int i=0; i<=degree; ++i)
        printf("%lf*t^{%d} + ", all_coef[i], degree-i);

    printf("\n\nExemplo para t=1.7\n");
    for(int i=0; i<=degree; ++i)
        sum += all_coef[i]*pow(1.7, degree-i);

    printf("%lf\n", sum);

    return 0;
}
