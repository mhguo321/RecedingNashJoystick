function [ Hu,Hv ] = LG_Nash_Sol_1st( N,Q1,R11,Q2,R22,A,B1,B2 )
%LG_NASH_SOL Summary of this function goes here
%   Detailed explanation goes here
P1 = Q1;
P2 = Q2;
    for i = N-1:-1:1
        G1 = R11 + B1'*P1*B1;
        G2 = R22 + B2'*P2*B2;
        F1 = B1'*P1*A;
        F2 = B2'*P2*A;
        
        E1 = B1'*P1*B2;
        E2 = B2'*P2*B1;
        
        Hu = (G1-E1/G2*E2)\(F1-E1/G2*F2);
        Hv = (G2-E2/G1*E1)\(F2-E2/G1*F1);
        
        P1 = Q1 + A'*P1*(A-B1*Hu-B2*Hv);
        P2 = Q2 + A'*P2*(A-B1*Hu-B2*Hv);
    end
Hu = -Hu;
Hv = -Hv;
% Hu = -R11\B1'*M1/(eye(26)+S1*M1+S2*M2)*A;
% Hv = -R22\B2'*M2/(eye(26)+S1*M1+S2*M2)*A;
end

