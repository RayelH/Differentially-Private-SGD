function [X, y] = loadBankNote()

data = load('BankNoteData.mat');
data = data.databanknoteauthentication;

% features
X = data(:,1:4);
X = double(X);
X = normr(X);

% labels
y = data(:,5);
y(y == 0) = -1;
y = y';

end