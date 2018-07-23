function [Current_Point,Temperature]=NeigborPointSA_Fnc(Surface,Current_Point,NumberOfPoint,Temperature,CoolingRate)
coromozom_length=size(Current_Point,2);
[row1,col1]=size(Surface);
S(1:row1,1)=[1:row1];
S(1:row1,2:4)=Surface;
W2(NumberOfPoint)=0;
for ii=1:size(Current_Point,1)
     Temp=[];
     A=[];
     Temp=S;
     Temp1=Current_Point(ii,:);
     Temp1(find(Temp1==0))=[];
     Temp(Temp1,:)=[];
     [row2,col2]=size(Temp);
     mm=mean(Temp(:,2));
     nn=mean(Temp(:,3));
     for jj=1:row2
         A(jj,:)=[100 Temp(jj,2)-mm Temp(jj,3)-nn (Temp(jj,2)-mm)*(Temp(jj,3)-nn)/1000];
     end
    Parameters=inv(A'*A)*A'*Temp(:,4);
    V=abs(Temp(:,4)-(A*Parameters));
    [t1 index]=sort(V,'descend');
    PointNum(ii,:)=Temp(index(1:30),1);
    W1=t1(1:30);
    W1=((100)/(max(W1)-min(W1))).*(W1-min(W1));
    
    for kk=1:coromozom_length
        W2(PointNum(ii,kk))=W2(PointNum(ii,kk))+W1(kk);
    end               
end


[W2 Index]=sort(W2,'descend'); 
NewPop(20,coromozom_length)=0;
jj=1;
kk=1;
for ii=1:19
    t=length(kk:jj);
    NewPop(ii,1:t)=Index(kk:jj);
    jj=jj+1;
    if jj>coromozom_length
        kk=kk+1;
        jj=kk;
    end
end

Rand=randperm(20);
for ii=1:20
    Current_Cost=Cost_Fcn(Surface,Current_Point);
    Neighbor_Cost=Cost_Fcn(Surface,NewPop(Rand(ii),:));
    if Neighbor_Cost<Current_Cost
        Current_Point=NewPop(Rand(ii),:);
        Temperature=Temperature*CoolingRate;
        break;
    elseif exp(-(Current_Cost-Neighbor_Cost)/Temperature) > random('uniform',0,1)
        Current_Point=NewPop(Rand(ii),:);
        Temperature =Temperature*CoolingRate;
        break;
    end
    if ii==20
        Current_Cost=0;
    end
end
    
    





    
    
    
    