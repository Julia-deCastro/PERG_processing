clear;
close all;
load latN35_LE_vector.mat
load latN35_LE_rp_vector.mat
load latN35_LE_dm_vector.mat
load latN35_RE_vector.mat
load latN35_RE_rp_vector.mat
load latN35_RE_dm_vector.mat

%% Retinite Pigmentosa
% Teste Estatístico 1
X=[latN35_LE_vector, latN35_LE_rp_vector];

G = [ones(size(latN35_LE_vector)), 2*ones(size(latN35_LE_rp_vector))];

figure;
subplot(1, 2, 1);
boxplot(X, G, 'Labels', {'Normal', 'Retinite Pigmentosa'});
ylabel('Latência N35 (ms)')
title('Normal vs Retinite Pigmentosa - Olho Esquerdo');

[p,h,stats] = ranksum(latN35_LE_vector, latN35_LE_rp_vector);
fprintf('\nNormal vs Retinite Pigmentosa\n');
[p_le, h_le, stats_le] = ranksum(latN35_LE_vector, latN35_LE_rp_vector);
fprintf('OE: p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_le, h_le, stats_le.ranksum, stats_le.zval);

% Teste Estatístico 1
X=[latN35_RE_vector, latN35_RE_rp_vector];

G = [ones(size(latN35_RE_vector)), 2*ones(size(latN35_RE_rp_vector))];

subplot(1, 2, 2);
boxplot(X, G, 'Labels', {'Normal', 'Retinite Pigmentosa'});
ylabel('Latência N35 (ms)')
title('Normal vs Retinite Pigmentosa - Olho Direito');
[p_re, h_re, stats_re] = ranksum(latN35_RE_vector, latN35_RE_rp_vector);
fprintf('OD: p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_re, h_re, stats_re.ranksum, stats_re.zval);


%% Distrofia Macular
% Teste Estatístico 1
X=[latN35_LE_vector, latN35_LE_dm_vector];

G = [ones(size(latN35_LE_vector)), 2*ones(size(latN35_LE_dm_vector))];

figure;
subplot(1, 2, 1);
boxplot(X, G, 'Labels', {'Normal', 'Distrofia Macular'});
ylabel('Latência N35 (ms)')
title('Normal vs Distrofia Macular - Olho Esquerdo');

[p,h,stats] = ranksum(latN35_LE_vector, latN35_LE_dm_vector);
fprintf('\nNormal vs Distrofia Macular\n');
[p_le, h_le, stats_le] = ranksum(latN35_LE_vector, latN35_LE_dm_vector);
fprintf('OE: p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_le, h_le, stats_le.ranksum, stats_le.zval);

% Teste Estatístico 1
X=[latN35_RE_vector, latN35_RE_dm_vector];

G = [ones(size(latN35_RE_vector)), 2*ones(size(latN35_RE_dm_vector))];

subplot(1, 2, 2);
boxplot(X, G, 'Labels', {'Normal', 'Distrofia Macular'});
ylabel('Latência N35 (ms)')
title('Normal vs Distrofia Macular - Olho Direito');
[p_re, h_re, stats_re] = ranksum(latN35_RE_vector, latN35_RE_dm_vector);
fprintf('OD: p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_re, h_re, stats_re.ranksum, stats_re.zval);



%% Teste Estatístico 2
X=[latN35_LE_vector, latN35_LE_rp_vector, latN35_LE_dm_vector];

G = [ones(size(latN35_LE_vector)), ...
    2*ones(size(latN35_LE_rp_vector)), ...
    3*ones(size(latN35_LE_dm_vector))];

figure;
boxplot(X, G, 'Labels', {'Normal', 'Retinite Pigmentosa', 'Distrofia Macular'});
ylabel('Amplitude N35-P50 (\muV)')

[p_kw_le,tbl,stats] = kruskalwallis(X, G);
c = multcompare(stats);
title('Comparação múltipla das medianas dos postos latência N35 - OE')
ax = gca;
ax.XLabel.String = 'Nenhum grupo têm posto médio significativamente diferente do Grupo Normal';
tbl = array2table(c,"VariableNames", ...
    ["Group A","Group B","Lower Limit","A-B","Upper Limit","P-value"])

% OD

X=[latN35_RE_vector, latN35_RE_rp_vector, latN35_RE_dm_vector];

G = [ones(size(latN35_RE_vector)), ...
    2*ones(size(latN35_RE_rp_vector)), ...
    3*ones(size(latN35_RE_dm_vector))];

figure;
boxplot(X, G, 'Labels', {'Normal', 'Retinite Pigmentosa', 'Distrofia Macular'});
ylabel('Amplitude N35-P50 (\muV)')

[p_kw_re,tbl,stats] = kruskalwallis(X, G);
c = multcompare(stats);
tbl = array2table(c,"VariableNames", ...
    ["Group A","Group B","Lower Limit","A-B","Upper Limit","P-value"])

fprintf('\nKruskal-Wallis\n');
fprintf('OE: p=%.4g', p_kw_le);
fprintf('\nOD: p=%.4g', p_kw_re);
