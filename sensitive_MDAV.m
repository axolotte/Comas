function sensitive_MDAV(k, file, a, b)

##Micoraggregation algorithm MDAV
##makes clusters of k, using the euclidean distance

debug_on_warning(1);
debug_on_error(1);

  X = input(a,b,file);

  #number of elements in X
  sizeX = size (X,1);
  clusterContainer = {};
 
  while sizeX >=(3*k)
    
    #get the average recored of X
    averageX = calc_average(X);
    
    #calculate from each point in X to averageX
    
    distancesToX = euclidean(X,averageX);
    #get max. distant point to averageX
    temp = max(distancesToX);
    x1 = X(temp,:);
    
    #calculate distances to x1
    distancesToX1 = euclidean(X,x1);
    
    #get max. distant point to x1
    temp = max(distancesToX1);
    x2 = X(temp,:);
    
    #sort the points in distancesToX1, so we can cluster the closest records to x1
    [sortedToX1,IndexX1] = sorting(distancesToX1, X);
    #cluster the first k entrys and remove them from X
     for i=1:k
        cluster(i,:)  =  X(IndexX1(i),:);
        
        X(IndexX1(i),:) = [];
        IndexX1(i) = [];
     endfor
     
     clusterContainer{end+1} = cluster;
    
    #sort the points in distancesToX@, so we can cluster the closest records to x2
    [sortedToX2,IndexX2] = sorting(distancesToX2, X);
    #cluster the first k entrys and remove them from X
      for j=1:k
        cluster (j, :)= [clusters;X(IndexX2(j),:)];
        
        X(IndexX2(j),:) = [];
        IndexX2(j) = [];
      endfor
      
      clusterContainer{end+1} = cluster;
      
   sizeX = size (X,1);
   endwhile
   
   if sizeX >= 2*k
    #get the average recored of X
    averageX = calc_average(X);
    
    #calculate from each point in X to averageX
    
    distancesToX = euclidean(X,averageX);
    #get max. distant point to averageX
    temp = max(distancesToX);
    maxX = X(temp,:);
    
    #calculate distances to x1
    distancesToMaxX = euclidean(X,maxX);
    
     #sort the points in distancesToX1, so we can cluster the closest records to x1
    [sortedToMaxX,IndexMaxX] = sorting(distancesToMaxX, X);
    #cluster the first k entrys and remove them from X
    for i=1:k
        cluster(i,:) = X(IndexMaxX(i),:);
        X(IndexMaxX(i),:) = [];
        IndexMaxX(i) = [];
    endfor
     clusterContainer{end+1} = cluster;
   endif
   
   #cluster remaining records
   
   for i=1:numel(IndexX1)
        cluster(i,:) = X(i,:);
        X(i,:) = [];
    endfor
   clusterContainer{end+1} = cluster;
   
endfunction

#calculates the average record for dataset X
function averageX = calc_average(X)

  recordsX=size(X,1);

  for i=1:recordsX
    
    meanAge = mean(X(1:end,1));
    meanHours = mean(X(1:end, 2));

  endfor
  averageX = [mean Age , meanHours];
endfunction