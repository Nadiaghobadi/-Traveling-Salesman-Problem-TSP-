function [neighbourState] = getNeighbours(s)

    x=rem(floor(29*rand(1)),29)+1; 
	y=rem(floor(29*rand(1)),29)+1;
    
    if x==y
		y=rem((x) ,29)+1;
    end
	a = zeros(1,29);
	for i=1 : 29
	   if i==x
			a(i)=s(y);
         else if i==y
                a(i)=s(x);
             else
                a(i)=s(i);
             end
       end
	end
    neighbourState = a;
    % find the neighbour state of the current state
    
end