function j=RouletteWheel(P)
P=P./sum(P);    %normalsazi
P=cumsum(P);     
j=find(rand<=P,1,'first');
end