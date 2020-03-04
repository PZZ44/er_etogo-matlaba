%zadanie 1
x1 = -3:0.0001:3;
y1 = sin(x1)+cos(x1);
y2 = cos(x1)+x1.^2;
y22 = x1.^2+log10(x1);
plot(x1, y1, '-r', x1, y22, '-b', x1, y2, '-g');
legend('y1 = sin(x)+cos(x)', 'y2 = cos(x)+x^2', 'y3 = x^2+log10(x)');
axis square;
grid on;
str = input('Input close to close zadanie 1 ');
clf;


%zadanie 2
x1 = 0; x11 = 0; x2 = -10:0.000001:0; x22 = 0:0.000001:10;
y1 = 0; y11 = 0; y2 = 0; y22 = 0;
for i = 1:11
x1 (i)= -11+i;
end
for i = 1:11
x11(i) = -1+i;
end
y1 = (3+sin(2.*x1))./(1+cos(x1.^2)); y2 = (3+sin(2.*x2))./(1+cos(x2.^2));
y11 = (2.*x11)+(sin(x11.^2))/(3+x11); y22 = (2.*x22)+(sin(x22.^2))/(3+x22);
plot(x2, y2, '-r', x22, y22, '-r', x1, y1, '-ok', x11, y11, '-ok');
legend('Matlab vector func','','For i to n func','');
axis square;
grid on;
xlim([-9, 9]);
xlabel('X axis');
ylabel('Y axis');







