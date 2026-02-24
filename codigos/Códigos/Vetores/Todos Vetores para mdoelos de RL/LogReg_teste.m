clear;
close all;
clc;

% --- Normais ---
load("ampN35_RE_vector.mat");
load("latN35_RE_vector.mat");
load("ampP50_RE_vector.mat");
load("latP50_RE_vector.mat");
load("ampN95_RE_vector.mat");
load("latN95_RE_vector.mat");
load("PKAmpN35P50_RE_vector.mat");
load("LatPKN35P50_RE_vector.mat");
load("PKAmpP50N95_RE_vector.mat");
load("LatPKP50N95_RE_vector.mat");
load("PotMedia_RE_vector.mat");
load("RatioN95P50_RE_vector.mat");

load("ampN35_LE_vector.mat");
load("latN35_LE_vector.mat");
load("ampP50_LE_vector.mat");
load("latP50_LE_vector.mat");
load("ampN95_LE_vector.mat");
load("latN95_LE_vector.mat");
load("PKAmpN35P50_LE_vector.mat");
load("LatPKN35P50_LE_vector.mat");
load("PKAmpP50N95_LE_vector.mat");
load("LatPKP50N95_LE_vector.mat");
load("PotMedia_LE_vector.mat");
load("RatioN95P50_LE_vector.mat");

load("acuidade_le_logMar.mat");
load("acuidade_re_logMar.mat");

% --- Retinite Pigmentosa (RP) ---
load("ampN35_RE_rp_vector.mat");
load("latN35_RE_rp_vector.mat");
load("ampP50_RE_rp_vector.mat");
load("latP50_RE_rp_vector.mat");
load("ampN95_RE_rp_vector.mat");
load("latN95_RE_rp_vector.mat");
load("PKAmpN35P50_RE_rp_vector.mat");
load("LatPKN35P50_RE_rp_vector.mat");
load("PKAmpP50N95_RE_rp_vector.mat");
load("LatPKP50N95_RE_rp_vector.mat");
load("PotMedia_RE_rp_vector.mat");
load("RatioN95P50_RE_rp_vector.mat");

load("ampN35_LE_rp_vector.mat");
load("latN35_LE_rp_vector.mat");
load("ampP50_LE_rp_vector.mat");
load("latP50_LE_rp_vector.mat");
load("ampN95_LE_rp_vector.mat");
load("latN95_LE_rp_vector.mat");
load("PKAmpN35P50_LE_rp_vector.mat");
load("LatPKN35P50_LE_rp_vector.mat");
load("PKAmpP50N95_LE_rp_vector.mat");
load("LatPKP50N95_LE_rp_vector.mat");
load("PotMedia_LE_rp_vector.mat");
load("RatioN95P50_LE_rp_vector.mat");

load("acuidade_le_rp_logMar.mat");
load("acuidade_re_rp_logMar.mat");

% --- Distrofia Macular (DM) ---
load("ampN35_RE_dm_vector.mat");
load("latN35_RE_dm_vector.mat");
load("ampP50_RE_dm_vector.mat");
load("latP50_RE_dm_vector.mat");
load("ampN95_RE_dm_vector.mat");
load("latN95_RE_dm_vector.mat");
load("PKAmpN35P50_RE_dm_vector.mat");
load("LatPKN35P50_RE_dm_vector.mat");
load("PKAmpP50N95_RE_dm_vector.mat");
load("LatPKP50N95_RE_dm_vector.mat");
load("PotMedia_RE_dm_vector.mat");
load("RatioN95P50_RE_dm_vector.mat");

load("ampN35_LE_dm_vector.mat");
load("latN35_LE_dm_vector.mat");
load("ampP50_LE_dm_vector.mat");
load("latP50_LE_dm_vector.mat");
load("ampN95_LE_dm_vector.mat");
load("latN95_LE_dm_vector.mat");
load("PKAmpN35P50_LE_dm_vector.mat");
load("LatPKN35P50_LE_dm_vector.mat");
load("PKAmpP50N95_LE_dm_vector.mat");
load("LatPKP50N95_LE_dm_vector.mat");
load("PotMedia_LE_dm_vector.mat");
load("RatioN95P50_LE_dm_vector.mat");

