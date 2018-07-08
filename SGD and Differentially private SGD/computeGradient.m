function grad = computeGradient(w, x, y)

grad = 1/(1+exp(y*w'*x'))*(-y*x');

end