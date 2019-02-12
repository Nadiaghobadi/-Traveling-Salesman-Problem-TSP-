function [data] = readFile(fileAddress)
    fileopen = fopen(fileAddress);
    st = fscanf(fileopen,'%s',21);
    answer = [];
    data=zeros(29,29);
    for i=1:29
       %read 29 digit
       a = fscanf(fileopen,'%d',29-i);
       %baghiasho 0 mizare
       b = zeros(i-1,1);
       a = cat(1,a,b);
       answer = [answer,a];
    end
    
    for i=1:28
        for j=1:29
            data(j,i) = answer(i,j);
        end
    end
    %jaye satro sotuno avaz mikonim
    for i=1:29
        for j=1:29-i
            data(29-j,29-i)=data(i,j);
        end
    end
    %display(data); 
end