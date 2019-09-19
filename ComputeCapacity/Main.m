close all; clear all;
clc;

%% =========== DATA ================

% Aicraft and Requirement data
[MTOW,b,g,W,V_inf,rho_air,e,A,CD0,R,S_wing] = InputData;
eta = SystemsEfficiency;
% Batteries and motor batteries
[PToW_Bat,Eff_Mot,V_Mot,P_Mot,Mass_Mot] = BatteriesMotorsData;

%% =========== Airplane Data ================
DHC6 = table2array(ImportAirplaneData1('AirplaneData.xlsx','State Info',3,16))';
DORNIER = table2array(ImportAirplaneData2('AirplaneData.xlsx','State Info',3,16))';
IL114 = table2array(ImportAirplaneData3('AirplaneData.xlsx','State Info',3,16))';
L140 = table2array(ImportAirplaneData1('AirplaneData.xlsx','State Info',19,32))';
DASH8 = table2array(ImportAirplaneData2('AirplaneData.xlsx','State Info',19,32))';
E170 = table2array(ImportAirplaneData3('AirplaneData.xlsx','State Info',19,32))';
ERJ140 = table2array(ImportAirplaneData1('AirplaneData.xlsx','State Info',35,48))';
An140 = table2array(ImportAirplaneData2('AirplaneData.xlsx','State Info',35,48))';

% Correct data after importing from excel in order to have the proper units

DHC6 = CorrectData(DHC6,R);
DORNIER = CorrectData(DORNIER,R);
IL114 = CorrectData(IL114,R);
L140 = CorrectData(L140,R);
DASH8 = CorrectData(DASH8,R);
E170 = CorrectData(E170,R);
ERJ140 = CorrectData(ERJ140,R);
An140 = CorrectData(An140,R);

%% =========== Core Cruise Mode ================

% CL = ComputeCL (W,V_inf,S_wing,rho_air);
% CDi = ComputeCDi(CL,A,e);
% CD = ComputeCD(CD0,CDi);
% D = ComputeDrag(V_inf,S_wing,rho_air,CD);   %[N] Airplane Drag
% T = D;                                      %[N] Airplane Trhust
% Eff = CL/CD;
% P_Need = ComputePower(T,V_inf);             %[kW] Minimum needed power

% Compute For Different Airplanes

[DHC6_CMD] = ComputeCruiseMode(DHC6);           %CMR --> Cuise Mode Data 
[DORNIER_CMD] = ComputeCruiseMode(DORNIER);  
[IL114_CMD] = ComputeCruiseMode(IL114);  
[L140_CMD] = ComputeCruiseMode(L140);  
[DASH8_CMD] = ComputeCruiseMode(DASH8);  
[E170_CMD] = ComputeCruiseMode(E170);  
[ERJ140_CMD] = ComputeCruiseMode(ERJ140);  
[An140_CMD] = ComputeCruiseMode(An140);  

%% =========== Results ================
% [Bat_Cap,N_Mot,PowerUnit_Mass,PropUnit_Mass,BatMTOW_Fraction] = ComputeNumberMotBat(P_Mot,P_Need,R,Mass_Mot,PToW_Bat,Eff,MTOW,eta(1,1),g);
% DisplayResults(Bat_Cap,N_Mot,PowerUnit_Mass,PropUnit_Mass,R,BatMTOW_Fraction);

