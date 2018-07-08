function [X, y] = loadSynData(s)

d = 5;
w = rand(1,d);
N = 5*s;
y = ones(1,N);
X = -1 + 2*rand(N, d);
for i = 1:N
    temp = w*(X(i,:)');
    if temp > 0
        y(i) = -1;
    end
end
round(X,3);
end