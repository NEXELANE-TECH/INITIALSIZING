function eta = SystemsEfficiency

eta = ones(1,6);            % Array of the different effiencies of the system

eta(1,2) = 0.9;            % Propeller eficiency
eta(1,3) = 0.95;            % Mechanical bus effiency
eta(1,4) = 0.98;            % Electric Motor effiecny
eta(1,5) = 0.97;            % Wiring effiency
eta(1,6) = 0.97;            % Inverter effiency

eta(1,1) = prod(eta);       % Total system efficiency
end