% Results For Different Airplanes
[Bat_CapDHC6,N_MotDHC6,PowerUnit_MassDHC6,PropUnit_MassDHC6,BatMTOW_FractionDHC6] = ComputeNumberMotBat(P_Mot,DHC6_CMD(1,3),R,Mass_Mot,PToW_Bat,DHC6(1,2),DHC6(1,1),eta(1,1),g,DHC6(1,12));
[Bat_CapDORNIER,N_MotDORNIER,PowerUnit_MassDORNIER,PropUnit_MassDORNIER,BatMTOW_FractionDORNIER] = ComputeNumberMotBat(P_Mot,DORNIER_CMD(1,3),R,Mass_Mot,PToW_Bat,DORNIER(1,2),DORNIER(1,1),eta(1,1),g,DORNIER(1,12));
[Bat_CapIL114,N_MotIL114,PowerUnit_MassIL114,PropUnit_MassIL114,BatMTOW_FractionIL114] = ComputeNumberMotBat(P_Mot,IL114_CMD(1,3),R,Mass_Mot,PToW_Bat,IL114(1,2),IL114(1,1),eta(1,1),g,IL114(1,12));
[Bat_CapL140,N_MotL140,PowerUnit_MassL140,PropUnit_MassL140,BatMTOW_FractionL140] = ComputeNumberMotBat(P_Mot,L140_CMD(1,3),R,Mass_Mot,PToW_Bat,L140(1,2),L140(1,1),eta(1,1),g,L140(1,12));
[Bat_CapDASH8,N_MotDASH8,PowerUnit_MassDASH8,PropUnit_MassDASH8,BatMTOW_FractionDASH8] = ComputeNumberMotBat(P_Mot,DASH8_CMD(1,3),R,Mass_Mot,PToW_Bat,DASH8(1,2),DASH8(1,1),eta(1,1),g,DASH8(1,12));
[Bat_CapE170,N_MotE170,PowerUnit_MassE170,PropUnit_MassE170,BatMTOW_FractionE170] = ComputeNumberMotBat(P_Mot,E170_CMD(1,3),R,Mass_Mot,PToW_Bat,E170(1,2),E170(1,1),eta(1,1),g,E170(1,12));
[Bat_CapERJ140,N_MotERJ140,PowerUnit_MassERJ140,PropUnit_MassERJ140,BatMTOW_FractionERJ140] = ComputeNumberMotBat(P_Mot,ERJ140_CMD(1,3),R,Mass_Mot,PToW_Bat,ERJ140(1,2),ERJ140(1,1),eta(1,1),g,ERJ140(1,12));
[Bat_CapAn140,N_MotAn140,PowerUnit_MassAn140,PropUnit_MassAn140,BatMTOW_FractionAn140] = ComputeNumberMotBat(P_Mot,An140_CMD(1,3),R,Mass_Mot,PToW_Bat,An140(1,2),An140(1,1),eta(1,1),g,An140(1,12));

DisplayResults(Bat_CapDHC6,N_MotDHC6,PowerUnit_MassDHC6,PropUnit_MassDHC6,DHC6(1,10),BatMTOW_FractionDHC6,'DHC6',DHC6);
DisplayResults(Bat_CapDORNIER,N_MotDORNIER,PowerUnit_MassDORNIER,PropUnit_MassDORNIER,DORNIER(1,10),BatMTOW_FractionDORNIER,'DORNIER',DORNIER);
DisplayResults(Bat_CapIL114,N_MotIL114,PowerUnit_MassIL114,PropUnit_MassIL114,IL114(1,10),BatMTOW_FractionIL114,'IL114',IL114);
DisplayResults(Bat_CapL140,N_MotL140,PowerUnit_MassL140,PropUnit_MassL140,L140(1,10),BatMTOW_FractionL140,'L140',L140);
DisplayResults(Bat_CapDASH8,N_MotDASH8,PowerUnit_MassDASH8,PropUnit_MassDASH8,DASH8(1,10),BatMTOW_FractionDASH8,'DASH8',DASH8);
DisplayResults(Bat_CapE170,N_MotE170,PowerUnit_MassE170,PropUnit_MassE170,E170(1,10),BatMTOW_FractionE170,'E170',E170);
DisplayResults(Bat_CapERJ140,N_MotERJ140,PowerUnit_MassERJ140,PropUnit_MassERJ140,ERJ140(1,10),BatMTOW_FractionERJ140,'ERJ-140',ERJ140);
DisplayResults(Bat_CapAn140,N_MotAn140,PowerUnit_MassAn140,PropUnit_MassAn140,An140(1,10),BatMTOW_FractionAn140,'An-140',An140);

Bat_CapT = [Bat_CapDHC6, Bat_CapDORNIER,Bat_CapIL114,Bat_CapL140,Bat_CapDASH8,Bat_CapE170,Bat_CapERJ140,Bat_CapAn140];
PowerUnit_MassT = [PowerUnit_MassDHC6,PowerUnit_MassDORNIER,PowerUnit_MassIL114,PowerUnit_MassDASH8,PowerUnit_MassE170,PowerUnit_MassERJ140,PowerUnit_MassAn140];

plot(PowerUnit_MassT);