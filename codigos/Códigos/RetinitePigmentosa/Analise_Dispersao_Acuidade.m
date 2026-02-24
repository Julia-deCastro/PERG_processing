clear;
close all;

load("ampN35_LE_vector.mat");
load("ampN35_RE_vector.mat");
load("ampP50_LE_vector.mat");
load("ampP50_RE_vector.mat");
load("ampN95_LE_vector.mat");
load("ampN95_RE_vector.mat");

% Vetores de acuidade visual
acuidade_re_logMar = [NaN; -0.07; 0.2; 0.5; 1.52; 0.52; NaN; 0.66; 0.5; 0.3; ...
    0.16; 0.4; -0.08; -0.06; 0.06; 0; 0.74; 0.78; 0.4; 0.28; 0.18; 0.26; ...
    0.1; -0.06; -0.04; 0.8; 0.04; NaN; -0.08; 3; 0.2; 0.26; 0.22; NaN; ...
    -0.04; 0; -0.08; -0.08; 0.8; NaN; 0; 0.02; 0.1; 0; 0.28; 0.14; 0];

acuidade_le_logMar = [NaN; 0.07; 0.1; 0.5; 1.4; 0.4; NaN; 0.46; 0.5; 0.24; 0.16; ...
    0.4; 0; 0.06; 0.04; 0; 0.12; 0.4; 0.46; 0.54; 0.18; 0.32; 0; -0.04; 0;...
    0.4; -0.04; NaN; -0.08; 0.16; 0.2; 0.26; 0.4; NaN; -0.04; 0.96; -0.08;...
    -0.08; 0; NaN; 0.12; 0; 0.16; 0.1; 0.26; 0.12; 0];

% Filtrar dados válidos (remover NaN)
indices_validos_re = ~isnan(acuidade_re_logMar);
indices_validos_le = ~isnan(acuidade_le_logMar);

% Filtrar os vetores de amplitude para manter correspondência
acuidade_re = acuidade_re_logMar(indices_validos_re);
acuidade_le = acuidade_le_logMar(indices_validos_le);

ampN35_RE = ampN35_RE_vector(indices_validos_re);
ampP50_RE = ampP50_RE_vector(indices_validos_re);
ampN95_RE = ampN95_RE_vector(indices_validos_re);

ampN35_LE = ampN35_LE_vector(indices_validos_le);
ampP50_LE = ampP50_LE_vector(indices_validos_le);
ampN95_LE = ampN95_LE_vector(indices_validos_le);

% Normalização
norm_acuidade_re = (acuidade_re - mean(acuidade_re)) / std(acuidade_re);
norm_acuidade_le = (acuidade_le - mean(acuidade_le)) / std(acuidade_le);

norm_ampN35_RE = (ampN35_RE - mean(ampN35_RE)) / std(ampN35_RE);
norm_ampP50_RE = (ampP50_RE - mean(ampP50_RE)) / std(ampP50_RE);
norm_ampN95_RE = (ampN95_RE - mean(ampN95_RE)) / std(ampN95_RE);

norm_ampN35_LE = (ampN35_LE - mean(ampN35_LE)) / std(ampN35_LE);
norm_ampP50_LE = (ampP50_LE - mean(ampP50_LE)) / std(ampP50_LE);
norm_ampN95_LE = (ampN95_LE - mean(ampN95_LE)) / std(ampN95_LE);

