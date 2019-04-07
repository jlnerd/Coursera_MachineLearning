function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
% 
for i = 1:length(centroids(:,1))
    indices_of_match = find(idx == i);
    C_k(i) = sum(ones(length( indices_of_match),1)); % number of examples assigned to given cluster
    
    %for each column of X values
    for j = 1:length(X(1,:))
        sum_array(j) = sum(X(indices_of_match,j));
    end
    
    %update centroid position
    centroids(i,:) = (1/C_k(i)).*sum_array;
end
   
% =============================================================


end

