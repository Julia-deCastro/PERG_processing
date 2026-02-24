clear;
close all;

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

load("acuidade_le_logMar.mat");
load("acuidade_re_logMar.mat");
load("acuidade_le_rp_logMar.mat");
load("acuidade_re_rp_logMar.mat");

load("AreaP50_RE_vector.mat");
load("AreaN95_RE_vector.mat");
load("AreaP50_LE_vector.mat");
load("AreaN95_LE_vector.mat");

load("AreaP50_RE_rp_vector.mat");
load("AreaN95_RE_rp_vector.mat");
load("AreaP50_LE_rp_vector.mat");
load("AreaN95_LE_rp_vector.mat");


%cria vetor de etiquetas
categoria=[zeros(1,length(ampN35_RE_vector)) ...
    ones(1,length(ampN35_RE_rp_vector))]';


% ampN35_RE_vector=normalize(ampN35_RE_vector); 
% ampN35_RE_rp_vector=normalize(ampN35_RE_rp_vector);
% 
% latN35_RE_vector=normalize(latN35_RE_vector);
% latN35_RE_rp_vector=normalize(latN35_RE_rp_vector);
% 
% ampP50_RE_vector=normalize(ampP50_RE_vector);
% ampP50_RE_rp_vector=normalize(ampP50_RE_rp_vector);
% 
% latP50_RE_vector=normalize(latP50_RE_vector);
% latP50_RE_rp_vector=normalize(latP50_RE_rp_vector);
% 
% ampN95_RE_vector=normalize(ampN95_RE_vector); 
% ampN95_RE_rp_vector=normalize(ampN95_RE_rp_vector);
% 
% latN95_RE_vector=normalize(latN95_RE_vector); 
% latN95_RE_rp_vector=normalize(latN95_RE_rp_vector);
% 
% PKAmpN35P50_RE_vector=normalize(PKAmpN35P50_RE_vector);
% PKAmpN35P50_RE_rp_vector=normalize(PKAmpN35P50_RE_rp_vector);
% 
% LatPKN35P50_RE_vector=normalize(LatPKN35P50_RE_vector);
% LatPKN35P50_RE_rp_vector=normalize(LatPKN35P50_RE_rp_vector);
% 
% PKAmpP50N95_RE_vector=normalize(PKAmpP50N95_RE_vector); 
% PKAmpP50N95_RE_rp_vector=normalize(PKAmpP50N95_RE_rp_vector);
% 
% LatPKP50N95_RE_vector=normalize(LatPKP50N95_RE_vector);
% LatPKP50N95_RE_rp_vector=normalize(LatPKP50N95_RE_rp_vector);
% 
% PotMedia_RE_vector=normalize(PotMedia_RE_vector);
% PotMedia_RE_rp_vector=normalize(PotMedia_RE_rp_vector);


