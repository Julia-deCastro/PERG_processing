clear;
close all;

load("PotMedia_RE_vector.mat");
load("PotMedia_LE_vector.mat");

% Vetores de acuidade visual
acuidade_re_logMar = [-0.08; 0.1; -0.1; -0.08; 0; 0; 0; NaN; 0; -0.04; 0.66; 0.22; ...
    -0.06; 0.16; 0.22; NaN; 0.12; -0.1; 0.1; 0.42; 0.56; 0.25; -0.1; 0; 0.18; ...
    1.3; -0.02; 0.24; NaN; 1; -0.04; 1.3; NaN; 0.16; -0.08; 0; 0.06; 0.02; ...
    0.18; 0.6; 0.22; -0.08; 0; NaN; -0.08; 0.06; 0.4; 0.52; -0.1; -0.02; NaN; ...
    0; -0.04; 0.52; 3; 0; 2.3; -0.02; 1.52; 0.16; 0.22; 0; 0; 0.1; 0.16; 0.36; ...
    -0.08; 0; 0.16; -0.08; 0.04; 0; -0.08; 0.08; 0; 0.22; 0; -0.08; 0; 0.06; ...
    0.2; 0; -0.1; 0.5; 0.02; 0.1; 0.1; 0; -0.02; -0.1; 0.52; 0.16; -0.06; ...
    -0.02; 0.04; 0.3; -0.06; 0; 0.3; -0.02; -0.04; 0; -0.02; NaN; -0.1; 0];

acuidade_le_logMar = [0.06; 0.1; 0.07; -0.08; -0.02; 0; 0; NaN; 0; -0.02; 0.64; 0.16; ...
    -0.04; 0.1; 0.3; NaN; 0.1; -0.1; 0; 0.66; 0.54; 0.25; -0.1; 0; 0.18; 0.38; ...
    -0.02; 0.34; NaN; 0.8; 1.3; 0.92; NaN; 0.16; -0.1; 0; 0.02; -0.08; 1.44; ...
    0.6; 0.3; -0.08; 0.07; NaN; -0.08; 0.02; 0.52; 2; 0; -0.02; NaN; 0; -0.08; ...
    0.28; 2; 0; 0.04; -0.02; 1.52; 0.1; 0.16; 0.14; 0.04; 0.16; 0.1; 0.3; ...
    -0.08; -0.04; 0.16; -0.04; 0.04; 0.36; -0.08; -0.08; 0; 0.3; 0; -0.08; 0; ...
    0.14; 0.18; 0; -0.1; 0.36; 0.02; 0; 0.1; 0.8; -0.06; -0.1; 0.52; -0.04; ...
    -0.06; -0.04; 0.16; 0.3; -0.06; 0.08; 0.2; -0.08; -0.04; -0.06; -0.02; ...
    NaN; -0.06; 0];

% Filtrar dados válidos (remover NaN)
indices_validos_re = ~isnan(acuidade_re_logMar);
indices_validos_le = ~isnan(acuidade_le_logMar);

% Filtrar os vetores para manter correspondência
acuidade_re = acuidade_re_logMar(indices_validos_re);
acuidade_le = acuidade_le_logMar(indices_validos_le);

pot_media_re = PotMedia_RE_vector(indices_validos_re);
pot_media_le = PotMedia_LE_vector(indices_validos_le);

% Normalização
norm_acuidade_re = (acuidade_re - mean(acuidade_re)) / std(acuidade_re);
norm_acuidade_le = (acuidade_le - mean(acuidade_le)) / std(acuidade_le);

norm_pot_RE = (pot_media_re - mean(pot_media_re)) / std(pot_media_re);
norm_pot_LE = (pot_media_le - mean(pot_media_le)) / std(pot_media_le);

% Plot correlação Potência Média vs Acuidade Visual
figure;
subplot(1,2,1);
scatter(norm_acuidade_re, norm_pot_RE, 30, 'filled', 'MarkerFaceColor', 'blue'); hold on;
p_RE = polyfit(norm_acuidade_re, norm_pot_RE, 1);
[x_ord_re, ~] = sort(norm_acuidade_re);
y_fit_RE = polyval(p_RE, x_ord_re);
plot(x_ord_re, y_fit_RE, 'red', 'LineWidth', 2);
xlabel('Acuidade Visual (logMAR)', 'FontWeight', 'bold', 'FontSize', 12);
ylabel('Potência Média do Sinal', 'FontWeight', 'bold', 'FontSize', 12);
title('Potência Média - Olho Direito (RE)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
[r_RE, p_val_RE] = corrcoef(norm_acuidade_re, norm_pot_RE);
text(0.8, 0.1, sprintf('r = %.3f\np = %.3f', r_RE(1,2), p_val_RE(1,2)), ...
    'Units', 'normalized', 'FontSize', 11, 'BackgroundColor', 'white', 'EdgeColor', 'black');

subplot(1,2,2);
scatter(norm_acuidade_le, norm_pot_LE, 30, 'filled', 'MarkerFaceColor', 'blue'); hold on;
p_LE = polyfit(norm_acuidade_le, norm_pot_LE, 1);
[x_ord_le, ~] = sort(norm_acuidade_le);
y_fit_LE = polyval(p_LE, x_ord_le);
plot(x_ord_le, y_fit_LE, 'red', 'LineWidth', 2);
xlabel('Acuidade Visual (logMAR)', 'FontWeight', 'bold', 'FontSize', 12);
ylabel('Potência Média do Sinal', 'FontWeight', 'bold', 'FontSize', 12);
title('Potência Média - Olho Esquerdo (LE)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
[r_LE, p_val_LE] = corrcoef(norm_acuidade_le, norm_pot_LE);
text(0.8, 0.1, sprintf('r = %.3f\np = %.3f', r_LE(1,2), p_val_LE(1,2)), ...
    'Units', 'normalized', 'FontSize', 11, 'BackgroundColor', 'white', 'EdgeColor', 'black');

sgtitle('Correlação Potência Média do Sinal vs Acuidade Visual', 'FontSize', 16, 'FontWeight', 'bold');