function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%

NormParametersArray = [0.01,0.03 ];
NormParametersArray = [NormParametersArray,NormParametersArray*10,NormParametersArray*100,NormParametersArray*1000];

CsigErrorArray=[];

for i = 1:length(NormParametersArray)
    for j = 1:length(NormParametersArray)
        
        C = NormParametersArray(i);
        sigma = NormParametersArray(j);
        
        model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));

        predictions = svmPredict(model, Xval);

        crossValError = mean(double(predictions ~= yval));
        
        CsigErrorArray = [CsigErrorArray;[C,sigma,crossValError]];
    end
end

[minError,IndexofMinError] = min(CsigErrorArray(:,3));

%optimal C and sigma values

    C = CsigErrorArray(IndexofMinError,1);
    sigma = CsigErrorArray(IndexofMinError,2);
            

%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% =========================================================================

end
