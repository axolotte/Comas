#information loss metric for MDAV
#@param clusterContainer: contains the cluster, but not masked values
#@param Average: contains the average value for each cluster
#returns Sum: the Sum of Squared Errors

function  Sum = infoLoss_MDAV(clusterContainer, Average)


    Sum = 0;
    rows = size(clusterContainer,2);
    
    for i=1:rows  
      originCluster = clusterContainer{i};
      k = size(originCluster,1);
      for j=1:k
        dist1 = sqrt((originCluster(i,1)-Average(i,1))*(originCluster(i,1)-Average(i,1)));
        dist2 = sqrt((originCluster(i,2)-Average(i,2)*(originCluster(i,2)-Average(i,2)));
      Sum= Sum+dist1+dist2;
    endfor
    
endfunction