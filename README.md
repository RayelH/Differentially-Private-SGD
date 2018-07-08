# Code for the bachelor thesis: Stochastic Gradient Descent With Differentially Private Updates

## Author: Rayel Hardwarsing

### Data sets
* BankNoteData.mat - Banknote authentication data set
* KDDCUPX.mat / KDDCUPY.mat - KDDCup Data set
* mnist.mat - MNIST data set
* occupationData.mat - Occupancy detection data sets

## Data loading functions

In this map we find the functions that load the data sets for the stochastic gradient descent algorithms. They return an X matrix, where each row is an observation and each column is a feature and a y vector, which holds the labels for each observation. For the MNIST and KDDCup data set a random projection is done as described in the paper.

## SGD and Differentially private SGD
* computeCost.m - computes the value of the cost given a set of observations
* computeGradient.m - computes the gradient based on a single observation
* laplace.m - generates the the laplace noise vector for differentially private SGD
* SGD.m - code for standard stochastic gradient descent
* DPSGD.m - code for differentially private stochastic gradient descent

## plotting functions
* plotObj.m - code used for all the plots of figures 1, 2, 3, 7, 8 and 9. It plots the objective value averaged over 20 permutations versus the number of iterations.
* plotsSyn.m - code used for all the plots of figures 4, 5 and 6. it can plot objective value versus batch size and objective value versus number of data points.
