function [X, y] = loadKDD()

% features
X = load('KDDCUPX.mat');
X = X.kddcup1;
X = normr(X);

% random projection to d = 9
r = randi([1 size(X,2)],1,9);
X = X(:,r);

% labels
y_string = load('KDDCUPY.mat');
y_string = y_string.kddcup;
size(y_string)
y = ones(1, length(y_string));

for i = 1:length(y_string)
    if y_string(i) ~= 'normal.'
        y(i) = -1;
    end
end
end