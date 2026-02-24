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

NArquivo = ['0001'; '0005'; '0007'; '0029'; '0031'; '0035'; '0039'; ...
    '0042'; '0047'; '0048'; '0051'; '0056'; '0058'; '0062'; '0064'; ...
    '0065'; '0071'; '0073'; '0074'; '0075'; '0076'; '0078'; '0080'; ...
    '0085'; '0087'; '0090'; '0091'; '0092'; '0096'; '0097'; '0098'; ...
    '0108'; '0111'; '0115'; '0116'; '0118'; '0122'; '0124'; '0129'; ...
    '0130'; '0134'; '0137'; '0141'; '0142'; '0144'; '0157'; '0158'; ...
    '0162'; '0165'; '0170'; '0172'; '0175'; '0179'; '0180'; '0184'; ...
    '0187'; '0194'; '0196'; '0197'; '0198'; '0199'; '0200'; '0202'; ...
    '0208'; '0210'; '0211'; '0212'; '0215'; '0217'; '0218'; '0223'; ...
    '0225'; '0226'; '0233'; '0238'; '0241'; '0251'; '0258'; '0261'; ...
    '0262'; '0263'; '0265'; '0266'; '0268'; '0269'; '0272'; '0274'; ...
    '0277'; '0281'; '0283'; '0291'; '0293'; '0300'; '0301'; '0303'; ...
    '0305'; '0309'; '0310'; '0314'; '0315'; '0326'; '0327'; '0328'; ...
    '0330'; '0334'; '0336'];

S = size(NArquivo);
NVolunt = S(1);

% ==== Vetores OD ====
assimetria_RE_vector = [];
curtose_RE_vector = [];
entropia_RE_vector = [];
variancia_RE_vector = [];

% ==== Vetores OE ====
assimetria_LE_vector = [];
curtose_LE_vector = [];
entropia_LE_vector = [];
variancia_LE_vector = [];

for k = 1:NVolunt
    nome_arquivo = strcat(NArquivo(k, :), '.csv');
    T = readtable(nome_arquivo);

    % Sinais
    RE1 = detrend(T.RE_1, 1);
    LE1 = detrend(T.LE_1, 1);

    % Filtro passa-baixas
    fs = 1700;
    N = 2;
    Fc = 90;
    Wc = Fc / (fs/2);
    [B, A] = butter(N, Wc, 'low');
    RE1_filtrado = filtfilt(B, A, RE1);
    LE1_filtrado = filtfilt(B, A, LE1);

    % ====== OD (RE) ======
    % Assimetria
    skn_RE = skewness(RE1_filtrado);

    % Curtose
    kts_RE = kurtosis(RE1_filtrado);

    % Probabilidades
    h1 = histogram(RE1_filtrado, 'Normalization', 'Probability');
    p = h1.Values + eps;
    bin_Center=h1.BinEdges(1:end-1)+abs(h1.BinEdges(1)-h1.BinEdges(2))/2;
    I=-log2(p);

    % Entropia
    entropia_RE = -sum(p .* log2(p));

    % Variância
    variancia_RE = var(RE1_filtrado);

    % Armazena
    assimetria_RE_vector = [assimetria_RE_vector skn_RE];
    curtose_RE_vector = [curtose_RE_vector kts_RE];
    entropia_RE_vector = [entropia_RE_vector entropia_RE];
    variancia_RE_vector = [variancia_RE_vector variancia_RE];

    % ====== OE (LE) ======
    skn_LE = skewness(LE1_filtrado);
    kts_LE = kurtosis(LE1_filtrado);
    h2 = histogram(LE1_filtrado, 'Normalization', 'Probability');
    p2 = h2.Values + eps;
    bin_Center2=h2.BinEdges(1:end-1)+abs(h2.BinEdges(1)-h2.BinEdges(2))/2;
    I2=-log2(p2);
    entropia_LE = -sum(p2 .* log2(p2));
    variancia_LE = var(LE1_filtrado);

    % Armazena
    assimetria_LE_vector = [assimetria_LE_vector skn_LE];
    curtose_LE_vector = [curtose_LE_vector kts_LE];
    entropia_LE_vector = [entropia_LE_vector entropia_LE];
    variancia_LE_vector = [variancia_LE_vector variancia_LE];

end

save assimetria_RE_vector.mat assimetria_RE_vector;
save curtose_RE_vector.mat curtose_RE_vector;
save entropia_RE_vector.mat entropia_RE_vector;
save variancia_RE_vector.mat variancia_RE_vector;

save assimetria_LE_vector.mat assimetria_LE_vector;
save curtose_LE_vector.mat curtose_LE_vector;
save entropia_LE_vector.mat entropia_LE_vector;
save variancia_LE_vector.mat variancia_LE_vector;

