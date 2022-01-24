
Npx = sqrt(size(B,1));
Np=(size(B,1));

CJS = zeros(1,Np);
H = zeros(1,Np);


for i = 1:Np
    i
    [Cjs,H1] = Chplane_v1(B(i,400:end)',4);
    
    CJS(1,i) = Cjs;
    H(1,i) = H1;
end

C = vec2mat(CJS,Npx);
Hs = vec2mat(H,Npx);