load("acuidade_le_dm_logMar.mat");
load("acuidade_re_dm_logMar.mat");


Amplitude_N35_P50 = [PKAmpN35P50_RE_vector PKAmpN35P50_LE_vector ...
    PKAmpN35P50_RE_rp_vector PKAmpN35P50_LE_rp_vector ...
    PKAmpN35P50_RE_dm_vector PKAmpN35P50_LE_dm_vector]';

Latencia_N35_P50 = [LatPKN35P50_RE_vector LatPKN35P50_LE_vector ...
    LatPKN35P50_RE_rp_vector LatPKN35P50_LE_rp_vector ...
    LatPKN35P50_RE_dm_vector LatPKN35P50_LE_dm_vector]';

Amplitude_P50_N95 = [PKAmpP50N95_RE_vector PKAmpP50N95_LE_vector ...
    PKAmpP50N95_RE_rp_vector PKAmpP50N95_LE_rp_vector ...
    PKAmpP50N95_RE_dm_vector PKAmpP50N95_LE_dm_vector]';

Latencia_P50_N95 = [LatPKP50N95_RE_vector LatPKP50N95_LE_vector ...
    LatPKP50N95_RE_rp_vector LatPKP50N95_LE_rp_vector ...
    LatPKP50N95_RE_dm_vector LatPKP50N95_LE_dm_vector]';

RatioN95P50 = [RatioN95P50_RE_vector RatioN95P50_LE_vector ...
    RatioN95P50_RE_rp_vector RatioN95P50_LE_rp_vector ...
    RatioN95P50_RE_dm_vector RatioN95P50_LE_dm_vector]';

PotenciaMedia = [PotMedia_RE_vector PotMedia_LE_vector ...
    PotMedia_RE_rp_vector PotMedia_LE_rp_vector ...
    PotMedia_RE_dm_vector PotMedia_LE_dm_vector]';

Acuidade = [acuidade_re_logMar; acuidade_le_logMar; ...
    acuidade_re_rp_logMar; acuidade_le_rp_logMar; ...
    acuidade_re_dm_logMar; acuidade_le_dm_logMar];


categoria = [zeros(1, 2*length(ampN35_RE_vector)), ... % Normal
             ones(1, 2*length(ampN35_RE_rp_vector)), ... % RP
             2*ones(1, 2*length(ampN35_RE_dm_vector))]'; % DM


pacientes = table(Amplitude_N35_P50, Latencia_N35_P50, ...
    Amplitude_P50_N95, Latencia_P50_N95, RatioN95P50, ...
    PotenciaMedia, Acuidade, categoria);

% Normaliza as variáveis numéricas
X = normalize(table2array(pacientes(:,1:7)));
Y = pacientes.categoria;

cv = cvpartition(length(Y), 'Holdout', 0.2);
Xtrain = X(training(cv), :);
Ytrain = Y(training(cv));
Xtest = X(test(cv), :);
Ytest = Y(test(cv));

% Modelo multiclasse com regressão logística
modelo = fitcecoc(Xtrain, Ytrain, ...
    'Learners', templateLinear('Learner', 'logistic'), ...
    'Coding', 'onevsall', ...
    'Prior', 'uniform', ...
    'ClassNames', [0 1 2]);

% Predição
Ypred = predict(modelo, Xtest);

% Matriz de confusão
C = confusionmat(Ytest, Ypred);
figure;
confusionchart(C, {'Normal','RP','DM'});
title('Matriz de Confusão - Classificação Multiclasse');

% Acurácia global
accuracy = sum(diag(C)) / sum(C, 'all');
fprintf('Acurácia geral: %.2f%%\n', accuracy*100);

% Métricas por classe
precision = diag(C) ./ sum(C,1)';  % Precisão
recall = diag(C) ./ sum(C,2);      % Sensibilidade (Recall)
f1 = 2 * (precision .* recall) ./ (precision + recall);

fprintf('\nMétricas por classe:\n');
fprintf('Classe | Precisão  | Sensibilidade | F1-Score\n');
for i = 1:3
    fprintf('%6d | %9.2f | %13.2f | %9.2f\n', i-1, precision(i), recall(i), f1(i));
end

