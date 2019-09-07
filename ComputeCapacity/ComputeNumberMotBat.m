function [Capacity,N_Mot,M_Bat,M_Mot,Mass_Fraction] = ComputeNumberMotBat(P_Mot,P_Need,R,Mass_Mot,PToW_Bat,Eff,MTOW,eta,g)

N_Mot = ceil(P_Need / P_Mot);
R = R/1000;                                             %[Km] Range in km
M_Bat = R*(g/PToW_Bat)*(1/Eff)*(MTOW*eta)*(1/3.6);      %[Kg] Batteries mass

M_Mot = N_Mot*Mass_Mot;                                 %[kg] Total motors mass
Capacity = (PToW_Bat*M_Bat)/1000; 
%[kWh] Needed Capacity
Mass_Fraction = M_Bat/(MTOW+M_Bat);                             
end