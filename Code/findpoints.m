function p=findpoints(xmin,xmax,ymin,ymax,M)
k=1;
for m=1:length(M)
    if M(m,2)>=xmin && M(m,2)<=xmax && M(m,3)>=ymin && M(m,3)<=ymax
        p(k,1:4)=M(m,:);
        k=k+1;
    end
end