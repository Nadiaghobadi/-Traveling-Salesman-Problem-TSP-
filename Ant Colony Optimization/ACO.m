[distance,position] = readfile('bays29.tsp');
nvar=29;
n_ant=20;         %tedade murcheha
epoc=100;      

Q=100;            %zaribe tabdile fitness be pheromone
alpha=2;          %zaribe bozorgnamaiie pheromone
beta=1;           %zaribe bozorgnamaiie hueristic 
Roh=0.02;         %zaribe tabkhire pheromone

p0=1;     %mizane pheromone avalie
p=p0*ones(nvar,nvar);  %phromone matrix
p=p-diag(diag(p));    %ghotre asli bayad 0 bashe tu amtrise pheromone

etha=1./distance;               %hueristic information matrix-etha harchi bishtar bashe behtare vali distance harchi kamtar bashe behtare!
etha=etha-diag(diag(etha));     %ghotre aslie matrixe hueristic 0

U=reshape(1:nvar*nvar,nvar,nvar);   %shomare harkat mide bemun,harkat az har shahr be shahre dge moadele yek shomare

emp.var=[];
emp.fit=10000;

ant=repmat(emp,n_ant,1); %population
global_ant=emp;          

best=zeros(epoc,1);
for iter=1:epoc
    for k=1:n_ant
        
        route=randi([1 nvar]);  %shahre mabda be tasadof
        U_route=zeros(1,nvar);
        
        for v=2:nvar
            i=route(end);       %akharin shahri k tush budim
            P=(p(i,:).^alpha).*(etha(i,:).^beta);
            P(route)=0;
            j=RouletteWheel(P);     %shahre badi
            [route]=[route j];
            U_route(v-1)=U(i,j);        %harkate shomareye i be j
        end
%display(route);
        ant(k).var=route;
        ant(k)=fitness(ant(k),distance,nvar);
        U_route(nvar)=U(route(end),route(1));
        f=ant(k).fit; 
        delta=Q/f;
        p(U_route)=p(U_route)+delta;    %be harkataye anjam shode pheromone ezafe mishe
    end
    p=p*(1-Roh);        %tabkhire pheromone
    %find global ant
    [value,index]=min([ant.fit]);
    if value<global_ant.fit
        global_ant=ant(index);
    end
     best(iter)=global_ant.fit;
end
display('finalanswer');
display(num2str(global_ant.var));
display('bestfitness')
display(global_ant.fit);
answer=global_ant.var;
pos=zeros(29,2);
for i=1:29
    pos(i,1)=position(answer(i),1);
    pos(i,2)=position(answer(i),2);
end
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