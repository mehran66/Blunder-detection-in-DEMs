function [Blunder]=Bee_Fnc(patch,n,m,e,Ne,Nb,MaximumIteration,ChromLength)

Surface=patch(:,2:4);
%% Algoritm Parameters
% n=50;% Number of bees
% m=15;% best bees
% e=10;% Elite 
b=m-e;% Other best
% Ne=10;% Recruited bees  Around elite
% Nb=10;% Recruited bees Around other best
Sb=n-m;% Scout bees
% MaximumIteration=50;
% ChromLength=10;
NumberOfPoint=length(patch);
%% Initial Population
temp=randi([1,NumberOfPoint],1,n*ChromLength);
jj=1;
for ii=1:n
   Pop(ii,:)=temp(jj:jj+ChromLength-1);
   jj=jj+ChromLength;
end
Cost=Cost_Fcn(Surface,Pop);
[Cost Index]=sort(Cost);
Pop=Pop(Index,:);

for Iter=1:MaximumIteration
    %   Recruit bees for elite site 
        temp=[];
        temp=Pop(1:e,:);
        Elite=NewPopbee_Fnc(Surface,temp,Ne,NumberOfPoint);
    %   Recruit bees for other best 
        temp=[];
        temp=Pop(e+1:e+1+b,:);
        OtherBest=NewPopbee_Fnc(Surface,temp,Nb,NumberOfPoint);
    %   Scout bees
        temp=[];
        temp=randi([1,NumberOfPoint],1,n*ChromLength);
        jj=1;
        for ii=1:Sb
           Scout(ii,:)=temp(jj:jj+ChromLength-1);
           jj=jj+ChromLength;
        end
        
        Pop=[Elite;OtherBest;Scout];
        Cost=Cost_Fcn(Surface,Pop);
        [Cost Index]=sort(Cost);
        Pop=Pop(Index,:);
        
end
mgh=sort(unique(Pop(1,:)));
Blunder=patch(mgh(2:end),1);