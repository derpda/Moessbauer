set terminal svg size 1920,1080 fname 'Verdana' fsize 10
set output '../results/steel/rough.svg'
a=18.5
c=0.2
f(x)=a*(1-1/(2*pi)*b/((x-c)**2+b**2/4))
fit f(x) "../data/steel/full_measure.csv" u 1:($3/$2*1000-29.7839):(sqrt(sqrt($3)/$2*1000)**2+0.16**2) yerror via a,b,c
plot "../data/steel/ful_measure.csv" u 1:($3/$2*1000-29.7839):(sqrt(sqrt($3)/$2*1000)**2+0.16**2) w yerrorbars,f(x)
