Samples_PerSymbol=1;
TSymbol = 1/ (13e6/48); % symbol period (in second) in GSM/EDGE 
Fs=(1/TSymbol)*Samples_PerSymbol;  % Sampling frequency of the oversampled rate 
No=40; % number of oscillators 
initial_phases=2*pi*rand(No,1); 
Ns=30000; % number of fading samples
Fc=900e6;      % Carrier Freq. in Hz (GSM and EDGE
vs_kmph=300;

% With Interleaving
%------------------
inter = randintrlv(code,st2); % Interleave.
inter_err = bitxor(inter,errors); % Include burst error.
decoded = decode(deinter,n,k,'hamming/binary'); % Decode.
disp('Number of errors and error rate, with interleaving:');
[number_with,rate_with] = biterr(msg,decoded) % Error statistics

%Normalize the noise and find SNR 
r = snr(Fc,vs_kmph);

%calculate bit error rate (BER) 
numerrs = biterr(Fc,vs_kmph);

% Calculate symbol error rate 
[number,ratio]= symerr(Fc,vs_kmph);

plot(r,numerrs)
