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
draw_Clusters(clusterContainer, [0 0]);
endfunction