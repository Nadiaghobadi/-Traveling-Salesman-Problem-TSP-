[distance,pos] = readfile('bays29.tsp');
 display(distance);
 display(pos);
w = zeros(29,2);
for j1=1:29
    for j2=1:2
        w(j1,j2)=rand()*2000+100;
    end
end
figure(1)
x=pos(:,1);
y=pos(:,2);
plot(x,y,'.b')
hold on
xx=w(:,1);
yy=w(:,2);
plot(xx,yy,'or')
plot(yy,xx,'b',xx,yy,'b*');

hold off
title('t=0');
drawnow
no=1;
do=5;
epoc=1000;
t=1;
while (t<=epoc)
    j1star=1;
    n=no*(1-t/epoc);
    for i=1:29
        min=999999;
        for j=1:29
        distance=(pos(i,1)-w(j,1)).^2+(pos(i,2)-w(j,2)).^2;
        if distance<min
            min=distance;
            j1star=j;
        end
        end
        %update the winning neuron
        w(j1star,:)=w(j1star,:)+n*(pos(i,:)- w(j1star,:));
        %update the neighbour neurons
        
    end
    t=t+1;
    figure(1)
    x=pos(:,1);
    y=pos(:,2);
    plot(x,y,'.b')
    hold on
    xx=w(:,1);
    yy=w(:,2);
    plot(xx,yy,'or')
    plot(yy,xx,'b',xx,yy,'b*');
    hold off
    title(['t=' num2str(t)]);
    drawnow
end