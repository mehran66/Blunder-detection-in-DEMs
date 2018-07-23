function [Blunder]=SA_Fnc(Patch,Temperature,CoolingRate,MaximumIteration,ChromLength)

Surface=Patch(:,2:4);
%% Algoritm Parameters
% Temperature =2000;
% CoolingRate = .1;
% MaximumIteration=100;
% ChromLength=10;
NumberOfPoint=length(Patch);
%% Initial Population
Current_Point=randi([1,NumberOfPoint],1,ChromLength);
Current_Cost=Cost_Fcn(Surface,Current_Point);
Best_Cost=Current_Cost;
Best_Point=Current_Point;
Iter=1;
while Iter~=MaximumIteration || Temperature <= 0
    [Temp,Temperature]=NeigborPointSA_Fnc(Surface,Current_Point,NumberOfPoint,Temperature,CoolingRate);
    
    Current_Cost=Cost_Fcn(Surface,Current_Point);
    if Current_Cost<Best_Cost
        Best_Point=Current_Point;
        Best_Cost=Current_Cost;
    end
    
    if length(Temp)==1
        k=0;
         break;
    end
    Current_Point=Temp;
    Iter=Iter+1;
end
mgh=sort(unique(Best_Point));
Blunder=Patch(mgh(2:end),1);