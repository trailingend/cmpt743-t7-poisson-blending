X = 1:100;
Y = sin(X.*X/500);
% plot(Y)
dY = Y(2:100)-Y(1:99);
% plot(dY)
Y1 = Y(1);

% Reconstructing
A = zeros(101, 100);
b = zeros(101, 1);

for i=1:99
    A(i, i) = -1;
    A(i, i + 1) = 1;
    b(i)=dY(i);
end
A(100, 1) = 1;
b(100) = Y1;
A(101, 100) = 1;
b(101) = Y(100)+5;

V = A\b;

figure
plot(V)