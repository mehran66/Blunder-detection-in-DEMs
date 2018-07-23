function [failed,extra]=compare(blunder,solution)
failed=0;extra=0;
    for i=1:length(blunder)
       a=find(solution==blunder(i));
       if isempty(a)
           failed=failed+1;
       end
    end
    for j=1:length(solution)
       b=find(blunder==solution(j));
       if isempty(b)
           extra=extra+1;
       end
    end