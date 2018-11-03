T = 0.002;            % Sampling frequency                    
Fs = 1/T;             % Sampling period       
L = 998;             % Length of signal
% load the signal name in the place of original_noised.
Y = fft(original_noised);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
f = f(2:end,:)
% 
% P1 = P1(2:end,:);
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
