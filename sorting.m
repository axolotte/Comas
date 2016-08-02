 #sort the point according to their distance to R

function [Sorted, Index] = sorting(Euclidic, Points)

  #[Sorted, Index] = sort(Euclidic)
   
   newMatrix = [Euclidic Points];
   
   [temp, Index] = sortrows(newMatrix);
   
   Sorted = temp(:,1);
   
endfunction