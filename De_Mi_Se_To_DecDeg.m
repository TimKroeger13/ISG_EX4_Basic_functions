%% De_Mi_Se_To_DecDeg
% Discription:
% Converts degrees,minutes,seconds to decimal degrees
% usage:
% [vectorOfDecDeg] = De_Mi_Se_To_DecDeg(De_Mi_Se_Matrix)
% input:
% De_Mi_Se_Matrix <= Matrix of Degrees,minutes,seconds for columns.
% Rows are the different Degrees,minutes,seconds vectors.
% output:
% [vectorOfDecDeg] <= Row vector of decimal degrees or a single value
% external calls:
% none
% Author: Tim Kröger

function [vectorOfDecDeg] = De_Mi_Se_To_DecDeg(De_Mi_Se_Matrix)

% Value checks:

if (~isnumeric(De_Mi_Se_Matrix))
    error("vectorOfDecDeg must be numeric.")
end

if (sum(De_Mi_Se_Matrix(:,1)>180) || sum(De_Mi_Se_Matrix(:,1)<-180))
    error("Hours must be between -180 and 180")
end
if (sum(De_Mi_Se_Matrix(:,2)>60))
    error("Minutes must be between 0 and 60")
end
if (sum(De_Mi_Se_Matrix(:,2)>60))
    error("Seconds must be between 0 and 60")
end

% computations

[row, ~] = size(De_Mi_Se_Matrix);

vectorOfDecDeg = zeros(1,row);

for i_DMS = 1:row

    De_Mi_Se = De_Mi_Se_Matrix(i_DMS,:);

    hour = De_Mi_Se(1);
    minutes = De_Mi_Se(2);
    seconds = De_Mi_Se(3);

    DecDeg = (abs(hour)) + (minutes/60) + (seconds/3600);

    if(hour<0)
        DecDeg = DecDeg*-1;
    end

    vectorOfDecDeg(i_DMS) = DecDeg;

end
end

