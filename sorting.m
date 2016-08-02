 #sort the point according to their distance to R

function [Sorted, Index] = sorting(Euclidic, Points)
 
  [Sorted, Index] = sort(Euclidic);
   
   newMatrix = [Sorted Index];
   
   temp = sortrows(newMatrix);
   
   Sorted = temp(:,1);
   Index = temp(:,2);
endfunction