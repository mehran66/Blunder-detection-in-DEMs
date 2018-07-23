function [Blunder]=PSO_Fnc(Patch,SwarmSize,MaxIteration,ChromLength)
Surface=Patch(:,2:4);
NumberOfPoint=size(Surface,1);
%% Algoritm Parameters
% SwarmSize = 10;
% MaxIteration = 10 ;
% ChromLength=10;
%% Initial Population
Pop(SwarmSize,ChromLength)=0;
Particle_Length(1:SwarmSize)=randi([1,ChromLength],1,SwarmSize);
for ii=1:SwarmSize
    temp=[];
    temp=randi([1,NumberOfPoint],1,Particle_Length(ii));
    Pop(ii,1:Particle_Length(ii))=temp;
end
Cost=Cost_Fcn(Surface,Pop);
[Cost Index]=sort(Cost);
GBest=Pop(1,:);
GBest_Cost=Cost_Fcn(Surface,Pop(1,:));
Particle_Length=Particle_Length(Index);
Best_Particle_Length=Particle_Length(1);
%% Loop
Iter=1;
while Iter<MaxIteration
    Pop=NeigborPointPSO_Fnc(Surface,Pop,Best_Particle_Length,Particle_Length);
    Cost=Cost_Fcn(Surface,Pop);
    [Cost Index]=sort(Cost);
     Pop=Pop(Index,:);
     Particle_Length=Particle_Length(Index);
     if Cost(1)<GBest_Cost
         GBest=Pop(1,:);
         GBest_Cost=Cost(1);
         Best_Particle_Length=Particle_Length(1);
     end
     for ii=1:size(Pop,1)
         if Particle_Length(ii)<Best_Particle_Length
             Particle_Length(ii)= Particle_Length(ii)+1;
         elseif Particle_Length(ii)>Best_Particle_Length
             Particle_Length(ii)= Particle_Length(ii)-1;
         end
     end
     if length(unique(Particle_Length))==1
         break;
     end
         
    Iter=Iter+1;
end
corom_zero=zeros(1,ChromLength);
Cost_corom_zero=Cost_Fcn(Surface,corom_zero);
if Cost_corom_zero<GBest_Cost
    GBest=corom_zero;
end

mgh=sort(unique(GBest));
Blunder=Patch(mgh(2:end));
