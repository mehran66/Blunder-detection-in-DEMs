function [blunder,patch]=singleblngen(bln,no_points,patch,delta_z,M)
for b=1:no_points
    for p=1:length(patch)
        for L=1:length(patch(p).A)
            if patch(p).A(L,1)==bln(1,b)
                patch(p).A(L,4)=patch(p).A(L,4)+delta_z;
            end
        end
    end
end
for i=1:no_points
    blunder(i,1:4)=M(bln(1,i),:);
end
blunder(:,4)=blunder(:,4)+delta_z;