function sol=fitness(sol,distance,nvar)
x=sol.var;
x=[x x(1)];
answer=0;
for i=1:nvar
    answer=answer+distance(x(i),x(i+1));
end
sol.fit=answer;
end
