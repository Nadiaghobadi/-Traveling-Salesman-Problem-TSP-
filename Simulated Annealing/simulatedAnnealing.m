% search the state space to find a good solution
clear;
clc;
%reading data
data = readFile('bayg29.tsp');
% initialize a solution
s = initialState();
%make a loop to search for answer
k=0;
t = scheduleTemp(k);
while (t>0)
    % what should be the input of the scheduleTemp?
    % it should be a function of k and k_max
    
    % pick a random neighbour
    s_new = getNeighbours(s);
    if acceptanceProbability(energy(s, data),energy(s_new, data),t) < rand(1)
        % move to new state
        s = s_new;
        % how should we do that?
    end
    k = k+1;
    t = scheduleTemp(k);
    %display(t);
end
Energy = energy(s, data);
display(Energy);
display(s);
% plot something if you need more points!!
