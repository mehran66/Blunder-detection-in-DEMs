function CrossOver= CrossOver_Fnc(SelectedIndexes,Pop)
    if rem(length(SelectedIndexes),2)~=0
        SelectedIndexes=SelectedIndexes(1:end-1);
    end
    CrossPoint=floor(size(Pop,2));
    for ii=1:2:length(SelectedIndexes)-1
        temp1=Pop(SelectedIndexes(ii),:);
        temp2=Pop(SelectedIndexes(ii+1),:);
        temp3=[temp1(1:CrossPoint),temp2(CrossPoint+1:end)];
        temp3=unique(temp3);
        temp4=size(Pop,2)-size(temp3,2);
        temp3=[temp3,zeros(1,temp4)];
        CrossOver(ii,:)=temp3;
        
        temp5=[temp2(1:CrossPoint),temp1(CrossPoint+1:end)];
        temp5=unique(temp5);
        temp6=size(Pop,2)-size(temp5,2);
        temp6=[temp5,zeros(1,temp6)];
        CrossOver(ii+1,:)=temp6;
    end
        
   