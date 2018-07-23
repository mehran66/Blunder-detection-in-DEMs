function NewPop=NewPopbee_Fnc(Surface,Pop,N,NumberOfPoint)
coromozom_length=size(Pop,2);
[row1,col1]=size(Surface);
S(1:row1,1)=[1:row1];
S(1:row1,2:4)=Surface;
W2(NumberOfPoint)=0;
for ii=1:size(Pop,1)
     Temp=[];
     A=[];
     Temp=S;
     Temp1=Pop(ii,:);
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
    PointNum(ii,:)=Temp(index(1:N),1);
    W1=t1(1:N);
    W1=((100)/(max(W1)-min(W1))).*(W1-min(W1));
    
    for kk=1:N
        W2(PointNum(ii,kk))=W2(PointNum(ii,kk))+W1(kk);
    end               
end
[W2 Index]=sort(W2,'descend'); 
NewPop(size(Pop,1),coromozom_length)=0;
jj=1;
kk=1;
for ii=1:size(Pop,1)-1
    NewPop(ii,1:jj)=Index(kk:jj);
    jj=jj+1;
    if jj>coromozom_length
        kk=kk+1;
        jj=kk;
    end
end

T=[NewPop;Pop];
Cost=Cost_Fcn(Surface,T);
[Cost Index]=sort(Cost);
T=T(Index,:);
NewPop=T(1:size(Pop,1),:);
    
    
    
    