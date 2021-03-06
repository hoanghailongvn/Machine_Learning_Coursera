function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%


J =  1/2*sum((((X*Theta')(R) - Y(R)).^2)(:));

J += (lambda/2) * (sum((Theta.^2)(:)) + sum((X.^2)(:)));



for i = 1:num_movies
  r = R(i, :); % 1 x n_user
  y = Y(i, r); % 1 x n_user_rated
  theta = Theta(r, :); % n_user_rated, 100
  y = Y(i, r); % 1 x n_user_rated
  x = X(i, :); % 1 x 100
  X_grad(i, :) = (x*theta' - y) * theta; %1 x 100
  
  X_grad(i, :) += lambda .* x;
endfor



for j = 1:num_users
  r = R(:, j); % n_movie x 1                    %
  y = Y(r, j); % n_movie_rated x 1
  theta = Theta(j, :); % 1 x 100
  x = X(r, :); %n_movie_rated x 100
  
  Theta_grad(j, :) = (x'*(x*theta' - y))' ; %1x100
  
  Theta_grad(j, :) += lambda .* theta;
endfor











% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
