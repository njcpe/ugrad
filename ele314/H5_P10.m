[b,a] = butter(7, 2*pi*1000, 's');
sys = tf(b,a);
pzmap(sys)
title('Problem 10 7th ord. Butterworth Filter, Noah Johnson');
axis equal