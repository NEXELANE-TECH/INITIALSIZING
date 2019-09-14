function[PToW_Bat,Eff_Mot,V_Mot,P_Mot,Mass_Mot] = BatteriesMotorsData

%% BATTERIES
PToW_Bat = 500;                     %[Wh/kg] energy range [100-1000]
% There are different kind of batteries the higher the energy range the
% more expensive the cell/battery is

%% Motor 
 %Magnix 250 
P_MotM250 = 280;                    %[kW] propulsion power,         
Mass_MotM250 = 72;                  %[kg] motor mass

%Magnix 500
P_MotM500 = 560;                    %[kW] propulsion power, 
Mass_MotM500 = 135;                 %[kg] motor mass

Eff_Mot = 0.93;                     %motor efficiency
V_Mot = 540;                        %[V] needed voltage
P_Mot = P_MotM500;                  %[kW] power from the selected motor
Mass_Mot = Mass_MotM500;            %[kg] sleceted motor mass
end