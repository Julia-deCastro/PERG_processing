%  Projeto Análise de Eletroretinograma
%   última revisão: 29/10/2025
%
%   Lê CSV e Calcula Parâmetros no domínio do tempo: 
%       + Amplitude e Latência das componentes N35, P50 e N95
%       + Amplitude e Latência "Pico-a-pico": N35-P50 e P50-N95
%       + Potência Média
%       + Área sob a curva P50 e N95
%

clear all;
close all;

NArquivo = ['0008'; '0016'; '0018'; '0019'; '0025'; '0026'; '0032'; ...
    '0044'; '0045'; '0052'; '0070'; '0101'; '0106'; '0127'; '0132'; ...
    '0135'; '0143'; '0168'; '0174'; '0176'; '0177'; '0178'; '0190'; ...
    '0195'; '0214'; '0234'; '0240'; '0257'; '0282'; '0284'; '0288'; ...
    '0323'; '0331'];

S = size(NArquivo);
NVolunt = S(1);

ampN35_RE_dm_vector=[]; latN35_RE_dm_vector=[];
ampP50_RE_dm_vector=[]; latP50_RE_dm_vector=[];
ampN95_RE_dm_vector=[]; latN95_RE_dm_vector=[];
PKAmpN35P50_RE_dm_vector=[]; LatPKN35P50_RE_dm_vector=[];
PKAmpP50N95_RE_dm_vector=[]; LatPKP50N95_RE_dm_vector=[];
PotMedia_RE_dm_vector=[]; RatioN95P50_RE_dm_vector=[];
AreaP50_RE_dm_vector=[]; AreaN95_RE_dm_vector=[];

ampN35_LE_dm_vector=[]; latN35_LE_dm_vector=[];
ampP50_LE_dm_vector=[]; latP50_LE_dm_vector=[];
ampN95_LE_dm_vector=[]; latN95_LE_dm_vector=[];
PKAmpN35P50_LE_dm_vector=[]; LatPKN35P50_LE_dm_vector=[];
PKAmpP50N95_LE_dm_vector=[]; LatPKP50N95_LE_dm_vector=[];
PotMedia_LE_dm_vector=[]; RatioN95P50_LE_dm_vector=[];
AreaP50_LE_dm_vector=[]; AreaN95_LE_dm_vector=[];

