%% DecDeg_To_De_Mi_Se
% Discription:
% Converts decimal degrees to degrees,minutes,seconds
% usage:
% [De_Mi_Se_Matrix] = DecDeg_To_De_Mi_Se(vectorOfDecDeg)
% input:
% vectorOfDecDeg <= Vector of decimal degrees or a single value
% output:
% [De_Mi_Se_Matrix] <= Matrix for the corresponding Degrees,minutes,seconds
% rows in the matrix are in the same order as input in the vector
% First column <= Degrees
% Second column <= Minutes
% Third column <= Seconds
% external calls:
% none

function [De_Mi_Se_Matrix] = DecDeg_To_De_Mi_Se(vectorOfDecDeg)

% Value checks:

if (~isnumeric(vectorOfDecDeg))
    error("vectorOfDecDeg must be numeric.")
end
if (sum(vectorOfDecDeg>180) || sum(vectorOfDecDeg<-180))
    error("all decimal degrees in vectorOfDecDeg must be '-180>= vectorOfDecDeg =<180'.")
end

[~, column] = size(vectorOfDecDeg);

%Turn column vectors
%Is not needed. Row and Column vectors are treated the same way

% computations

De_Mi_Se_Matrix = zeros(column,3);

for i_vec = 1:column

    DecDeg = vectorOfDecDeg(i_vec);

    hour = fix(DecDeg);
    minutes = fix((abs(DecDeg)-abs(hour))*60);
    seconds = (((abs(DecDeg)-abs(hour))*60)-abs(minutes))*60;

    De_Mi_Se_Matrix(i_vec,:) = [hour,minutes,seconds];

end
end