% Amplitude_N35=abs([ampN35_RE_vector ampN35_RE_rp_vector]');
% 
% Latencia_N35=[latN35_RE_vector latN35_RE_rp_vector]';
% 
% Amplitude_P50=abs([ampP50_RE_vector ampP50_RE_rp_vector]');
% 
% Latencia_P50=[latP50_RE_vector latP50_RE_rp_vector]';
% 
% Amplitude_N95=abs([ampN95_RE_vector ampN95_RE_rp_vector]');
% 
% Latencia_N95=[latN95_RE_vector latN95_RE_rp_vector]';
% 
% Amplitude_N35_P50=abs([PKAmpN35P50_RE_vector PKAmpN35P50_RE_rp_vector]');
% 
% Latencia_N35_P50=[LatPKN35P50_RE_vector LatPKN35P50_RE_rp_vector]';
% 
% Amplitude_P50_N95=abs([PKAmpP50N95_RE_vector PKAmpP50N95_RE_rp_vector]');
% 
% Latencia_P50_N95=[LatPKP50N95_RE_vector LatPKP50N95_RE_rp_vector]';
% 
% PotenciaMedia=[PotMedia_RE_vector PotMedia_RE_rp_vector]';



Amplitude_N35=[ampN35_RE_vector ampN35_RE_rp_vector]';

Latencia_N35=[latN35_RE_vector latN35_RE_rp_vector]';

Amplitude_P50=[ampP50_RE_vector ampP50_RE_rp_vector]';

Latencia_P50=[latP50_RE_vector latP50_RE_rp_vector]';

Amplitude_N95=[ampN95_RE_vector ampN95_RE_rp_vector]';

Latencia_N95=[latN95_RE_vector latN95_RE_rp_vector]';

Amplitude_N35_P50=[PKAmpN35P50_RE_vector PKAmpN35P50_RE_rp_vector]';

Latencia_N35_P50=[LatPKN35P50_RE_vector LatPKN35P50_RE_rp_vector]';

Amplitude_P50_N95=[PKAmpP50N95_RE_vector PKAmpP50N95_RE_rp_vector]';

Latencia_P50_N95=[LatPKP50N95_RE_vector LatPKP50N95_RE_rp_vector]';

PotenciaMedia=[PotMedia_RE_vector PotMedia_RE_rp_vector]';

RatioN95P50=[RatioN95P50_RE_vector RatioN95P50_RE_rp_vector]';

Acuidade=[acuidade_re_logMar; acuidade_re_rp_logMar];

AreaP50=[AreaP50_RE_vector AreaP50_RE_rp_vector]';

AreaN95=[AreaN95_RE_vector AreaN95_RE_rp_vector]';

% pacientes=table(Amplitude_N35, Latencia_N35, Amplitude_P50, ...
%     Latencia_P50, Amplitude_N95, Latencia_N95, Amplitude_N35_P50, ...
%     Latencia_N35_P50, Amplitude_P50_N95, Latencia_P50_N95, ...
%     PotenciaMedia, categoria);

% Absolutos
 % pacientes=table(Amplitude_N35, Latencia_N35, Amplitude_P50, ...
 %     Latencia_P50, Amplitude_N95, Latencia_N95, ...
 %     PotenciaMedia, RatioN95P50, Acuidade, categoria);

 % Calculados
pacientes=table(Amplitude_N35_P50, Latencia_N35_P50, Amplitude_P50_N95, ...
    Latencia_P50_N95, RatioN95P50, AreaP50, AreaN95, ...   
    PotenciaMedia, Acuidade, categoria);


%Particionando os dados para treino e teste
cv=cvpartition(size(pacientes, 1), 'holdout', 0.2); 
dataTrain=pacientes(training(cv),:); % 80% dos dados para teste
dataTest=pacientes(test(cv),:) % 20% dos dados para teste

model=fitglm(dataTrain, 'Distribution', 'binomial')
%mdl=removeTerms(model,'Amplitude_N35', 'Latencia_N35','Amplitude_P50', ...
%    'Latencia_P50', 'Amplitude_N95', 'LatenciaN95', 'Latencia_N35_P50', ...
%    'Latencia_P50_N95')

predicao_paciente_rp=round(predict(model, dataTest));

paciente_rp=dataTest.categoria;

C=confusionmat(paciente_rp, predicao_paciente_rp)

figure, 
label_categorias={'0', '1'}
confusionchart(C, label_categorias)
xlabel('Predição Paciente RP')
ylabel('Paciente RP')

TP=C(2,2); %True Postives
TN=C(1,1); %True Negatives
FP=C(1,2); %False Positives
FN=C(2,1); %False Negatives

accuracy=sum(diag(C))/sum(C, 'all')

Sensibilidade=TP/(TP+FN) 

Especificidade=TN/(TN+FP)

PPV=TP/(TP+FP) %Positive Preditive Value

F1Score=(2*TP)/(2*TP+FP+FN)

