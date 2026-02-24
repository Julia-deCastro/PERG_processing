clear;
close all;

% --- Olho Direito (RE) ---
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

load("assimetria_RE_vector.mat");
load("curtose_RE_vector.mat");
load("entropia_RE_vector.mat");
load("variancia_RE_vector.mat");

load("AreaP50_RE_vector.mat");
load("AreaN95_RE_vector.mat");


% --- Olho Direito com DM (RE_dm) ---
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

load("assimetria_RE_dm_vector.mat");
load("curtose_RE_dm_vector.mat");
load("entropia_RE_dm_vector.mat");
load("variancia_RE_dm_vector.mat");

load("AreaP50_RE_dm_vector.mat");
load("AreaN95_RE_dm_vector.mat");


% --- Olho Esquerdo (LE) ---
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

load("assimetria_LE_vector.mat");
load("curtose_LE_vector.mat");
load("entropia_LE_vector.mat");
load("variancia_LE_vector.mat");

load("AreaP50_LE_vector.mat");
load("AreaN95_LE_vector.mat");


% --- Olho Esquerdo com DM (LE_dm) ---
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

load("assimetria_LE_dm_vector.mat");
load("curtose_LE_dm_vector.mat");
load("entropia_LE_dm_vector.mat");
load("variancia_LE_dm_vector.mat");

load("AreaP50_LE_dm_vector.mat");
load("AreaN95_LE_dm_vector.mat");


% --- Acuidade ---
load("acuidade_le_logMar.mat");
load("acuidade_re_logMar.mat");
load("acuidade_le_dm_logMar.mat");
load("acuidade_re_dm_logMar.mat");

% cria vetor de etiquetas
categoria=[zeros(1,2*length(ampN35_RE_vector)) ...
    ones(1,2*length(ampN35_RE_dm_vector))]';


Amplitude_N35=[ampN35_RE_vector ampN35_LE_vector ...
    ampN35_RE_dm_vector ampN35_LE_dm_vector]';

Latencia_N35=[latN35_RE_vector latN35_LE_vector ...
    latN35_RE_dm_vector latN35_LE_dm_vector]';

Amplitude_P50=[ampP50_RE_vector ampP50_LE_vector ...
    ampP50_RE_dm_vector ampP50_LE_dm_vector]';

Latencia_P50=[latP50_RE_vector latP50_LE_vector ...
    latP50_RE_dm_vector latP50_LE_dm_vector]';

Amplitude_N95=[ampN95_RE_vector ampN95_LE_vector ...
    ampN95_RE_dm_vector ampN95_LE_dm_vector]';

Latencia_N95=[latN95_RE_vector latN95_LE_vector ...
    latN95_RE_dm_vector latN95_LE_dm_vector]';

Amplitude_N35_P50=[PKAmpN35P50_RE_vector PKAmpN35P50_LE_vector ...
    PKAmpN35P50_RE_dm_vector PKAmpN35P50_LE_dm_vector]';

Latencia_N35_P50=[LatPKN35P50_RE_vector LatPKN35P50_LE_vector ...
    LatPKN35P50_RE_dm_vector LatPKN35P50_LE_dm_vector]';

Amplitude_P50_N95=[PKAmpP50N95_RE_vector PKAmpP50N95_LE_vector ...
    PKAmpP50N95_RE_dm_vector PKAmpP50N95_LE_dm_vector]';

Latencia_P50_N95=[LatPKP50N95_RE_vector LatPKP50N95_LE_vector ...
    LatPKP50N95_RE_dm_vector LatPKP50N95_LE_dm_vector]';

PotenciaMedia=[PotMedia_RE_vector PotMedia_LE_vector ...
    PotMedia_RE_dm_vector PotMedia_LE_dm_vector]';

RatioN95P50=[RatioN95P50_RE_vector RatioN95P50_LE_vector...
    RatioN95P50_RE_dm_vector RatioN95P50_LE_dm_vector]';

Acuidade=[acuidade_re_logMar; acuidade_le_logMar;...
    acuidade_re_dm_logMar; acuidade_le_dm_logMar];

AreaP50=[AreaP50_RE_vector AreaP50_LE_vector ...
    AreaP50_RE_dm_vector AreaP50_LE_dm_vector]';

