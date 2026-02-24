%  Projeto Análise de Eletroretinograma
%   última revisão: 27/08/2025
%
%   Lê CSV e Calcula Parâmetros no domínio do tempo:
%       + Amplitude e Latência das componentes N35, P50 e N95
%       + Amplitude e Latência "Pico-a-pico": N35-P50 e P50-N95
%       + Potência Média
%       + FFT do sinal bruto e filtrado
%

clear;
close all;

diretorio=pwd;
[filename,path]=uigetfile([lower(diretorio) '\*.csv'],'Entre com o sinal a ser processado');

T = readtable(filename);

RE1=T.RE_1;
LE1=T.LE_1;

% Detrend
RE1=detrend(RE1,1);
LE1=detrend(LE1,1);

fs=1700; % Hz
N = 2;
Fc_notch=[100 140]; % NOTCH
Fc=100; % Passa-baixas
Wc=Fc/(fs/2);
Wc_notch=Fc_notch/(fs/2);

% Filtros
[B,A] = butter(N,Wc,'low'); % Passa-baixas
[C,D] = butter(2,Wc_notch,'stop');
RE1_filtrado=filtfilt(B,A,RE1);
LE1_filtrado=filtfilt(B,A,LE1);

% FFT
X = fft(RE1);
Xfilt = fft(RE1_filtrado);
Y = fft(LE1);
Yfilt = fft(LE1_filtrado);

L = length(RE1);
freq = (0:(L/2)-1) * (fs/L);

t=(0:length(RE1)-1)*(1/fs)*1000;

% ---- OLHO DIREITO (OD) ----
[minimo,iminimo]=min(RE1(45:60));
[maximo,imaximo]=max(RE1(80:120));
[minimo2,iminimo2]=min(RE1(140:180));

ampN35_RE=minimo;
latN35_RE=t(iminimo+44);
ampP50_RE=maximo;
latP50_RE=t(imaximo+79);
ampN95_RE=minimo2;
latN95_RE=t(iminimo2+139);    
PKAmpN35P50_RE=ampP50_RE-ampN35_RE;
LatPKN35P50_RE=latP50_RE-latN35_RE;
PKAmpP50N95_RE=ampN95_RE-ampP50_RE;
LatPKP50N95_RE=latN95_RE-latP50_RE;
PotMedia_RE=sum(((RE1).^2))/length(RE1);

% ---- OLHO ESQUERDO (OE) ----
[minimo,iminimo]=min(LE1(45:60));
[maximo,imaximo]=max(LE1(80:120));
[minimo2,iminimo2]=min(LE1(140:180));

ampN35_LE=minimo;
latN35_LE=t(iminimo+44);
ampP50_LE=maximo;
latP50_LE=t(imaximo+79);
ampN95_LE=minimo2;
latN95_LE=t(iminimo2+139);
PKAmpN35P50_LE=ampP50_LE-ampN35_LE;
LatPKN35P50_LE=latP50_LE-latN35_LE;
PKAmpP50N95_LE=ampN95_LE-ampP50_LE;
LatPKP50N95_LE=latN95_LE-latP50_LE;
PotMedia_LE=sum(((LE1).^2))/length(LE1);

figure;

% OD tempo
subplot(2,2,1)
plot(t,RE1, 'b', 'LineWidth', 1), hold on 
plot(t,RE1_filtrado, 'r', 'LineWidth', 2)
plot(latN35_RE, ampN35_RE, 'ro', 'MarkerSize', 10, 'LineWidth', 2)
plot(latP50_RE, ampP50_RE, 'r*', 'MarkerSize', 10, 'LineWidth', 2)
plot(latN95_RE, ampN95_RE, 'rs', 'MarkerSize', 10, 'LineWidth', 2)
title([filename ' - OD (Tempo)'])
xlabel('Tempo (ms)', 'fontweight','bold', 'fontsize',12);
ylabel('Amplitude (\muV)', 'fontweight','bold', 'fontsize',12)
legend('PERG OD','PERG FILT','N35','P50','N95')
grid on, grid minor
hold off

% OD FFT
subplot(2,2,2)
plot(freq,abs(X(1:L/2)),'b'), hold on
plot(freq,abs(Xfilt(1:L/2)),'r')
title('FFT OD')
xlabel('Frequência (Hz)')
ylabel('|X(f)|')
legend('Bruto','Filtrado')
grid on, grid minor

% OE tempo
subplot(2,2,3)
plot(t,LE1, 'b', 'LineWidth', 1), hold on
plot(t,LE1_filtrado, 'r', 'LineWidth', 2)
plot(latN35_LE, ampN35_LE, 'bo', 'MarkerSize', 10, 'LineWidth', 2)
plot(latP50_LE, ampP50_LE, 'b*', 'MarkerSize', 10, 'LineWidth', 2)
plot(latN95_LE, ampN95_LE, 'bs', 'MarkerSize', 10, 'LineWidth', 2)
title('OE (Tempo)')
xlabel('Tempo (ms)', 'fontweight','bold', 'fontsize',12);
ylabel('Amplitude (\muV)', 'fontweight','bold', 'fontsize',12)
legend('PERG OE','PERG FILT','N35','P50','N95')
grid on, grid minor
hold off

% OE FFT
subplot(2,2,4)
plot(freq,abs(Y(1:L/2)),'b'), hold on
plot(freq,abs(Yfilt(1:L/2)),'r')
title('FFT OE')
xlabel('Frequência (Hz)')
ylabel('|X(f)|')
legend('Bruto','Filtrado')
grid on, grid minor

%Apresenta a resposta em frequencia do filtro
figure, freqz(C,D,length(RE1_filtrado));

figure, zplane(C,D)
axis([-1 1 -1 1])