for k = 1:NVolunt
    
    nome_arquivo = strcat(NArquivo(k, :), '.csv');
    T = readtable(nome_arquivo);
    
    RE1 = detrend(T.RE_1, 1);
    LE1 = detrend(T.LE_1, 1);
    
    fs = 1700;
    N = 2;
    Fc = 90; % passa-baixas
    Wc = Fc / (fs/2);
    [B,A] = butter(N, Wc, 'low');
    RE1_filtrado = filtfilt(B,A,RE1);
    LE1_filtrado = filtfilt(B,A,LE1);

    t = (0:length(RE1_filtrado)-1)*(1/fs)*1000;
    
    % ==== Olho Direito (RE) ====
    [minimo,iminimo]=min(RE1_filtrado(45:60));
    [maximo,imaximo]=max(RE1_filtrado(80:120));
    [minimo2,iminimo2]=min(RE1_filtrado(140:180));
    
    ampN35_RE = minimo;
    latN35_RE = t(iminimo+44);
    ampP50_RE = maximo;
    latP50_RE = t(imaximo+79);
    ampN95_RE = minimo2;
    latN95_RE = t(iminimo2+139);    
    PKAmpN35P50_RE = ampP50_RE - ampN35_RE;
    LatPKN35P50_RE = latP50_RE - latN35_RE;
    PKAmpP50N95_RE = ampN95_RE - ampP50_RE;
    LatPKP50N95_RE = latN95_RE - latP50_RE;
    PotMedia_RE = sum(RE1_filtrado.^2) / length(RE1_filtrado);

    % --- Cruzamentos por zero
    crossIdx_RE = find(RE1_filtrado(1:end-1).*RE1_filtrado(2:end) < 0);
    AreaP50_RE_dm = NaN; AreaN95_RE_dm = NaN;

    % === Área P50 (válida se positivo e dentro da janela fisiológica) ===
    idx_before_P50_RE = find(t(crossIdx_RE) < latP50_RE, 1, 'last');
    idx_after_P50_RE  = find(t(crossIdx_RE) > latP50_RE, 1, 'first');
    if ~isempty(idx_before_P50_RE) && ~isempty(idx_after_P50_RE)
        t_p50_RE = t(crossIdx_RE(idx_before_P50_RE):crossIdx_RE(idx_after_P50_RE));
        y_p50_RE = RE1_filtrado(crossIdx_RE(idx_before_P50_RE):crossIdx_RE(idx_after_P50_RE));
        if ampP50_RE > 0 && (t_p50_RE(end)-t_p50_RE(1)) < 60 && latP50_RE > 40 && latP50_RE < 80
            AreaP50_RE_dm = abs(trapz(t_p50_RE, y_p50_RE));
        end
    end

    % === Área N95 (válida se negativa e dentro da janela fisiológica) ===
    idx_before_N95_RE = find(t(crossIdx_RE) < latN95_RE, 1, 'last');
    idx_after_N95_RE  = find(t(crossIdx_RE) > latN95_RE, 1, 'first');
    if ~isempty(idx_before_N95_RE) && ~isempty(idx_after_N95_RE)
        t_n95_RE = t(crossIdx_RE(idx_before_N95_RE):crossIdx_RE(idx_after_N95_RE));
        y_n95_RE = RE1_filtrado(crossIdx_RE(idx_before_N95_RE):crossIdx_RE(idx_after_N95_RE));
        if ampN95_RE < 0 && (t_n95_RE(end)-t_n95_RE(1)) < 60 && latN95_RE > 80 && latN95_RE < 130
            AreaN95_RE_dm = abs(trapz(t_n95_RE, y_n95_RE));
        end
    end

    RatioN95P50_RE = abs(PKAmpP50N95_RE) / abs(PKAmpN35P50_RE);

    % --- Armazena ---
    ampN35_RE_dm_vector=[ampN35_RE_dm_vector ampN35_RE];
    latN35_RE_dm_vector=[latN35_RE_dm_vector latN35_RE];
    ampP50_RE_dm_vector=[ampP50_RE_dm_vector ampP50_RE];
    latP50_RE_dm_vector=[latP50_RE_dm_vector latP50_RE];
    ampN95_RE_dm_vector=[ampN95_RE_dm_vector ampN95_RE];
    latN95_RE_dm_vector=[latN95_RE_dm_vector latN95_RE];
    PKAmpN35P50_RE_dm_vector=[PKAmpN35P50_RE_dm_vector PKAmpN35P50_RE];
    LatPKN35P50_RE_dm_vector=[LatPKN35P50_RE_dm_vector LatPKN35P50_RE];
    PKAmpP50N95_RE_dm_vector=[PKAmpP50N95_RE_dm_vector PKAmpP50N95_RE];
    LatPKP50N95_RE_dm_vector=[LatPKP50N95_RE_dm_vector LatPKP50N95_RE];
    PotMedia_RE_dm_vector=[PotMedia_RE_dm_vector PotMedia_RE];
    RatioN95P50_RE_dm_vector=[RatioN95P50_RE_dm_vector RatioN95P50_RE];
    AreaP50_RE_dm_vector=[AreaP50_RE_dm_vector AreaP50_RE_dm];
    AreaN95_RE_dm_vector=[AreaN95_RE_dm_vector AreaN95_RE_dm];

    % --- Plot RE ---
    figure, subplot(2,1,1), plot(t,RE1,'b','LineWidth',1)
    hold on
    plot(t,RE1_filtrado,'LineWidth',2)
    title(nome_arquivo);
    plot(latN35_RE, ampN35_RE, 'ro', 'MarkerSize', 10, 'LineWidth', 2)
    plot(latP50_RE, ampP50_RE, 'r*', 'MarkerSize', 10, 'LineWidth', 2)
    plot(latN95_RE, ampN95_RE, 'rs', 'MarkerSize', 10, 'LineWidth', 2)
    legend('PERG OD', 'PERG FILT', 'N35 OD', 'P50 OD', 'N95 OD');
    if exist('t_p50_RE','var') && exist('y_p50_RE','var') && ~isnan(AreaP50_RE_dm)
        area(t_p50_RE, y_p50_RE, 'FaceColor', 'r', 'FaceAlpha', 0.25, 'EdgeColor', 'none');
    end
    if exist('t_n95_RE','var') && exist('y_n95_RE','var') && ~isnan(AreaN95_RE_dm)
        area(t_n95_RE, y_n95_RE, 'FaceColor', 'b', 'FaceAlpha', 0.25, 'EdgeColor', 'none');
    end
    hold off

    % ==== Olho Esquerdo (LE) ====
    [minimo,iminimo]=min(LE1_filtrado(45:60));
    [maximo,imaximo]=max(LE1_filtrado(80:120));
    [minimo2,iminimo2]=min(LE1_filtrado(140:180));
    
    ampN35_LE = minimo;
    latN35_LE = t(iminimo+44);
    ampP50_LE = maximo;
    latP50_LE = t(imaximo+79);
    ampN95_LE = minimo2;
    latN95_LE = t(iminimo2+139);
    PKAmpN35P50_LE = ampP50_LE - ampN35_LE;
    LatPKN35P50_LE = latP50_LE - latN35_LE;
    PKAmpP50N95_LE = ampN95_LE - ampP50_LE;
    LatPKP50N95_LE = latN95_LE - latP50_LE;
    PotMedia_LE = sum(LE1_filtrado.^2) / length(LE1_filtrado);

    % --- Cruzamentos LE ---
    crossIdx_LE = find(LE1_filtrado(1:end-1).*LE1_filtrado(2:end) < 0);
    AreaP50_LE = NaN; AreaN95_LE = NaN;

    % === Área P50 LE ===
    idx_before_P50_LE = find(t(crossIdx_LE) < latP50_LE, 1, 'last');
    idx_after_P50_LE  = find(t(crossIdx_LE) > latP50_LE, 1, 'first');
    if ~isempty(idx_before_P50_LE) && ~isempty(idx_after_P50_LE)
        t_p50_LE = t(crossIdx_LE(idx_before_P50_LE):crossIdx_LE(idx_after_P50_LE));
        y_p50_LE = LE1_filtrado(crossIdx_LE(idx_before_P50_LE):crossIdx_LE(idx_after_P50_LE));
        if ampP50_LE > 0 && (t_p50_LE(end)-t_p50_LE(1)) < 60 && latP50_LE > 40 && latP50_LE < 80
            AreaP50_LE = abs(trapz(t_p50_LE, y_p50_LE));
        end
    end

    % === Área N95 LE ===
    idx_before_N95_LE = find(t(crossIdx_LE) < latN95_LE, 1, 'last');
    idx_after_N95_LE  = find(t(crossIdx_LE) > latN95_LE, 1, 'first');
    if ~isempty(idx_before_N95_LE) && ~isempty(idx_after_N95_LE)
        t_n95_LE = t(crossIdx_LE(idx_before_N95_LE):crossIdx_LE(idx_after_N95_LE));
        y_n95_LE = LE1_filtrado(crossIdx_LE(idx_before_N95_LE):crossIdx_LE(idx_after_N95_LE));
        if ampN95_LE < 0 && (t_n95_LE(end)-t_n95_LE(1)) < 60 && latN95_LE > 80 && latN95_LE < 130
            AreaN95_LE = abs(trapz(t_n95_LE, y_n95_LE));
        end
    end

    RatioN95P50_LE = abs(PKAmpP50N95_LE) / abs(PKAmpN35P50_LE);

    % --- Armazena ---
    ampN35_LE_dm_vector=[ampN35_LE_dm_vector ampN35_LE];
    latN35_LE_dm_vector=[latN35_LE_dm_vector latN35_LE];
    ampP50_LE_dm_vector=[ampP50_LE_dm_vector ampP50_LE];
    latP50_LE_dm_vector=[latP50_LE_dm_vector latP50_LE];
    ampN95_LE_dm_vector=[ampN95_LE_dm_vector ampN95_LE];
    latN95_LE_dm_vector=[latN95_LE_dm_vector latN95_LE];
    PKAmpN35P50_LE_dm_vector=[PKAmpN35P50_LE_dm_vector PKAmpN35P50_LE];
    LatPKN35P50_LE_dm_vector=[LatPKN35P50_LE_dm_vector LatPKN35P50_LE];
    PKAmpP50N95_LE_dm_vector=[PKAmpP50N95_LE_dm_vector PKAmpP50N95_LE];
    LatPKP50N95_LE_dm_vector=[LatPKP50N95_LE_dm_vector LatPKP50N95_LE];
    PotMedia_LE_dm_vector=[PotMedia_LE_dm_vector PotMedia_LE];
    RatioN95P50_LE_dm_vector=[RatioN95P50_LE_dm_vector RatioN95P50_LE];
    AreaP50_LE_dm_vector=[AreaP50_LE_dm_vector AreaP50_LE];
    AreaN95_LE_dm_vector=[AreaN95_LE_dm_vector AreaN95_LE];

    % --- Plot LE ---
    subplot(2,1,2)
    plot(t,LE1,'b','LineWidth',1)
    hold on
    plot(t,LE1_filtrado,'r','LineWidth',2)
    plot(latN35_LE, ampN35_LE, 'bo', 'MarkerSize', 10, 'LineWidth', 2)
    plot(latP50_LE, ampP50_LE, 'b*', 'MarkerSize', 10, 'LineWidth', 2)
    plot(latN95_LE, ampN95_LE, 'bs', 'MarkerSize', 10, 'LineWidth', 2)
    legend('PERG OE', 'PERG FILT', 'N35 OE', 'P50 OE', 'N95 OE');
    if exist('t_p50_LE','var') && exist('y_p50_LE','var') && ~isnan(AreaP50_LE)
        area(t_p50_LE, y_p50_LE, 'FaceColor', 'r', 'FaceAlpha', 0.25, 'EdgeColor', 'none');
    end
    if exist('t_n95_LE','var') && exist('y_n95_LE','var') && ~isnan(AreaN95_LE)
        area(t_n95_LE, y_n95_LE, 'FaceColor', 'b', 'FaceAlpha', 0.25, 'EdgeColor', 'none');
    end
    xlabel('Tempo (ms)','fontweight','bold','fontsize',12);
    ylabel('Amplitude (\muV)','fontweight','bold','fontsize',12);
    grid on; grid minor;
    hold off;

