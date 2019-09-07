function [Results] = ComputeCruiseMode(airplane)

CL = ComputeCL (airplane(1,4),airplane(1,5),airplane(1,11),airplane(1,6));
CDi = ComputeCDi(CL,airplane(1,8),airplane(1,7));
CD = ComputeCD(airplane(1,9),CDi);
D = ComputeDrag(airplane(1,5),airplane(1,11),airplane(1,6),CD);   %[N] Airplane Drag
T = D;                                      %[N] Airplane Trhust
Eff = CL/CD;
P_Need = ComputePower(T,airplane(1,5));  %[kW] Minimum needed power

Results = [Eff,T,P_Need];
end