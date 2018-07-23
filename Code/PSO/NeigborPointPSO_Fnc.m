function Pop=NeigborPointPSO_Fnc(Surface,Pop,Best_Particle_Length,Particle_Length);
coromozom_length=size(Pop,2);
[row1,col1]=size(Surface);
S(1:row1,1)=[1:row1];
S(1:row1,2:4)=Surface;
Cost_LBest=zeros(1,coromozom_length)+10000;
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
    PointNum=Temp(index(1:coromozom_length),1);
    W=t1(1:coromozom_length);
    W=((10)/(max(W)-min(W))).*(W-min(W));
    Pop_Temp=zeros(1,coromozom_length);
    Pop_Temp(1:Particle_Length(ii))=PointNum(1:Particle_Length(ii));
    Cost_Temp=Cost_Fcn(Surface,Pop_Temp);
    if Cost_Temp<Cost_LBest(Particle_Length(ii))
        LBest(Particle_Length(ii),:)=Pop_Temp;
        Cost_LBest(Particle_Length(ii))=Cost_Temp;
    end  
end
for ii=1:size(Pop,1)
    Length=Particle_Length(ii);
    Pop(ii,:)=LBest(Length,:);
end

    










    
    
    
    