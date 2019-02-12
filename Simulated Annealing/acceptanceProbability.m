function [probValue] = acceptanceProbability(energy_s,energy_s_new,t)
    
    probValue = exp((energy_s_new - energy_s) / t );
end