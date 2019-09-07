function CL = ComputeCL (W,V_inf,S_wing,rho_air)

CL = (W*2) / ((V_inf^2)*S_wing*rho_air);        % Airplane lift coefficient

end