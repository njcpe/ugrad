%Sys Constants
A = [-0 1 0; -4 -0.4 40; 0 0 -4];
B = [0; 0; 2];
%C_p = eye(3);
D = zeros(3,1);
C = [1 0 0];
beta_max = 1.99;
Ts = 4.5;
T = min((pi/beta_max),Ts/60)
x0 = [0.17; 0; 0];



ADP = s1/Ts + j*1.99;
%Spoles = [-4 ADP conj(ADP)]
Spoles = s3/Ts;
%Compute K bar using SDPP Poles
Zpoles = exp(T*(Spoles))
[phi,gamma] = c2d(A,B,T)
K = place(phi, gamma, Zpoles)
%printf(dsm(phi, gamma, K))
dsm(phi, gamma, K)