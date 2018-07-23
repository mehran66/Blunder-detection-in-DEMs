function [blunder,patch]=clusterblngen(no_points,patch,delta_z,M,no_group)
blunder=[];
for i=1:no_group
bln=randi([1,length(M)],1,1);
x=M(bln,2);y=M(bln,3);
for R=1:length(patch)
    for C=1:length(patch(R).A)
        if patch(R).A(C,2)==x && patch(R).A(C,3)==y
            patchno=R;
            break;
        end
    end
end
distvec=dist_fnc(x,y,patch(patchno).A(:,2),patch(patchno).A(:,3));
temp=[patch(patchno).A,distvec];
temp=sortrows(temp,5);
volunteer=temp(1:no_points,1:4);
for b=1:no_points
    for L=1:length(patch(patchno).A)
        if patch(patchno).A(L,1)==volunteer(b,1)
            patch(patchno).A(L,4)=M(patch(patchno).A(L,1),4)+delta_z;
        end
    end
end
volunteer(:,4)=volunteer(:,4)+delta_z;
blunder=[blunder;volunteer];
end