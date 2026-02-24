clear;
close all;
load ampN95_LE_vector.mat
load ampN95_LE_rp_vector.mat
load ampN95_LE_dm_vector.mat
load ampN95_RE_vector.mat
load ampN95_RE_rp_vector.mat
load ampN95_RE_dm_vector.mat

%% Retinite Pigmentosa
% Teste Estatístico 1
X=[ampN95_LE_vector, ampN95_LE_rp_vector];

G = [ones(size(ampN95_LE_vector)), 2*ones(size(ampN95_LE_rp_vector))];

figure;
subplot(1, 2, 1);
boxplot(X, G, 'Labels', {'Normal', 'Retinite Pigmentosa'});
ylabel('Amplitude N95 (\muV)')
title('OE');

[p,h,stats] = ranksum(ampN95_LE_vector, ampN95_LE_rp_vector);
fprintf('\nNormal vs Retinite Pigmentosa\n');
[p_le, h_le, stats_le] = ranksum(ampN95_LE_vector, ampN95_LE_rp_vector);
fprintf('OE: p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_le, h_le, stats_le.ranksum, stats_le.zval);

% Teste Estatístico 1
X=[ampN95_RE_vector, ampN95_RE_rp_vector];

G = [ones(size(ampN95_RE_vector)), 2*ones(size(ampN95_RE_rp_vector))];

subplot(1, 2, 2);
boxplot(X, G, 'Labels', {'Normal', 'Retinite Pigmentosa'});
ylabel('Amplitude N95 (\muV)')
title('OD');
[p_re, h_re, stats_re] = ranksum(ampN95_RE_vector, ampN95_RE_rp_vector);
fprintf('OD: p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_re, h_re, stats_re.ranksum, stats_re.zval);

%% Distrofia Macular
% Teste Estatístico 1
X=[ampN95_LE_vector, ampN95_LE_dm_vector];

G = [ones(size(ampN95_LE_vector)), 2*ones(size(ampN95_LE_dm_vector))];

figure;
subplot(1, 2, 1);
boxplot(X, G, 'Labels', {'Normal', 'Distrofia Macular'});
ylabel('Amplitude N95 (\muV)')
title('OE');

[p,h,stats] = ranksum(ampN95_LE_vector, ampN95_LE_dm_vector);
fprintf('\nNormal vs Distrofia Macular\n');
[p_le, h_le, stats_le] = ranksum(ampN95_LE_vector, ampN95_LE_dm_vector);
fprintf('OE: p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_le, h_le, stats_le.ranksum, stats_le.zval);

% Teste Estatístico 1
X=[ampN95_RE_vector, ampN95_RE_dm_vector];

G = [ones(size(ampN95_RE_vector)), 2*ones(size(ampN95_RE_dm_vector))];

subplot(1, 2, 2);
boxplot(X, G, 'Labels', {'Normal', 'Distrofia Macular'});
ylabel('Amplitude N95 (\muV)')
title('OD');
[p_re, h_re, stats_re] = ranksum(ampN95_RE_vector, ampN95_RE_dm_vector);
fprintf('OD: p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_re, h_re, stats_re.ranksum, stats_re.zval);



%% Teste Estatístico 2
X=[ampN95_LE_vector, ampN95_LE_rp_vector, ampN95_LE_dm_vector];

G = [ones(size(ampN95_LE_vector)), ...
    2*ones(size(ampN95_LE_rp_vector)), ...
    3*ones(size(ampN95_LE_dm_vector))];

figure;
boxplot(X, G, 'Labels', {'Normal', 'Retinite Pigmentosa', 'Distrofia Macular'});
ylabel('Amplitude N35-P50 (\muV)')

[p_kw_le,tbl,stats] = kruskalwallis(X, G);
c = multcompare(stats);
tbl = array2table(c,"VariableNames", ...
    ["Group A","Group B","Lower Limit","A-B","Upper Limit","P-value"])

% OD

X=[ampN95_RE_vector, ampN95_RE_rp_vector, ampN95_RE_dm_vector];

G = [ones(size(ampN95_RE_vector)), ...
    2*ones(size(ampN95_RE_rp_vector)), ...
    3*ones(size(ampN95_RE_dm_vector))];

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
