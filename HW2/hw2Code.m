clc; clear all; close all; 
%% Section 2.1
% Generate a random frequency spectrum that goes to zero
maxOmega = 10E3*pi; 
% Plot intially based on 1.5 to show zeros...
omega = linspace(-1.5.*maxOmega, 1.5*maxOmega); 
rands = abs(rand(1, length(omega))); 
scale = 1 - (abs(omega)./maxOmega).^1; 
Y      = rands.*scale; Y(1:round(end/2)) = flip(Y(round(end/2)+ 1:end)); 

Y(Y<=0) = 0;
plot(omega, Y)
print('prob1','-dpng');
% part a
figure; 
omegaNew = [omega - 2*maxOmega, omega, omega+2*maxOmega];
YNew     = [Y Y Y];
plot(omegaNew, YNew); 
xlabel('Frequency (rad/s)'); ylabel('Amplitude'); title('Arbitrary, continuous Fourier Transform Representation');
print('prob1a','-dpng');
% Part B; 
% Resample at 4x the max frequency
figure;
omega = linspace(-2.*maxOmega, 2*maxOmega); 
rands = abs(rand(1, length(omega))); 
scale = 1 - (abs(omega)./maxOmega).^1; 
Y      = rands.*scale; Y(1:round(end/2)) = flip(Y(round(end/2)+1:end)); 

Y(Y<=0) = 0;
plot([omega- 4*maxOmega, omega, omega+4*maxOmega], [Y , Y, Y])
print('prob1b','-dpng');

%% Part b
figure;
omega = linspace(-10.*maxOmega, 10*maxOmega); 
rands = abs(rand(1, length(omega))); 
scale = 1 - (abs(omega)./maxOmega).^1; 
Y      = rands.*scale; Y(1:round(end/2)) = flip(Y(round(end/2)+1:end)); 

Y(Y<=0) = 0;
plot([omega- 20*maxOmega, omega, omega+20*maxOmega], [Y , Y, Y])
print('prob1c','-dpng');
%% Problem 2
figure; 
w  = linspace(-pi, pi); 
y1 = ones(1,length(w)); 
y2 = abs(cos(3.*w)); 
y3 = abs(1 .* sin(2.*w) ./ (w/2)); 
%y4 = abs(1 .* sin(2.*w) ./ sin(w/2));
hold on;
plot(w, y1); plot(w, y2); plot(w, y3)
legend('a', 'b', 'c', 'd'); 
print('prob2', '-dpng'); 
%% Problem 3

%% Problem 4
figure(6); clf;
x1 = ones(1, 7);
x2 = conv(x1, x1);
stem(x2); figure(7); 
N = 32;
X = fft(x2, N);
plot(abs(fftshift(X)))

plot(abs(X))

w = linspace(-pi, pi); 
y   = (1 .* sin(2.*w) ./ (w/2)); 
phi = atan2(imag(y), real(y));


