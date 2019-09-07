function DisplayResults(Bat_Cap,N_Mot,PowerUnit_Mass,PropUnit_Mass,R,Mass_Fraction)

disp('Needed battery capacity[kw]:');
disp(Bat_Cap);
disp('Needed motor:');
disp(round(N_Mot));
disp('PowerUnit Mass [kg]:');
disp(PowerUnit_Mass);
disp('Propulsion Unit Mass [kg]:');
disp(PropUnit_Mass);
disp('Estimated Range in [km]');
disp(R);
disp('Power unit mass to TOW ratio');
disp(Mass_Fraction);
disp('\n\n');

end