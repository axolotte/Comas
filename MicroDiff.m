##microaggregates first and then mask the values with differential privacy
##@param k: clustersize
##@param eps: epsilon
##@param file: filename
##@param column1,column2: attribute columns
##returns DB: masked Database
##PT: the original table
##IndexList: list of the indices in the sorted order 
##Clusters: cell array containing the Clusters
function [Masked,OriginValues,Clusters,Average] = MicroDiff(k,eps, file, column1, column2)

debug_on_warning(1);
debug_on_error(1);

  Points = input(column1, column2, file);
  [Clusters,Average,OriginValues] = generalMicroAgg(Points,k);
 
  
  Masked= diff_Private(Clusters,Average,k,eps);
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
  
  draw_Clusters(Clusters,R);
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

function [clusterContainer, Average, originalValues] = generalMicroAgg(Points, k)

R1 = [ 0 0];
R2 = [100 80];
R3 = [100 0];
R4=[0 80];
originalValues = [];
clusterContainer = {};

while size(Points,1)>=2*k
#---cluster for reference Point 1-----

  if size(Points,1)>=2*k
    
      eucl = euclidean(Points,R1);
      [Sorted, Index] = sorting (eucl, Points);
      
      for i=1:k
        cluster(i,1:2) = Points(Index(i),:);
        originalValues = [originalValues ; Points(Index(i),:)];
      endfor
      Points(Index(1:k),:) = [];
      clusterContainer{end+1} = cluster;
      cluster = [];
  endif
#-----cluster around R2  
 
  if size(Points,1)>=2*k
    
      eucl = euclidean(Points,R2);
      [Sorted, Index] = sorting (eucl, Points);
      
      for i=1:k
        cluster(i,1:2) = Points(Index(i),:);
        originalValues = [originalValues ; Points(Index(i),:)];
      endfor
      Points(Index(1:k),:) = [];
      clusterContainer{end+1} = cluster;
      cluster = [];
  endif
 #-----cluster around R3 
 
 if size(Points,1)>=2*k
    
      eucl = euclidean(Points,R3);
      [Sorted, Index] = sorting (eucl, Points);
      
      for i=1:k
        cluster(i,1:2) = Points(Index(i),:);
        originalValues = [originalValues ; Points(Index(i),:)];
      endfor
      Points(Index(1:k),:) = [];
      clusterContainer{end+1} = cluster;
      cluster = [];
  endif
  
 #-----cluster around R4
 if size(Points,1)>=2*k
    
      eucl = euclidean(Points,R4);
      [Sorted, Index] = sorting (eucl, Points);
      
      for i=1:k
        cluster(i,1:2) = Points(Index(i),:);
        originalValues = [originalValues ; Points(Index(i),:)];
      endfor
      Points(Index(1:k),:) = [];
      clusterContainer{end+1} = cluster;
      cluster = [];
  endif

endwhile



#----cluster remaining points
s = size(Points,1);
for i=1:s
 cluster(i,1:2) = Points(i,:);
originalValues = [originalValues ; Points(i,:)];
endfor
clusterContainer{end+1} = cluster;

Average = calc_average(clusterContainer);

endfunction
