function [Blunder]=GA_Fnc(Patch,PopSize,ChromLength,KeepPercent,MutatPercent,MaximumIteration)

Surface=Patch(:,2:4);
%%  Algoritm Parameters
KeepPercent=KeepPercent/100;MutatPercent=MutatPercent/100;
CrossPercent = 1 - KeepPercent - MutatPercent;
KeepNum = round(KeepPercent * PopSize);
NewPopNum = KeepNum;
CrossNum = round(CrossPercent * PopSize);
MutatNum = PopSize - KeepNum - CrossNum;
NumberOfPoint=length(Patch);
%% Initial Population
temp=randi([1,NumberOfPoint],1,PopSize*ChromLength);
jj=1;
for ii=1:PopSize
   Pop(ii,:)=temp(jj:jj+ChromLength-1);
   jj=jj+ChromLength;
end 
Cost=Cost_Fcn(Surface,Pop);
[Cost Index]=sort(Cost);
Pop=Pop(Index,:);
Iter=1;
%% Loop
for Iter=1:MaximumIteration

% Elite
     Elite=Pop(1:KeepNum,:);
% New Pop
     rand1=randi([1,PopSize],1,NewPopNum);
     NewPop=NewPop_Fnc(Surface,Pop(rand1,:));
% Cross Over
      SelectedIndexes=SelectParents_Fcn(Cost,CrossNum);
      CrossOver= CrossOver_Fnc(SelectedIndexes,Pop);
% Mutation
    rand2=randi([1,PopSize],1,MutatNum);
    for ii=1:MutatNum
        temp=[];
        temp=Pop(rand2(ii),:);
        rand3=randperm(ChromLength);
        rand4=rand3(1:floor(ChromLength/2));
        temp(rand4)=0;
        Mutatation(ii,:)=temp;
    end
% Reproduction
        temp=[];
        temp=randi([1,NumberOfPoint],1,PopSize*ChromLength);
        jj=1;
        for ii=1:PopSize
           Reproduction(ii,:)=temp(jj:jj+ChromLength-1);
           jj=jj+ChromLength;
        end    
%Final parts
        FinalPop=[Elite;NewPop;CrossOver;Mutatation;Reproduction];
        Cost_temp=Cost_Fcn(Surface,FinalPop);
        [Cost_temp Index]=sort(Cost_temp);
        FinalPop=FinalPop(Index,:);
        
        Pop=FinalPop(1:PopSize,:);
        Cost=Cost_temp(1:PopSize);
        
        Iter=Iter+1;
end    
    
mgh=unique(Pop(1,:));
Blunder=Patch(mgh(2:end),1);

 
