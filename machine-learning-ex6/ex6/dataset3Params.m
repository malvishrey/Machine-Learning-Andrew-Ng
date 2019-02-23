function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
q1=100000;
for C = [0.01 0.03 0.1 0.3 1 3 10 30]
    for sigma = [0.01 0.03 0.1 0.3 1 3 10 30]
      model= svmTrain(X, y, C, @(x1, x2)gaussianKernel(x1, x2, sigma));
      predictions = svmPredict(model, Xval);
      s1=mean(double(predictions ~= yval));
      if(s1<q1)
      q1=s1;
      c1=C;
      si1=sigma;
      end
    end
  end
  C=c1;
  sigma=si1;





% =========================================================================

end
