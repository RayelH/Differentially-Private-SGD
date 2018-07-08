function [X, y] = loadOccupationData()

data = load('occupationData.mat');
data = data.datatraining;

% features
X = data(:,1:5);
X = double(X);
X = normr(X);

% labels
y = data(:,6);
y(y == 0) = -1;
y = y';
end