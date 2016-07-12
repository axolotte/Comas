function [Clusters, Average] = MDAV(Points, k)
##Micoraggregation algorithm, resembling MDAV
##makes clusters of k, using the euclidean distance

debug_on_warning(1);
debug_on_error(1);
  
  Euclidic = euclidean(Points);
  [Sorted, IndexList] = sorting(Euclidic);
  
  
  #number of elements in Points
  n= rows(Sorted);
 
  #running index, +k in the end of every iteration, as it indices the next k elements
  i = 1;
  #index for Clusters to save the cluster, counted up +1
  x=1;
  pointer=1;
 
  while n >=(2*k)
  
    kEntrys = IndexList(pointer:pointer+k-1,1);
    
    for j=1:k

      C(j,:) = Points(kEntrys(j),:)
     
    endfor
    pointer = pointer+k;

    Clusters{x}= C
    x++;
    C=[];
    n=n-k;
  endwhile
  
 #if less than 2k elements are left, but them in one cluster
     kEntrys = IndexList(pointer:end,1);
     
     f = rows(Points)-pointer+1;
     
    for j=1:f

      C(j,:) = Points(kEntrys(j),:);
     
    endfor
    
  Clusters{x} =  C
  
  draw_Clusters(Clusters);
  Average = calc_average(Clusters);

endfunction



 