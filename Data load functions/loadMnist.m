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



















%norms_rows = sqrt(sum(X.^2,2)); % Compute norms of rows
%norms_rows(norms_rows<1) = 1;
%X = bsxfun(@rdivide,X,norms_rows); % Normalize X
%%%%%%%%%%%%%%%%%%%TEST CODE%%%%%%%%%%%%%%%%%%%%
% check if norm of all rows are max 1
%{
norms_test = zeros(1,size(X,2));
for i=1:size(X,2)
    norms_test(1,i) = norm(X(:,i));
end   
disp(min(norms_test))
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end