function [Blunder]=TS_Fnc(Patch,MaximumIteration,ChromLength)
Surface=Patch(:,2:4);
%% Algoritm Parameters
% Tabutenure =10;
% MaximumIteration=1000;
% ChromLength=10;
NumberOfPoint=length(Patch);
%% Initial Population
Current_Point=randi([1,NumberOfPoint],1,ChromLength);
Current_Cost=Cost_Fcn(Surface,Current_Point);
Best_Cost=Current_Cost;
Best_Point=Current_Point;
Iter=1;
while Iter~=MaximumIteration    
    [Temp]=NeigborPoint_Fnc(Surface,Current_Point,NumberOfPoint);
    Current_Point=Temp;
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