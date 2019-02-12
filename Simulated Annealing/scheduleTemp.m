function [finalTemp] = scheduleTemp(t)
    % annealing schedule temperature
    finalTemp = power(2,(-((t/10000)+0.000000001)));
    if(finalTemp<0.00001)
        finalTemp=0;
    end
end
