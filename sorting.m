 #sort tEhe point according to their distance to R
 #does not take into account points with same distance 
function [Sorted, Index] = sorting(Euclidic, Points)
 
   [Sorted, Index] = sort(Euclidic);
   
   n = size(Sorted,1);
   
   for i=1:n
    if Sorted(i,1) == Sorted(i+1,1)
      a = Points(i,1);
      b = Points(i+1,1);
      
      if a>b
        #change values in eucldic
        temp = Euclidic(i,1);
        Euclidic(i,1) = Euclidic(i+1,1);
        Euclidic(i+1,1) = temp;
        
        #change values in Index
        temp = Index(i,1);
        Index(i,1) = Index(i+1,1);
        Index(i+1,1) = temp;
        
        #change values in Points
        temp = Points(i,1:2);
        Points(i,1:2) = Points(i+1,1:2);
        Points(i+1,1:2) = temp;
        
      endif
        
    endif 
    
   endfor
endfunction