function SelectedIndexes=SelectParents_Fcn(Cost,CrossNum)
    PopSize=numel(Cost);
    for ii=1:CrossNum
        R= randperm(PopSize);
        SI=R(1:4);
        CostSI=Cost(SI);
        F=find(CostSI==min(CostSI));F=F(1);
        SelectedIndexes(ii)=SI(F);
    end
    

