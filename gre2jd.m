%% gre2jd
% Discription:
% Converts Gregorian calendar date in
% year, month, day, hour, minute and second
% usage:
% [jd,mjd] = gre2jd(yyyy,mm,dd,hour,minute,second)
% input:
% yyyy = Gregorian calender years
% mm = Gregorian calender month
% dd = Gregorian calender days
% hour = Gregorian calender hours
% minute = Gregorian calender minutes
% second = Gregorian calenderseconds
% output:
% jd = Julian Date
% mjd = Modified Julian Date
% external calls:
% none
% Author: Dr. Robert Heinkelmann

function[jd,mjd] = gre2jd(yyyy,mm,dd,hour,minute,second)

% Value checks:

if (~isnumeric(yyyy))
    error("yyyy are not numeric")
end
if (~isnumeric(mm))
    error("mm are not numeric")
end
if (~isnumeric(dd))
    error("dd are not numeric")
end
if (~isnumeric(hour))
    error("hour are not numeric")
end
if (~isnumeric(minute))
    error("minute are not numeric")
end
if (~isnumeric(second))
    error("second are not numeric")
end


if (mm<1 || mm>12)
    error("month must be a number between 1 and 12")
end
if (dd<1 || dd>31)
    error("Day must be a number between 1 and 12")
end
if (hour<0 || hour>23)
    error("Hour must be a number between 1 and 12")
end
if (minute<0 || minute>59)
    error("Minute must be a number between 1 and 12")
end
if (second<0 || second>=60)
    error("Second must be a number between 1 and 12")
end

% computations

fd= hour./24 + minute./1440 + second./86400;
my = fix((mm-14)./12);
jd= fix((1461.*(yyyy+ 4800 + my))./4) + ...
fix((367.*((mm-2)-(12.*my)))./12) -...
fix((3.*((yyyy+ 4900 +my)./100))./4) + ...
dd-32075.5 + fd;
mjd= jd-2400000.5;

end


