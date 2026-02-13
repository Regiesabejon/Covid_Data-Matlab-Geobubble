% Script to compute and display reactor temperature
t = 0:0.5:30;
T = reactor_temp(t);

% Display first 10 rows of the table
fprintf('   t      T(t)\n');
fprintf('---------------\n');
for i = 1:10
    fprintf('%5.1f   %8.2f\n', t(i), T(i));
end

% Plot
figure;
plot(t, T, 'b-', 'LineWidth', 2);
xlabel('Time t (hours)');
ylabel('Temperature T(t)');
title('Reactor Temperature Profile');
grid on;