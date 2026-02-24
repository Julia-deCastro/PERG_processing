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


N=length(ampN35_RE_rp_vector);

ampN35_RE_vector(1:N);
latN35_RE_vector(1:N);
ampP50_RE_vector(1:N);
latP50_RE_vector(1:N);
ampN95_RE_vector(1:N);
latN95_RE_vector(1:N);
PKAmpN35P50_RE_vector(1:N);
LatPKN35P50_RE_vector(1:N);
PKAmpP50N95_RE_vector(1:N);
LatPKP50N95_RE_vector(1:N);
PotMedia_RE_vector(1:N);



ampN35_LE_vector(1:N);
latN35_LE_vector(1:N);
ampP50_LE_vector(1:N);
latP50_LE_vector(1:N);
ampN95_LE_vector(1:N);
latN95_LE_vector(1:N);
PKAmpN35P50_LE_vector(1:N);
LatPKN35P50_LE_vector(1:N);
PKAmpP50N95_LE_vector(1:N);
LatPKP50N95_LE_vector(1:N);
PotMedia_LE_vector(1:N);


%cria vetor de etiquetas
categoria=[zeros(1,2*length(ampN35_RE_vector)) ...
    ones(1,2*length(ampN35_RE_rp_vector))]';


Amplitude_N35=[ampN35_RE_vector ampN35_LE_vector ...
    ampN35_RE_rp_vector ampN35_LE_rp_vector]';

Latencia_N35=[latN35_RE_vector latN35_LE_vector ...
    latN35_RE_rp_vector latN35_LE_rp_vector]';

Amplitude_P50=[ampP50_RE_vector ampP50_LE_vector ...
    ampP50_RE_rp_vector ampP50_LE_rp_vector]';

Latencia_P50=[latP50_RE_vector latP50_LE_vector ...
    latP50_RE_rp_vector latP50_LE_rp_vector]';

Amplitude_N95=[ampN95_RE_vector ampN95_LE_vector ...
    ampN95_RE_rp_vector ampN95_LE_rp_vector]';

Latencia_N95=[latN95_RE_vector latN95_LE_vector ...
    latN95_RE_rp_vector latN95_LE_rp_vector]';

Amplitude_N35_P50=[PKAmpN35P50_RE_vector PKAmpN35P50_LE_vector ...
    PKAmpN35P50_RE_rp_vector PKAmpN35P50_LE_rp_vector]';

Latencia_N35_P50=[LatPKN35P50_RE_vector LatPKN35P50_LE_vector ...
    LatPKN35P50_RE_rp_vector LatPKN35P50_LE_rp_vector]';

Amplitude_P50_N95=[PKAmpP50N95_RE_vector PKAmpP50N95_LE_vector ...
    PKAmpP50N95_RE_rp_vector PKAmpP50N95_LE_rp_vector]';

Latencia_P50_N95=[LatPKP50N95_RE_vector LatPKP50N95_LE_vector ...
    LatPKP50N95_RE_rp_vector LatPKP50N95_LE_rp_vector]';

PotenciaMedia=[PotMedia_RE_vector PotMedia_LE_vector ...
    PotMedia_RE_rp_vector PotMedia_LE_rp_vector]';

pacientes=table(Amplitude_N35, Latencia_N35, Amplitude_P50, ...
    Latencia_P50, Amplitude_N95, Latencia_N95, Amplitude_N35_P50, ...
    Latencia_N35_P50, Amplitude_P50_N95, Latencia_P50_N95, ...
    PotenciaMedia, categoria);


Acuracia_Vector=[]
Sensibilidade_Vector=[]
Especificidade_Vector=[]

for i=1:100

    %Particionando os dados para treino e teste
    cv=cvpartition(size(pacientes, 1), 'holdout', 0.2);
    dataTrain=pacientes(training(cv),:); % 80% dos dados para teste
    dataTest=pacientes(test(cv),:) % 20% dos dados para teste

    model=fitglm(dataTrain, 'Distribution', 'binomial')
    %mdl=removeTerms(model,'Amplitude_N35', 'Latencia_N35','Amplitude_P50', ...
    %    'Latencia_P50', 'Amplitude_N95', 'LatenciaN95', 'Latencia_N35_P50', ...
    %    'Latencia_P50_N95')

    mdl=removeTerms(model,'Latencia_P50_N95');


    predicao_paciente_rp=round(predict(model, dataTest))

    paciente_rp=dataTest.categoria;

    C=confusionmat(paciente_rp, predicao_paciente_rp)

    % figure,
    % label_categorias={'0', '1'}
    % confusionchart(C, label_categorias)
    % xlabel('Predição Paciente RP')
    % ylabel('Paciente RP')

    TP=C(2,2); %True Postives
    TN=C(1,1); %True Negatives
    FP=C(1,2); %False Positives
    FN=C(2,1); %False Negatives

    accuracy=sum(diag(C))/sum(C, 'all');

    Sensibilidade=TP/(TP+FN);

    Especificidade=TN/(TN+FP);

    PPV=TP/(TP+FP); %Positive Preditive Value

    F1Score=(2*TP)/(2*TP+FP+FN);

    Acuracia_Vector=[ Acuracia_Vector accuracy]
    Sensibilidade_Vector=[Sensibilidade_Vector Sensibilidade]
    Especificidade_Vector=[ Especificidade_Vector Especificidade]

end



Acuracia_media=mean(Acuracia_Vector)
Sensibilidade_media=mean(Sensibilidade_Vector)
Especificidade_media=mean(Especificidade_Vector)

figure, plot(Acuracia_Vector)
figure, plot(Sensibilidade_Vector)
figure, plot(Especificidade_Vector)

