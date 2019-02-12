[distance,position] = readfile('bays29.tsp');
% display(distance);
% display(position);
nvar=29;
popsize=100;
epoc=200;
%data=distance, postmat=position
%intial population
prob_co=0.7;       %darsade cross over
n_cross=2*round(popsize*prob_co/2);           %tedade farzandane hasel az cross over 

prob_mu=1-prob_co;
n_mut=round(popsize*prob_mu);

emp.var=[];
emp.fit=inf;

pop=repmat(emp,popsize,1); 

for i=1:popsize
   pop(i).var=randperm(nvar);
%    display(pop(i).var);
   pop(i).fit=fitness(pop(i).var,distance,nvar);
end

[value,index]=min([pop.fit]);
global_pop=pop(index);
% display(global_pop.var);

%main
best=zeros(1,epoc);
for i=1:epoc
    %crossover
    crosspop=repmat(emp,n_cross,1);  %bordare khalio repmat mikone be tedade ncross va 1
    crosspop=crossover(crosspop,pop,nvar,distance,n_cross);
    
    %mutation
    mutpop=repmat(emp,n_mut,1);
    mutpop=mutation(mutpop,pop,nvar,distance,n_mut);

    [pop]=[pop;crosspop;mutpop];
    [value,index]=sort([pop.fit]);
    pop=pop(index);     %pop ra bar asase index moratab kon
    global_pop=pop(1);
    pop=pop(1:popsize);
    
    best(i)=global_pop.fit;
    display('after iteration');
    display(i);
    display(global_pop.var);
    display('fitness is');
    display(best(i));
end

display('final answer');
answer=global_pop.var;
pos=zeros(29,2);
for i=1:29
    pos(i,1)=position(answer(i),1);
    pos(i,2)=position(answer(i),2);
end
display(global_pop.var);
display(global_pop.fit);
x=1:epoc;
figure
plot(x,best(x));
title('Fitness');
figure
x=pos(:,1);
y=pos(:,2);
x1=pos(1,1);
y1=pos(1,2);
plot(x,y,'b',x,y,'b*');
hold on
plot(x,y,'b',x1,y1,'r*');
text(x1,y1,'start');
title('position');