function [ geo_jac,G1 ] = Geometric_Jacobian(T_base, T_ee, DH_table)
% costruction of the geometric jacobian of a system
% WARNING: only for ROTOIDAL JOINTS.

n = size(DH_table,1);
q = sym('q', [1,n]);


T = T_base;
n_link = size(DH_table,1);

for i=1:n_link
        r = T(1:3,1:3);
        z_{i} = r(:,3);
        
    T = T*DH_matrix(DH_table(i,:));
    
end



Tf= T*T_ee;

Rsc_DH = Tf(1:3,1:3);

for i = 1:n
%JO_skew = diff(Rsc_DH,q(i))*Rsc_DH.'; 
%JO_{i} = ([JO_skew(3,2);JO_skew(1,3);JO_skew(2,1)]);
JO_{i} = z_{i};
end

JO = [JO_{1}];
for i = 2:n
    %JO = [JO,JO_{i}];
        JO = [JO,JO_{i}];

end

P_q = simplify(Tf(1:3,4));
Jp = jacobian(P_q,q);
geo_jac = [Jp;JO];

end

