
function mutpop=mutation(mutpop,pop,nvar,distance,n_mut)
popsize=size(pop,1);
for n=1:n_mut
    
i=randi([1 popsize]); 
p=pop(i).var;
j1=randi([1 nvar-1]);
j2=randi([j1+1,nvar]);

nj1=p(j1);
nj2=p(j2);

p(j1)=nj2;
p(j2)=nj1;
mutpop(n).var=p;
mutpop(n).fit=fitness(p,distance,nvar);
end
end