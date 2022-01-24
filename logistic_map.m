function [X] = logistic_map(r,N)

X = zeros(N,1);

X(1,1) = rand(1);


for i = 1:N-1
   
    X(i+1,1) =r.*X(i).*(1-X(i));
    
end

