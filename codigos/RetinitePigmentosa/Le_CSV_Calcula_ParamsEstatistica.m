%  Projeto Análise de Eletroretinograma
%   última revisão: 30/10/2025
%
%   Lê CSV e Calcula Parâmetros Estatísticos dos sinais:
%       + Assimetria (Skewness)
%       + Curtose (Kurtosis)
%       + Entropia (Entropy)
%       + Variância (Variance)
%

clear all;
close all;

NArquivo = ['0004'; '0010'; '0011'; '0023'; '0037'; '0038'; '0050'; ...
    '0054'; '0061'; '0063'; '0067'; '0081'; '0083'; '0086'; '0089'; ...
    '0109'; '0110'; '0117'; '0120'; '0145'; '0146'; '0151'; '0152'; ...
    '0155'; '0164'; '0171'; '0181'; '0193'; '0209'; '0213'; '0216'; ...
    '0220'; '0222'; '0230'; '0243'; '0245'; '0247'; '0264'; '0279'; ...
    '0280'; '0286'; '0296'; '0304'; '0307'; '0311'; '0317'; '0335'];

S = size(NArquivo);
NVolunt = S(1);

% ==== Vetores OD ====
assimetria_RE_rp_vector = [];
curtose_RE_rp_vector = [];
entropia_RE_rp_vector = [];
variancia_RE_rp_vector = [];

% ==== Vetores OE ====
assimetria_LE_rp_vector = [];
curtose_LE_rp_vector = [];
entropia_LE_rp_vector = [];
variancia_LE_rp_vector = [];

for k = 1:NVolunt
    nome_arquivo = strcat(NArquivo(k, :), '.csv');
    T = readtable(nome_arquivo);

    % Sinais
    RE1 = detrend(T.RE_1, 1);
    LE1 = detrend(T.LE_1, 1);

    % Filtro passa-baixas
    fs = 1700;
    N = 2;
    Fc = 100;
    Wc = Fc / (fs/2);
    [B, A] = butter(N, Wc, 'low');
    RE1_filtrado = filtfilt(B, A, RE1);
    LE1_filtrado = filtfilt(B, A, LE1);

    % ====== OD (RE) ======
    % Assimetria
    skn_RE = skewness(RE1_filtrado);

    % Curtose
    kts_RE = kurtosis(RE1_filtrado);

    % Entropia
    h1 = histogram(RE1_filtrado, 'Normalization', 'Probability', 'Visible', 'off');
    p = h1.Values + eps;
    entropia_RE = -sum(p .* log2(p));

    % Variância
    variancia_RE = var(RE1_filtrado);

    % Armazena
    assimetria_RE_rp_vector = [assimetria_RE_rp_vector skn_RE];
    curtose_RE_rp_vector = [curtose_RE_rp_vector kts_RE];
    entropia_RE_rp_vector = [entropia_RE_rp_vector entropia_RE];
    variancia_RE_rp_vector = [variancia_RE_rp_vector variancia_RE];

    % ====== OE (LE) ======
    skn_LE = skewness(LE1_filtrado);
    kts_LE = kurtosis(LE1_filtrado);
    h2 = histogram(LE1_filtrado, 'Normalization', 'Probability', 'Visible', 'off');
    p2 = h2.Values + eps;
    entropia_LE = -sum(p2 .* log2(p2));
    variancia_LE = var(LE1_filtrado);

    % Armazena
    assimetria_LE_rp_vector = [assimetria_LE_rp_vector skn_LE];
    curtose_LE_rp_vector = [curtose_LE_rp_vector kts_LE];
    entropia_LE_rp_vector = [entropia_LE_rp_vector entropia_LE];
    variancia_LE_rp_vector = [variancia_LE_rp_vector variancia_LE];

    fprintf('Arquivo %s processado.\n', nome_arquivo);
end

% ==== Salva os resultados ====
save assimetria_RE_rp_vector.mat assimetria_RE_rp_vector;
save curtose_RE_rp_vector.mat curtose_RE_rp_vector;
save entropia_RE_rp_vector.mat entropia_RE_rp_vector;
save variancia_RE_rp_vector.mat variancia_RE_rp_vector;

save assimetria_LE_rp_vector.mat assimetria_LE_rp_vector;
save curtose_LE_rp_vector.mat curtose_LE_rp_vector;
save entropia_LE_rp_vector.mat entropia_LE_rp_vector;
save variancia_LE_rp_vector.mat variancia_LE_rp_vector;
