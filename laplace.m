function k  = laplace(m, n, alpha)

% Generate Laplacian noise

u = -1 + 2*rand(m, n);  % sample uniformly [-1,1]
u = normc(u);           % Normalize u
l = gamrnd(size(u,1),2/alpha);
k = l*u;

end