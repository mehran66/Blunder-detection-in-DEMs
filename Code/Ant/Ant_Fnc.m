function [Blunder]=Ant_Fnc(Patch,AntSize,Intial_Pheromone,Evaporation_Rate,MaxIteration,Alfa,Beta,ChromLength)
Surface=Patch(:,2:4);
NumberOfPoint=size(Surface,1);
%% Algoritm Parameters
% AntSize = 10;
% Intial_Pheromone = 1 ;
% Evaporation_Rate = .9;
% MaxIteration = 10 ;
% Num_BestAnt = 5;
% Alfa = 1 ;
% Beta = 1; 
% ChromLength=10;
%% Initial Population
Pop(AntSize,ChromLength)=0;
Ant_Length(1)=0;
Ant_Length(2:AntSize)=randi([1,ChromLength],1,AntSize-1);
for ii=1:AntSize-1
    temp=[];
    temp=randi([1,NumberOfPoint],1,Ant_Length(ii+1));
    Pop(ii+1,1:Ant_Length(ii+1))=temp;
end
Best=Pop(1,:);
Best_Cost=Cost_Fcn(Surface,Pop(1,:));
Pheromone(NumberOfPoint,1)=0;

Pheromone=Pheromone+1;
%% Loop
Iter=1;
while Iter<MaxIteration
    [Pop Pheromone]=NeigborPointANT_Fnc(Surface,Pop,Ant_Length,Pheromone,Alfa,Beta);
    Cost=Cost_Fcn(Surface,Pop);
    [Cost Index]=sort(Cost);
     Pop=Pop(Index,:);
     if Cost(1)<Best_Cost
         Best=Pop(1,:);
         Best_Cost=Cost(1);
     end
     Ant_Length=Ant_Length(Index);
     for ii=1:5
          for jj=1:Ant_Length(ii)
              Pheromone(Pop(ii,jj))=Pheromone(Pop(ii,jj))+10;
          end
     end
    Pheromone=Pheromone*Evaporation_Rate;
    Iter=Iter+1;

    
    
            Pop=zeros(AntSize,ChromLength);
            Ant_Length(1)=0;
            Ant_Length(2:AntSize)=randi([1,ChromLength],1,AntSize-1);
            for ii=1:AntSize-1
                temp=[];
                temp=randi([1,NumberOfPoint],1,Ant_Length(ii+1));
                Pop(ii+1,1:Ant_Length(ii+1))=temp;
            end
end
mgh=sort(unique(Best));
Blunder=Patch(mgh(2:end),1);