AreaN95=[AreaN95_RE_vector AreaN95_LE_vector ...
    AreaN95_RE_dm_vector AreaN95_LE_dm_vector]';

assimetria = [assimetria_RE_vector assimetria_LE_vector ...
    assimetria_RE_dm_vector assimetria_LE_dm_vector]';

curtose = [curtose_RE_vector curtose_LE_vector ...
    curtose_RE_dm_vector curtose_LE_dm_vector]';

entropia = [entropia_RE_vector entropia_LE_vector ...
    entropia_RE_dm_vector entropia_LE_dm_vector]';

variancia = [variancia_RE_vector variancia_LE_vector ...
    variancia_RE_dm_vector variancia_LE_dm_vector]';

% Criação da tabela

% Todos extraídos
% pacientes=table(Amplitude_N35, Latencia_N35, Amplitude_P50, ...
%     Latencia_P50, Amplitude_N95, Latencia_N95, Amplitude_N35_P50, ...
%     Latencia_N35_P50, Amplitude_P50_N95, Latencia_P50_N95, ...
%     PotenciaMedia, categoria);

% Absolutos
% pacientes=table(Amplitude_N35, Latencia_N35, Amplitude_P50, ...
%     Latencia_P50, Amplitude_N95, Latencia_N95, RatioN95P50, ...   
%     PotenciaMedia, Acuidade, categoria);

% Calculados
% pacientes=table(Amplitude_N35_P50, Latencia_N35_P50, Amplitude_P50_N95, ...
%     Latencia_P50_N95, RatioN95P50, categoria);

% Estatisticos
% pacientes=table(assimetria, curtose, entropia, variancia, categoria);

% Calculados + Estatísticos
pacientes=table(Amplitude_N35_P50, Latencia_N35_P50, Amplitude_P50_N95, ...
    Latencia_P50_N95, RatioN95P50, assimetria, curtose, entropia, variancia, ...   
    categoria);

Acuracia_Vector=[];
Sensibilidade_Vector=[];
Especificidade_Vector=[];

% Loop de treinamento e teste
for i=1:100

    % Particionando os dados para treino e teste
    cv=cvpartition(size(pacientes, 1), 'holdout', 0.2);
    dataTrain=pacientes(training(cv),:); % 80% dos dados para teste
    dataTest=pacientes(test(cv),:) % 20% dos dados para teste

    model=fitglm(dataTrain, 'Distribution', 'binomial')
    %mdl=removeTerms(model,'Amplitude_N35', 'Latencia_N35','Amplitude_P50', ...
    %    'Latencia_P50', 'Amplitude_N95', 'LatenciaN95', 'Latencia_N35_P50', ...
    %    'Latencia_P50_N95')

    

    predicao_paciente_dm=round(predict(model, dataTest));

    paciente_dm=dataTest.categoria;

    C=confusionmat(paciente_dm, predicao_paciente_dm);

    % figure,
    % label_categorias={'0', '1'}
    % confusionchart(C, label_categorias)
    % xlabel('Predição Paciente dm')
    % ylabel('Paciente dm')

    TP=C(2,2); %True Postives
    TN=C(1,1); %True Negatives
    FP=C(1,2); %False Positives
    FN=C(2,1); %False Negatives

    accuracy=sum(diag(C))/sum(C, 'all');

    Sensibilidade=TP/(TP+FN);

    Especificidade=TN/(TN+FP);

    PPV=TP/(TP+FP); %Positive Preditive Value

    F1Score=(2*TP)/(2*TP+FP+FN);

    Acuracia_Vector=[ Acuracia_Vector accuracy];
    Sensibilidade_Vector=[Sensibilidade_Vector Sensibilidade];
    Especificidade_Vector=[ Especificidade_Vector Especificidade];

end

Acuracia_media=mean(Acuracia_Vector);
Sensibilidade_media=mean(Sensibilidade_Vector);
Especificidade_media=mean(Especificidade_Vector);
fprintf("Acurácia Média: %f\n", Acuracia_media);
fprintf("Sensibilidade Média: %f\n", Sensibilidade_media);
fprintf("Especificidade Média: %f\n", Especificidade_media);
