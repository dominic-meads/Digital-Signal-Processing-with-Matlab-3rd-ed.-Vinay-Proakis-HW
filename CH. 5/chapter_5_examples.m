%% Ex. 5.2
clear all
clc
% a).
%           {  L,   k = 0, +-N, +-2N....
%  |X(k)| = {  abs(sin(pi*k*L/N)/sin(pi*k/N)), otherwise
% 
%
% b).
L1 = 5; 
N1 = 20; 
k = -N1/2:N1/2;  % only need to plot one period N, alternatively, can plot from 0 to N.
xbar1 = [ones(1,L1) zeros(1,N1-L1)];  % square wave (high from 1 to L, low for rest of period N
Xbar1 = dfs(xbar1,N1);
magX1 = abs([Xbar1(N1/2+1:N1) Xbar1(1:N1/2+1)]);
subplot(2,2,1); stem(k,magX1); title('Magnitude of Xbar(k) for L=5, N=20'); xlabel('k'); ylabel('Magnitude of Xbar(k)');

% c). the DFS plots look like sinc functions

% check part c, I wonder if a 50% square wave DFS plot is just a scaled
% sinc pulse?
L2 = 100;  % 50% duty cycle
N2 = 200; 
k = -N2/2:N2/2;  % only need to plot one period N, alternatively, can plot from 0 to N.
xbar2 = [ones(1,L2) zeros(1,N2-L2)];  % square wave (high from 1 to L, low for rest of period N
Xbar2 = dfs(xbar2,N2);
magX2 = abs([Xbar2(N2/2+1:N2) Xbar2(1:N2/2+1)]);
figure;
k1 = -N2/2:0.01:N2/2; 
plot(k,magX2); hold on; S = 100*abs(sinc(k1)); plot(k1,S);

% extremley similar shaped ^ (more analysis needed to see how similar

%% Ex. 5.5

N1 = 5; 
k1 = 0:N1-1;
w1k = 2*pi*k1/N1;
X1k = 1./(1-0.7*exp(-j*w1k));
x1n = real(idfs(X1k,N1));
x1_bar = x1n' * ones(1,8);
x1_bar = (x1_bar(:))';
figure;
subplot(2,2,1); stem(0:39,x1_bar); xlabel('n'); ylabel('x1_bar'); axis([0 40 -.1 1.5]); title('N=5');
n1 = 0:N1-1;
x1 = 0.7.^n1;
error1 = max(abs(x1-x1_bar(1:N1)))

N2 = 10; 
k2 = 0:N2-1;
w2k = 2*pi*k2/N2;
X2k = 1./(1-0.7*exp(-j*w2k));
x2n = real(idfs(X2k,N2));
x2_bar = x2n' * ones(1,4);
x2_bar = (x2_bar(:))';
subplot(2,2,2); stem(0:39,x2_bar); xlabel('n'); ylabel('x2_bar'); axis([0 40 -.1 1.5]); title('N=10');
n2 = 0:N2-1;
x2 = 0.7.^n2;
error2 = max(abs(x2-x2_bar(1:N2)))

N3 = 20; 
k3 = 0:N3-1;
w3k = 2*pi*k3/N3;
X3k = 1./(1-0.7*exp(-j*w3k));
x3n = real(idfs(X3k,N3));
x3_bar = x3n' * ones(1,2);
x3_bar = (x3_bar(:))';
subplot(2,2,3); stem(0:39,x3_bar); xlabel('n'); ylabel('x3_bar'); axis([0 40 -.1 1.5]); title('N=20');
n3 = 0:N3-1;
x3 = 0.7.^n3;
error3 = max(abs(x3-x3_bar(1:N3)))

N4 = 50; 
k4 = 0:N4-1;
w4k = 2*pi*k4/N4;
X4k = 1./(1-0.7*exp(-j*w4k));
x4n = real(idfs(X4k,N4));
x4_bar = x4n(1:40);
subplot(2,2,4); stem(0:39,x4_bar); xlabel('n'); ylabel('x4_bar'); axis([0 40 -.1 1.5]); title('N=50');
n4 = 0:N4-1;
x4 = 0.7.^n4;
error4 = max(abs(x4-x4n))

% increasing N results in a lower amount of copies (aliasing) in the time
% domain. Also, a higher N results in a more accurate reconstruction (lower
% error when compared to the time domain signal of the same index n.