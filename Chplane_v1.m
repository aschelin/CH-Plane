function [Cjs,H1] = Chplane_v1(X,n)

%n = 5;
tau =1;
%[H,P] = petropy(X(:,1),n,1);
[H,P] = pec(X',n,tau);

%(length(X)-n+1);    
Ns = length(P);

% Normalize histogram
P = P/sum(P);

% Prepare uniform dist.
Pe = ones(1,Ns)*(1./Ns);
% Prepare P+Pe dist.
PPe = (P+Pe)/2;

% Compute unnormalized Shannon entropy
% No bin will be equal to zero because the uniform distribution
% is included in P + Pe
S1 = -sum(PPe.* log(PPe));
S3 = -sum(Pe.* log(Pe));

% Remove zero values.
% This step is needed since some bins in the distribution function
% might be equal to zero. The Shannon entropy already defines
% P * log(P) = 0 for P = 0.
%Pmz = P(find(P~=0));
P(find(P==0))=eps;
Pmz = P;

S2 = -sum(Pmz.* log(Pmz));

Ns = factorial(n);

DEN = ((Ns+1)/Ns)*log(Ns+1)-2*log(2*Ns)+log(Ns);

H1=H/log(factorial(n));


Cjs = -2*(S1-.5*S2-.5*S3)*H1/DEN;

%printf('CH Plane: (%f %f) (n = %d)\n', H1, Cjs, n);
