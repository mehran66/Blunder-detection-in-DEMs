function res=residual_fnc(surface,pop,parameters,mm,nn)
for i=1:size(pop,1)
    for j=1:size(pop,2)
        A=[100 surface(pop(i,j),1)-mm(i) surface(pop(i,j),2)-nn(i) (surface(pop(i,j),1)-mm(i))*(surface(pop(i,j),2)-nn(i))/1000];
        res(i,j)=A*(parameters(i,:))';
    end
end