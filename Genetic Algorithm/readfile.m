function [data,position] = readfile(fileAddress)
    fid = fopen(fileAddress);
    str = fscanf(fid,'%s',21);  %ignore first 21 strings
    data=zeros(29,29);
    position=zeros(29,3);
    a=fscanf(fid,'%d');
    s=1;
    for i=1:29
        for j=1:29
            data(i,j)=a(s);
            s=s+1;
        end
    end
    str = fscanf(fid,'%s',1);
    b =fscanf(fid,'%f');
    t=1;
    for i=1:29
        for j=1:3    
            position(i,j)=b(t);
            t=t+1;
        end
    end
    position=position(:,2:3);   
end