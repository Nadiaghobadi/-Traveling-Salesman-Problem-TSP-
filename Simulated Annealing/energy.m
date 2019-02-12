function [output] = energy(s, data)
   S = 0;
	 for i=1 : 28
		S = S+data ( s(i)  ,  s(i+1) );
		end
    output = S;
end