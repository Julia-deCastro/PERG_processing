clear all;
close all;

diretorio=pwd;
[filename,path]=uigetfile([lower(diretorio) '\*.csv'],'Entre com o sinal a ser processado');

T = readtable(filename);

RE1=detrend(T.RE_1,1);
LE1=detrend(T.LE_1,1);


fs=1700;

t=(0:length(RE1)-1)*(1/fs)*1000;





figure, plot(t,RE1, 'r', 'LineWidth', 2)
hold on 
plot(t,LE1, 'b', 'LineWidth', 2)
ticks=0:20:150;
xticks(ticks)
xlabel('Tempo (ms)', 'fontweight','bold', 'fontsize',12);
ylabel('Amplitude (\muV)', 'fontweight','bold', 'fontsize',12)
legend('PERG OD', 'PERG OE')
grid on
grid minor



x=LE1;

X=abs(fft(x))/length(x);
freq=linspace(0,fs/2,length(t)/2);

%Parametros do filtro

Fc=[100 140]; %NOTCH
%Fc=[12 100] %Passa-faixas
%Fc=100 %Passa-baixas
Wc=Fc/(fs/2);

N=5;       % ordem

%Calculo dos coeficientes

[B,A] = butter(N,Wc,'stop'); % NOTCH

%[B,A] = butter(N,Wc,'bandpass'); % Passa-faixas

%[B,A] = butter(N,Wc,'low'); %Passa-baixas

xfilt=filtfilt(B,A,x);
Xfilt=abs(fft(xfilt))/length(xfilt);

figure, 
subplot(2,1,1)
plot(t,x,'b',t,xfilt,'r');
subplot(2,1,2)
plot(freq,X(1:length(t)/2),'b',freq,Xfilt(1:length(t)/2),'r');
%axis([0 100 0 12])


%Apresenta a resposta em frequencia do filtro
figure, freqz(B,A,length(x));

figure, zplane(B,A)
axis([-1 1 -1 1])
