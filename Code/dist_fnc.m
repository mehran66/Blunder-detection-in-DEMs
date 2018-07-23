function distmat=dist_fnc(x,y,X,Y)
if length(X)==length(Y)
for i=1:length(X)
    distmat(i,1)=sqrt((x-X(i))^2+(y-Y(i))^2);
end
end
