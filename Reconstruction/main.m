clc;
clear;
close all;

imgin = im2double(imread('./target.jpg'));

[imh, imw, nb] = size(imgin);
assert(nb==1);
% the image is grayscale

V = zeros(imh, imw);
V(1 : imh * imw) = 1 : imh * imw;
% V(y, x) = (y - 1) * imw + x
% use V(y,x) to represent the variable index of pixel (x,y)
% Always keep in mind that in matlab indexing starts with 1, not 0

%TODO: initialize counter, A (sparse matrix) and b.
%-----
%-----
dX = imgin(:, 2 : imw) - imgin(:, 1 : imw - 1);
dY = imgin(2 : imh, :) - imgin(1 : imw - 1, :);


%TODO: fill the elements in A and b, for each pixel in the image
%-----
%-----
idx_part = 1 : (imh) * (imw - 1);
val_part = ones(1, (imh) * (imw - 1));
i = [idx_part,          idx_part,       (imh)*(imw - 1) + 1];
j = [idx_part,          idx_part + 1,   1];
v = [val_part * (-1),   val_part,       1];

idx_part = idx_part + (imh)*(imw - 1) + 1;
i2 = [idx_part,          idx_part,       (imh)*(imw - 1) + 1 + (imh)*(imw - 1) + 1];
j2 = [idx_part,          idx_part + 1,   1];
v2 = [val_part * (-1),   val_part,       1];

i = [i, i2];
j = [j, j2];
v = [v, v2];
size(i)

A = sparse(i, j, v);

%TODO: add extra constraints
%-----
%-----
dX = dX(:);
dY = dY(:);
b = [dX; imgin(1, 1); dY; imgin(1, 1)];

size(A)
size(b)

%TODO: solve the equation
%use "lscov" or "\", please google the matlab documents
solution = A\b;
solution
% error = sum(abs(A*solution-b));
% disp(error)
% imgout = reshape(solution,[imh,imw]);
% 
% imwrite(imgout,'output.png');
% figure(), hold off, imshow(imgout);

