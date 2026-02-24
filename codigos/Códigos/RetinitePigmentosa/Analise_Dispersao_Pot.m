clear;
close all;

load("PotMedia_RE_vector.mat");
load("PotMedia_LE_vector.mat");

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
text(0.8, 0.9, sprintf('r = %.3f\np = %.3f', r_RE(1,2), p_val_RE(1,2)), ...
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
text(0.8, 0.9, sprintf('r = %.3f\np = %.3f', r_LE(1,2), p_val_LE(1,2)), ...
    'Units', 'normalized', 'FontSize', 11, 'BackgroundColor', 'white', 'EdgeColor', 'black');

sgtitle('Correlação Potência Média do Sinal vs Acuidade Visual', 'FontSize', 16, 'FontWeight', 'bold');