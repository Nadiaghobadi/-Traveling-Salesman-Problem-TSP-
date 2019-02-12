function crosspop=crossover(crosspop,pop,nvar,distance,ncross)

po_size=size(pop,1);

for n=1:2:ncross
    
i1=randi([1,po_size]);
i2=randi([1,po_size]);


p1=pop(i1).var;
p2=pop(i2).var;

j=randi([1 nvar-1]);

o1=[p1(1:j) p2(j+1:end)];
o2=[p2(1:j) p1(j+1:end)];

o1=unique([o1 randperm(nvar)],'stable');        %tekrario hazf mikone
o2=unique([o2 randperm(nvar)],'stable');
 
crosspop(n).var=o1;
crosspop(n).fit=fitness(o1,distance,nvar);

crosspop(n+1).var=o2;
crosspop(n+1).fit=fitness(o2,distance,nvar);


end
end