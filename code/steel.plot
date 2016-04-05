set terminal svg size 1920,1080 fname 'Verdana' fsize 10
set output '../results/steel/rough.svg'
plot "../data/steel/rough_measure_steel.csv" u 1:($3/$2*1000-29.7839):(sqrt(sqrt($3)/$2*1000)**2+0.16**2) w yerrorbars
