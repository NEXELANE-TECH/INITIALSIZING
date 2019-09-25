function D = ComputeDrag(V_inf,S_wing,rho_air,CD)

D = 0.5*rho_air*CD*S_wing*(V_inf^2);

end