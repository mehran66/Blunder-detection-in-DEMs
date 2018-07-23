function Cost=Cost_Fcn(Surface,Pop)
[row1,col1]=size(Surface);
S(1:row1,1)=[1:row1];
S(1:row1,2:4)=Surface;
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
    Cost(ii)=sum(V.^2)/length(V)^10;
end
    
    
    
    