% N35
figure;
subplot(1,2,1);
scatter(norm_acuidade_re, norm_ampN35_RE, 30, 'filled', 'MarkerFaceColor', 'blue'); hold on;
p_N35_RE = polyfit(norm_acuidade_re, norm_ampN35_RE, 1);
[x_ord_re, idx_re] = sort(norm_acuidade_re);
y_fit_N35_RE = polyval(p_N35_RE, x_ord_re);
plot(x_ord_re, y_fit_N35_RE, 'red', 'LineWidth', 2);
xlabel('Acuidade Visual (logMAR)', 'FontWeight', 'bold', 'FontSize', 12);
ylabel('Amplitude N35 (μV)', 'FontWeight', 'bold', 'FontSize', 12);
title('N35 - Olho Direito (RE)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
[r_N35_RE, p_val_N35_RE] = corrcoef(norm_acuidade_re, norm_ampN35_RE);
text(0.8, 0.1, sprintf('r = %.3f\np = %.3f', r_N35_RE(1,2), p_val_N35_RE(1,2)), ...
    'Units', 'normalized', 'FontSize', 11, 'BackgroundColor', 'white', 'EdgeColor', 'black');

subplot(1,2,2);
scatter(norm_acuidade_le, norm_ampN35_LE, 30, 'filled', 'MarkerFaceColor', 'blue'); hold on;
p_N35_LE = polyfit(norm_acuidade_le, norm_ampN35_LE, 1);
[x_ord_le, idx_le] = sort(norm_acuidade_le);
y_fit_N35_LE = polyval(p_N35_LE, x_ord_le);
plot(x_ord_le, y_fit_N35_LE, 'red', 'LineWidth', 2);
xlabel('Acuidade Visual (logMAR)', 'FontWeight', 'bold', 'FontSize', 12);
ylabel('Amplitude N35 (μV)', 'FontWeight', 'bold', 'FontSize', 12);
title('N35 - Olho Esquerdo (LE)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
[r_N35_LE, p_val_N35_LE] = corrcoef(norm_acuidade_le, norm_ampN35_LE);
text(0.8, 0.1, sprintf('r = %.3f\np = %.3f', r_N35_LE(1,2), p_val_N35_LE(1,2)), ...
    'Units', 'normalized', 'FontSize', 11, 'BackgroundColor', 'white', 'EdgeColor', 'black');

sgtitle('Correlação N35 vs Acuidade Visual', 'FontSize', 16, 'FontWeight', 'bold');

% P50
figure;
subplot(1,2,1);
scatter(norm_acuidade_re, norm_ampP50_RE, 30, 'filled', 'MarkerFaceColor', 'blue'); hold on;
p_P50_RE = polyfit(norm_acuidade_re, norm_ampP50_RE, 1);
[x_ord_re, ~] = sort(norm_acuidade_re);
y_fit_P50_RE = polyval(p_P50_RE, x_ord_re);
plot(x_ord_re, y_fit_P50_RE, 'red', 'LineWidth', 2);
xlabel('Acuidade Visual (logMAR)', 'FontWeight', 'bold', 'FontSize', 12);
ylabel('Amplitude P50 (μV)', 'FontWeight', 'bold', 'FontSize', 12);
title('P50 - Olho Direito (RE)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
[r_P50_RE, p_val_P50_RE] = corrcoef(norm_acuidade_re, norm_ampP50_RE);
text(0.05, 0.95, sprintf('r = %.3f\np = %.3f', r_P50_RE(1,2), p_val_P50_RE(1,2)), ...
    'Units', 'normalized', 'FontSize', 11, 'BackgroundColor', 'white', 'EdgeColor', 'black');

subplot(1,2,2);
scatter(norm_acuidade_le, norm_ampP50_LE, 30, 'filled', 'MarkerFaceColor', 'blue'); hold on;
p_P50_LE = polyfit(norm_acuidade_le, norm_ampP50_LE, 1);
[x_ord_le, ~] = sort(norm_acuidade_le);
y_fit_P50_LE = polyval(p_P50_LE, x_ord_le);
plot(x_ord_le, y_fit_P50_LE, 'red', 'LineWidth', 2);
xlabel('Acuidade Visual (logMAR)', 'FontWeight', 'bold', 'FontSize', 12);
ylabel('Amplitude P50 (μV)', 'FontWeight', 'bold', 'FontSize', 12);
title('P50 - Olho Esquerdo (LE)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
[r_P50_LE, p_val_P50_LE] = corrcoef(norm_acuidade_le, norm_ampP50_LE);
text(0.05, 0.95, sprintf('r = %.3f\np = %.3f', r_P50_LE(1,2), p_val_P50_LE(1,2)), ...
    'Units', 'normalized', 'FontSize', 11, 'BackgroundColor', 'white', 'EdgeColor', 'black');

sgtitle('Correlação P50 vs Acuidade Visual', 'FontSize', 16, 'FontWeight', 'bold');

% N95
figure;
subplot(1,2,1);
scatter(norm_acuidade_re, norm_ampN95_RE, 30, 'filled', 'MarkerFaceColor', 'blue'); hold on;
p_N95_RE = polyfit(norm_acuidade_re, norm_ampN95_RE, 1);
[x_ord_re, ~] = sort(norm_acuidade_re);
y_fit_N95_RE = polyval(p_N95_RE, x_ord_re);
plot(x_ord_re, y_fit_N95_RE, 'red', 'LineWidth', 2);
xlabel('Acuidade Visual (logMAR)', 'FontWeight', 'bold', 'FontSize', 12);
ylabel('Amplitude N95 (μV)', 'FontWeight', 'bold', 'FontSize', 12);
title('N95 - Olho Direito (RE)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
[r_N95_RE, p_val_N95_RE] = corrcoef(norm_acuidade_re, norm_ampN95_RE);
text(0.8, 0.1, sprintf('r = %.3f\np = %.3f', r_N95_RE(1,2), p_val_N95_RE(1,2)), ...
    'Units', 'normalized', 'FontSize', 11, 'BackgroundColor', 'white', 'EdgeColor', 'black');

subplot(1,2,2);
scatter(norm_acuidade_le, norm_ampN95_LE, 30, 'filled', 'MarkerFaceColor', 'blue'); hold on;
p_N95_LE = polyfit(norm_acuidade_le, norm_ampN95_LE, 1);
[x_ord_le, ~] = sort(norm_acuidade_le);
y_fit_N95_LE = polyval(p_N95_LE, x_ord_le);
plot(x_ord_le, y_fit_N95_LE, 'red', 'LineWidth', 2);
xlabel('Acuidade Visual (logMAR)', 'FontWeight', 'bold', 'FontSize', 12);
ylabel('Amplitude N95 (μV)', 'FontWeight', 'bold', 'FontSize', 12);
title('N95 - Olho Esquerdo (LE)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
[r_N95_LE, p_val_N95_LE] = corrcoef(norm_acuidade_le, norm_ampN95_LE);
text(0.8, 0.1, sprintf('r = %.3f\np = %.3f', r_N95_LE(1,2), p_val_N95_LE(1,2)), ...
    'Units', 'normalized', 'FontSize', 11, 'BackgroundColor', 'white', 'EdgeColor', 'black');

sgtitle('Correlação N95 vs Acuidade Visual', 'FontSize', 16, 'FontWeight', 'bold');

fprintf('RESUMO DAS CORRELAÇÕES (DADOS NORMALIZADOS)\n');
fprintf('\nCOMPONENTE N35:\n');
fprintf('  RE: r = %.3f, p = %.3f\n', r_N35_RE(1,2), p_val_N35_RE(1,2));
fprintf('  LE: r = %.3f, p = %.3f\n', r_N35_LE(1,2), p_val_N35_LE(1,2));
fprintf('\nCOMPONENTE P50:\n');
fprintf('  RE: r = %.3f, p = %.3f\n', r_P50_RE(1,2), p_val_P50_RE(1,2));
fprintf('  LE: r = %.3f, p = %.3f\n', r_P50_LE(1,2), p_val_P50_LE(1,2));
fprintf('\nCOMPONENTE N95:\n');
fprintf('  RE: r = %.3f, p = %.3f\n', r_N95_RE(1,2), p_val_N95_RE(1,2));
fprintf('  LE: r = %.3f, p = %.3f\n', r_N95_LE(1,2), p_val_N95_LE(1,2));