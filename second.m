X = 1:100;
Y = sin(X.*X/500);
% plot(Y)
dY = Y(2:100)-Y(1:99);
% plot(dY)
Y1 = Y(1);

% Reconstructing
A = zeros(100, 100);
A(1, 1) = 1;
for i=2:100
    A(i, i) = -1;
    A(i, i + 1) = 1;
end

b = [Y1, dY]';
size(A)
size(b)
V = A\b;
disp(V);