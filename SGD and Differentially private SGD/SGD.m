function cost_history = SGD(X,y,b)

%% initialize variables and constants

% Hyperparameters
lambda = 0.0001;           % regularization parameter
alpha = 1;                 % privacy parameter
m = size(X,1);             % number of training examples(rows)
d = size(X,2);             % number of features(columns) 
batch_size = b;
number_of_batches = floor(m/batch_size);

% Constants
epochs = 1;           % number of epochs

% parameters
w = randn(d,1);

% information holders
cost_history = zeros(1, number_of_batches*epochs + 1);
w_history = zeros(d, number_of_batches*epochs + 1);
lr_var = 1;

%% run stochastic gradient descent
obs_order = 1:size(X,1);
obs_order = obs_order(randperm(length(obs_order))); % random order of observations for SGD


for i = 1:epochs    
    count_obs = 1;
    if i == 1       
        cost_history(1) = computeCost(w, X, y, lambda);
        w_history(:,1) = w;
    end
    
    for j=1:number_of_batches
        grads = zeros(length(w),batch_size);
        
        for k=1:batch_size            
            grad = computeGradient(w, X((obs_order(count_obs)), :), y(obs_order(count_obs)));
            grads(:,k) = grad;
            count_obs  = count_obs + 1;
        end
        sum_grads = sum(grads,2);
        learning_rate = 1/sqrt(lr_var);
        w = w - learning_rate*(lambda*w + (1/batch_size)*sum_grads);
        if norm(w) > 1/lambda
            w = normc(w)*1/lambda;            
        end
        cost_history((lr_var)+1) = computeCost(w, X, y, lambda);
        w_history(:, (lr_var)+1) = w;
        lr_var = lr_var+1;
        
    end
end

end