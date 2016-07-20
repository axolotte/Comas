 #sort tEhe point according to their distance to R

function [Sorted, Index] = sorting(Euclidic, Points)
 
   [Sorted, Index] = sort(Euclidic);
   
   n = size(Sorted,1);
   
   for i=1:n-1
    
    if (Sorted(i,1) == Sorted(i+1,1))
      a = Points(Index(i),1);
      b = Points(Index(i+1),1);
      
      if a>b
        
        #change values in Index
        temp = Index(i,1);
        Index(i,1) = Index(i+1,1);
        Index(i+1,1) = temp;
        
      endif
        
    endif 
    
   endfor
endfunction