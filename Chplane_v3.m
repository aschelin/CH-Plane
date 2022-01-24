clear

N = 1e5;
nrs = 500;
Cjs = zeros(nrs,1);

r = linspace(3.5,4,nrs);

for i = 1 : nrs
    i
rlog = r(i);

[X] = logistic_map(rlog,N);

%logistic_map
%skew_tent_map
X1 = X(1000:end);

Xbinary = X1>.5;

X=Xbinary;

n = 5;

[CJS] = Chplane_v1(X)

Cjs(i) = CJS;

end