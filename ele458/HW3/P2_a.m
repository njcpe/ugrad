%Sys Constants
A = [-0 1 0; -4 -0.4 40; 0 0 -4];
B = [0; 0; 2];
%C_p = eye(3);
D = zeros(3,1);
C = [1 0 0];
T = 0.01;
%Ts = 0.35;
x0 = [0.17; 0; 0];
K = 0*[1 1 1];


ADP = s1/Ts + j*33.3879;
Spoles = [-30 ADP conj(ADP) s1/Ts]

%Compute K bar using SDPP Poles
Zpoles = exp(T*(Spoles))
[phi,gamma] = c2d(A,B,T)
K = place(phi, gamma, Zpoles)
%printf(dsm(phi, gamma, K))
dsm(phi, gamma, K)