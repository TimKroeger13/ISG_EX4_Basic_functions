%% CartToSphe
% Discription:
% Converts Catesian coordiantes to spherical coordinates
% usage:
% [r,lamda , phi] = CartToSphe(x,y,z)
% input:
% x = The x coordinate in the cartesian sythem
% y = The x coordinate in the cartesian sythem
% z = The x coordinate in the cartesian sythem
% output:
% r <= Radus of the sphere.
% phi <= degree phi.
% lambda <= degree lambda.
% external calls:
% none
% Author: Based on Dr. Robert Heinkelmann

function [r,lamda , phi] = CartToSphe(x,y,z)
r = sqrt(x^2 + y^2 + z^2);
lamda = atan2(y,x);
phi = atan2(z,sqrt(x^2+y^2));
end




