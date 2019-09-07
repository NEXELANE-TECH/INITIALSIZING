function [MTOW,b,g,W,V_inf,rho_air,e,A,CD0,R,S_wing] = InputData


% Data from similiar airplanes in order to try to find the correct batt &
% power system 

MTOW = 22000;      %Max Take Off Weight[kg]
b = 20;           %wingspan [m]
g = 9.81;           %gravity  [m/s^2]
W = MTOW*g;         %Weight   [N]
V_infK = 650;       %airspeed [m/s] --> the want you wish to achieve
V_inf = V_infK/3.6;        %airspeed [m/s] --> the want you wish to achieve


%Air conditions
rho_air = 0.64;     % air density at h(km) [kg/m^3]

%Airplane parameteres that needs to be chosen 

%Some aircraft data
%CD0 --> [0.022 - 0.028] --> for twin engine 
%CD0 --> [0.018 - 0.024] --> large turboprop 

e = 0.8;                % aerodynamic efficiency factor
A = 11;                 % Tapper ratio
CD0 = 0.023;            % Aicraft Parasite Drag 
R = 900000;             % Desired Range [m]
S_wing = (b^2) / A ;    % Wing surface [m^2]

end