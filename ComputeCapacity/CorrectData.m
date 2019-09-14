function [V] = CorrectData(U,R)

V = U;
V(1,1) = V(1,1)*1000;
V(1,4) = V(1,4)*1000;
V(1,10) = R;
V(1,12) = V(1,12)*1000;
end