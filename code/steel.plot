set terminal svg size 1920,1080 fname 'Verdana' fsize 14
set output '../results/steel/steel.svg

#Lorentzian fit

lorentz(x)=A/(2*pi)*gam0/((x-x0)**2+(gam0**2)/4)
gauss(x)=A/gam0*sqrt(4*log(2)/pi)*exp(-4*log(2)*((x-x0)/gam0)**2)
fitfunc(x)=baseline*(1-lorentz(x))
#fitfunc(x)=baseline*(1-f*lorentz(x)-(1-f)*gauss(x))
baseline=17.51
gam0=0.01
x0=0.18
A=0.3
#f=1

fit  fitfunc(x) "../data/steel/full_measure.csv" \
	u 1:($3/$2*1000-29.7839):(sqrt(sqrt($3)/$2*1000)**2+0.16**2) \
	yerror via gam0,x0,baseline,A
plot "../data/steel/full_measure.csv" \
	u 1:($3/$2*1000-29.7839):(sqrt(sqrt($3)/$2*1000)**2+0.16**2) \
	w yerrorbars,fitfunc(x)
#plot fitfunc(x)


