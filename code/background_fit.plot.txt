f(x)=a1*exp(-b1*x)+a2*exp(-b2*x)
a1=16.6
a2=29.6
b1=1.8
b2=0.03
fit f(x) "../data/background/data.csv" u 1:2:3:4 xyerror via a1,a2,b1,b2
set terminal svg size 1920,1080 fname 'Verdana' fsize 10
set output '../results/background/exp_fit.svg'
plot "../data/background/data.csv" u 1:2:3:4 w xyerrorbars, f(x)
