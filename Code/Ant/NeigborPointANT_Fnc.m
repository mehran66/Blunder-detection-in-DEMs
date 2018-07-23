function [Pop Pheromone]=NeigborPoint_Fnc(Surface,Pop,Ant_Length,Pheromone,Alfa,Beta)
coromozom_length=size(Pop,2);
[row1,col1]=size(Surface);
S(1:row1,1)=[1:row1];
S(1:row1,2:4)=Surface;

for ii=2:size(Pop,1)
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
    Tabu=zeros(coromozom_length,1);
    for kk=1:coromozom_length
        Points_Pheromone_W(kk)=(Pheromone(PointNum(kk)))^Alfa+(W(kk))^Beta;
    end
        
    for hh=1:Ant_Length(ii)
        Rand=rand;
        temp=Points_Pheromone_W;
        if Rand<=0.5
            for tt=1:coromozom_length
                [ll,lp]=max(temp);
                if Tabu(lp)==0
                    Pop(ii,hh)=PointNum(lp);
                    Pheromone(PointNum(lp))=Pheromone(PointNum(lp))+W(lp);
                    Tabu(lp)=1;
                   temp(lp)=-1;
                   Points_Pheromone_W(lp)=-1;
                   break;
                end
            end
        else
           temp2=temp./sum(temp);
           for pp=2:length(temp2)
               temp2(pp)=temp2(pp)+temp2(pp-1);
           end
           Rand2=rand;
           for pp=1:length(temp2)
               if temp2(pp)>Rand2 & Tabu(pp)==0
                        Pop(ii,hh)=PointNum(pp);
                        Pheromone(PointNum(pp))=Pheromone(PointNum(pp))+W(pp);
                        Tabu(pp)=1;
                        temp(pp)=-1;
                        Points_Pheromone_W(pp)=-1;
                        break;
                   end
               end
           end
        end
    end                     
end










    
    
    
    