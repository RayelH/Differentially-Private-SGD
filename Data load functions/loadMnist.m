function [X, y] = loadMnist()

mnist_data = load('mnist.mat');

% features
X = double(mnist_data.trainX);
X = normr(X);


% random projection to d = 15
r = randi([1 size(X,2)],1,15);
X = X(:,r);

% labels
y = double(mnist_data.trainY);
y(y ~= 0) = -1;

end