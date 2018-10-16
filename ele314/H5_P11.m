[N,w_c] = buttord(100, 900, .0873, 80,'s')
[numer,demer] = butter(N,w_c,'s');
sys = tf(numer, demer)
bode(sys), grid on;
title('Problem 11, LP Butterworth Filter, Noah Johnson');