end

% === Salva todos os vetores ===
save ampN35_RE_dm_vector.mat ampN35_RE_dm_vector;
save latN35_RE_dm_vector.mat latN35_RE_dm_vector;
save ampP50_RE_dm_vector.mat ampP50_RE_dm_vector;
save latP50_RE_dm_vector.mat latP50_RE_dm_vector;
save ampN95_RE_dm_vector.mat ampN95_RE_dm_vector;
save latN95_RE_dm_vector.mat latN95_RE_dm_vector;
save PKAmpN35P50_RE_dm_vector.mat PKAmpN35P50_RE_dm_vector;
save LatPKN35P50_RE_dm_vector.mat LatPKN35P50_RE_dm_vector;
save PKAmpP50N95_RE_dm_vector.mat PKAmpP50N95_RE_dm_vector;
save LatPKP50N95_RE_dm_vector.mat LatPKP50N95_RE_dm_vector;
save PotMedia_RE_dm_vector.mat PotMedia_RE_dm_vector;
save RatioN95P50_RE_dm_vector.mat RatioN95P50_RE_dm_vector;
save AreaP50_RE_dm_vector.mat AreaP50_RE_dm_vector;
save AreaN95_RE_dm_vector.mat AreaN95_RE_dm_vector;

save ampN35_LE_dm_vector.mat ampN35_LE_dm_vector;
save latN35_LE_dm_vector.mat latN35_LE_dm_vector;
save ampP50_LE_dm_vector.mat ampP50_LE_dm_vector;
save latP50_LE_dm_vector.mat latP50_LE_dm_vector;
save ampN95_LE_dm_vector.mat ampN95_LE_dm_vector;
save latN95_LE_dm_vector.mat latN95_LE_dm_vector;
save PKAmpN35P50_LE_dm_vector.mat PKAmpN35P50_LE_dm_vector;
save LatPKN35P50_LE_dm_vector.mat LatPKN35P50_LE_dm_vector;
save PKAmpP50N95_LE_dm_vector.mat PKAmpP50N95_LE_dm_vector;
save LatPKP50N95_LE_dm_vector.mat LatPKP50N95_LE_dm_vector;
save PotMedia_LE_dm_vector.mat PotMedia_LE_dm_vector;
save RatioN95P50_LE_dm_vector.mat RatioN95P50_LE_dm_vector;
save AreaP50_LE_dm_vector.mat AreaP50_LE_dm_vector;
save AreaN95_LE_dm_vector.mat AreaN95_LE_dm_vector;
