function c = computeCost(w, X, y, lambda)

c = (lambda/2)*(norm(w)^2) + (1/size(X,1))*sum(log(1 + exp((-1*y.*(w'*X')))));

end