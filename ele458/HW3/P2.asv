%Sys Constants
A = [-30 0 0 0; 0 0 1 0; 1225 -1225 -21 0; 0 1 0 0];
B = [30; 0; 0; 0];
C = [0 0 0 1];
T = 0.01;
Ts = 0.35;
x0 = [0; 0; 0; -1];

ADP = s1/Ts + j*33.3879;
Spoles = [-30 ADP conj(ADP) s1/Ts]

%Compute K bar using SDPP Poles
Zpoles = exp(T*(Spoles))
[phi,gamma] = c2d(A,B,T)
K = place(phi, gamma, Zpoles)
%printf(dsm(phi, gamma, K))
dsm(phi, gamma, K)