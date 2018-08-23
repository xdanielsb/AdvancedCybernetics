x = 0:0.1:10;
subplot(311); plot(x, smf(x, [2 8]));
subplot(312); plot(x, smf(x, [4 6]));
subplot(313); plot(x, smf(x, [6 4]));
set(gcf, 'name', 'smf', 'numbertitle', 'off');