##microaggregates first and then mask the values with differential privacy
##@param k: clustersize
##@param eps: epsilon
##@param file: filename
##@param column1,column2: attribute columns
##returns DB: masked Database
##PT: the original table
##IndexList: list of the indices in the sorted order 
##Clusters: cell array containing the Clusters
function [DB,PT,Indexlist,Clusters] = MicroDiff(k,eps, file, column1, column2)

debug_on_warning(1);
debug_on_error(1);

  PT = input(column1, column2, file);
  [Clusters,A,Indexlist] = microaggregation(PT,k);
 
  
  DB= diff_Private(Clusters,A,k,eps);
endfunction

##Micoraggregation algorithm, resembling MDAV
##makes clusters of k, using the euclidean distance
function [Clusters, Average, IndexList] = microaggregation(Points, k)


  R = [0 0];  
  Euclidic = euclidean(Points,R);
  [Sorted, IndexList] = sorting(Euclidic, Points);
  
  
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

      C(j,:) = Points(kEntrys(j),:);
     
    endfor
    pointer = pointer+k;

    Clusters{x}= C;
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
    
  Clusters{x} =  C;
  
  #draw_Clusters(Clusters,R);
  Average = calc_average(Clusters);

endfunction

#calculates the differential private table
#adds laplace noise to every entry in the micoraggregated database
function [diffDB] = diff_Private(Clusters, Average, k, eps)

  [rows,x]=size(Clusters);

  y=1;
  #iterate through Cluster until the last cluster
    for i=1:(x-1)

      A=Average(i,:);
    
       for j=1:k
   
         rnd_Age = laplace_random(65, eps);
         
         diffAge= A(1,1) + rnd_Age;
         diffHours = A(1,2) + laplace_random(70, eps);
      
         diffDB(y,1)=diffAge;
         diffDB(y,2)=diffHours;
      
         y++;
      endfor  
      
    endfor

  [n,m]=size(Average);
  A=Average(n,:);
  C= Clusters{x};

  rest = size(C,1);

    for l=1:rest
     
      
         diffAge= A(1,1) + laplace_random(100, eps);
         diffHours = A(1,2) + laplace_random(80, eps);
      
         diffDB(y,1)=diffAge;
         diffDB(y,2)=diffHours;
         y++;
      
    endfor
endfunction


