clear;
close all;

%% N35
load("ampN35_LE_vector.mat");
load("ampN35_RE_vector.mat");
load("latN35_LE_vector.mat");
load("latN35_RE_vector.mat")

size(ampN35_LE_vector')

figure;
subplot(1,2,1)
boxplot([ampN35_LE_vector' ampN35_RE_vector']);
title('AmpN35 LE e RE');
subplot(1,2,2)
boxplot([latN35_LE_vector' latN35_RE_vector']);
title('LatN35 LE e RE');

%% P50
load("ampP50_LE_vector.mat");
load("ampP50_RE_vector.mat");
load("latP50_LE_vector.mat");
load("latP50_RE_vector.mat")

figure;
subplot(1,2,1)
boxplot([ampP50_LE_vector' ampP50_RE_vector']);
title('AmpP50 LE e RE');
subplot(1,2,2)
boxplot([latP50_LE_vector' latP50_RE_vector']);
title('LatP50 LE e RE');

%% N95
load("ampN95_LE_vector.mat");
load("ampN95_RE_vector.mat");
load("latN95_LE_vector.mat");
load("latN95_RE_vector.mat")

figure;
subplot(1,2,1)
boxplot([ampN95_LE_vector' ampN95_RE_vector']);
title('AmpN95 LE e RE');
subplot(1,2,2)
boxplot([latN95_LE_vector' latN95_RE_vector']);
title('LatN95 LE e RE');

%% POTÊNCIA
load("PotMedia_LE_vector.mat");
load("PotMedia_RE_vector.mat");
figure;
boxplot([PotMedia_LE_vector' PotMedia_RE_vector']);
title('Potência Média do Sinal LE e RE');