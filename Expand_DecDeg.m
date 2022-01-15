%% Expand_DecDeg
% Discription:
% Expands decimal degrees that are just given in Seconds to
% Hours, minutes seconds
% usage:
% [De_Mi_Se_Matrix] = Expand_DecDeg(seconds)
% input:
% seconds <= Decimal seconds.
% output:
% [De_Mi_Se_Matrix] <= Matrix for the corresponding Degrees,minutes,seconds
% rows in the matrix are in the same order as input in the vector
% external calls:
% none
% Author: Tim Kröger

function [De_Mi_Se_Matrix] = Expand_DecDeg(seconds)

% Value checks:

if (~isnumeric(seconds))
    error("seconds must be numeric.")
end

% computations

minutes = fix(seconds/60);
hour = fix(minutes/60);
seconds = seconds - minutes*60;

while(minutes>60)

    minutes = minutes-60;
    
end

De_Mi_Se_Matrix = zeros(1,3);
De_Mi_Se_Matrix(1,:) = [hour,minutes,seconds];

end

