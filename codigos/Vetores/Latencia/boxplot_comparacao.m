clear;
close all;
load latP50_LE_vector.mat
load latP50_LE_rp_vector.mat
load latP50_LE_dm_vector.mat
load latP50_RE_vector.mat
load latP50_RE_rp_vector.mat
load latP50_RE_dm_vector.mat

%% Boxplot único para cada olho: Normal, Distrofia Macular e Retinite Pigmentosa

% OE (Olho Esquerdo)
X_LE = [latP50_LE_vector, latP50_LE_dm_vector, latP50_LE_rp_vector];
G_LE = [ones(size(latP50_LE_vector)), ...
    2*ones(size(latP50_LE_dm_vector)), ...
    3*ones(size(latP50_LE_rp_vector))];

figure;
subplot(1,2,1)
boxplot(X_LE, G_LE, 'Labels', {'Normal', 'Distrofia Macular', 'Retinite Pigmentosa'});
ylabel('Latência P50 (ms)')
title('Latência P50 - OE');

% Testes estatísticos OE
fprintf('\nOE: Normal vs Distrofia Macular\n');
[p_le_dm, h_le_dm, stats_le_dm] = ranksum(latP50_LE_vector, latP50_LE_dm_vector);
fprintf('p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_le_dm, h_le_dm, stats_le_dm.ranksum, stats_le_dm.zval);

fprintf('OE: Normal vs Retinite Pigmentosa\n');
[p_le_rp, h_le_rp, stats_le_rp] = ranksum(latP50_LE_vector, latP50_LE_rp_vector);
fprintf('p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_le_rp, h_le_rp, stats_le_rp.ranksum, stats_le_rp.zval);

fprintf('OE: Distrofia Macular vs Retinite Pigmentosa\n');
[p_le_dm_rp, h_le_dm_rp, stats_le_dm_rp] = ranksum(latP50_LE_dm_vector, latP50_LE_rp_vector);
fprintf('p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_le_dm_rp, h_le_dm_rp, stats_le_dm_rp.ranksum, stats_le_dm_rp.zval);

% OD (Olho Direito)
X_RE = [latP50_RE_vector, latP50_RE_dm_vector, latP50_RE_rp_vector];
G_RE = [ones(size(latP50_RE_vector)), ...
    2*ones(size(latP50_RE_dm_vector)), ...
    3*ones(size(latP50_RE_rp_vector))];

subplot(1,2,2)
boxplot(X_RE, G_RE, 'Labels', {'Normal', 'Distrofia Macular', 'Retinite Pigmentosa'});
ylabel('Latência P50 (ms)')
title('Latência P50 - OD');

% Testes estatísticos OD
fprintf('\nOD: Normal vs Distrofia Macular\n');
[p_re_dm, h_re_dm, stats_re_dm] = ranksum(latP50_RE_vector, latP50_RE_dm_vector);
fprintf('p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_re_dm, h_re_dm, stats_re_dm.ranksum, stats_re_dm.zval);

fprintf('OD: Normal vs Retinite Pigmentosa\n');
[p_re_rp, h_re_rp, stats_re_rp] = ranksum(latP50_RE_vector, latP50_RE_rp_vector);
fprintf('p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_re_rp, h_re_rp, stats_re_rp.ranksum, stats_re_rp.zval);

fprintf('OD: Distrofia Macular vs Retinite Pigmentosa\n');
[p_re_dm_rp, h_re_dm_rp, stats_re_dm_rp] = ranksum(latP50_RE_dm_vector, latP50_RE_rp_vector);
fprintf('p=%.4g, h=%d, ranksum=%2f, z=%.4f\n', p_re_dm_rp, h_re_dm_rp, stats_re_dm_rp.ranksum, stats_re_dm_rp.zval);
