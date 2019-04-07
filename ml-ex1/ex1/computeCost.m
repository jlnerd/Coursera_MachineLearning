function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
%J = 0;
%theta=[0,0];

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

%for n=1:iterations
    h=theta(1)*X(:,1)+theta(2)*X(:,2); %theta(1)*X(:,1)+theta(2)*X(:,2)
    J=(1/(2*m))*sum((h-y).^2);
  %for j=length(theta)
   %    theta(j)=theta(j)-alpha*(1/m)*sum((h-y).*X(:,j));   
   %end
%end

Output=J;



% =========================================================================

end
