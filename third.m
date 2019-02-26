X = 1:100;
Y = sin(X.*X/500);
dY = Y(2:100)-Y(1:99);
Y1 = Y(1);

% Reconstructing
idx_part = 1:99;
val_part = ones(1, 99);
i = [idx_part,          idx_part,       100,    101];
j = [idx_part,          idx_part + 1,   1,      100];
v = [val_part * (-1),   val_part,       1,      1];

A = sparse(i, j, v);

b = [dY, Y1, Y(100)+5];
b = b';

V = A\b;

figure
plot(V)