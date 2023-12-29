% Nilai-nilai yang diberikan
epsilon_r = [2.5, 2.0, 2.5, 2.0, 2.5, 2.0, 2.5];
d = [200, 230, 280, 350, 440, 550, 680]; % Dalam nanometer

% Frekuensi
frequency = linspace(0, 5, 1000); % Frekuensi dari 0 hingga 5 GHz

% Hitung sifat dielektrik kompleks (epsilon) untuk setiap lapisan
epsilon = zeros(size(frequency));
for i = 1:numel(epsilon_r)
    epsilon = epsilon + epsilon_r(i) * exp(1i * 2 * pi * frequency * 1e9 * d(i) * 1e-9);
end

% Hitung reflectance, transmittance, dan conservation
reflectance = abs((1 - sqrt(epsilon))./(1 + sqrt(epsilon))).^2 * 100;
transmittance = 100 - reflectance;
conservation = 100 - abs(reflectance - transmittance);

% Plot hasil gabungan
figure;
plot(frequency, reflectance, 'r-', 'LineWidth', 2); % Plot reflectance in red
hold on;
plot(frequency, transmittance, 'b--', 'LineWidth', 2); % Plot transmittance in blue dashed line
plot(frequency, conservation, 'k:', 'LineWidth', 2); % Plot conservation in black dotted line
hold off;

% Tambahkan label, legenda, dan judul
xlabel('Frekuensi (GHz)');
ylabel('%');
legend('Reflectance', 'Transmittance', 'Conservation');
title('FDTD result');

% Setel batas sumbu y ke 0-100%
ylim([0 100]);

% Opsional, setel batas sumbu x sesuai dengan rentang data
xlim([min(frequency) max(frequency)]);

% Tingkatkan visibilitas grid
grid on;
