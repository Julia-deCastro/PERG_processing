clear all;
close all;

diretorio=pwd;
[filename,path]=uigetfile([lower(diretorio) '\*.csv'],'Entre com o sinal a ser processado');

T = readtable(filename);

RE1=T.RE_1;
LE1=T.LE_1;


fs=1700;

t=[0:length(RE1)-1]*(1/fs)*1000;





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