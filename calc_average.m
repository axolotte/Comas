function [Average]=calc_average(Clusters)
  #calculates the means for each attribute for each cluster
  #returns cell array of average values, indices should match 
  #the indices of the "Clusters" cell array, so that Cluster and
  #average values can be matched
  
  [x,y]=size(Clusters);
  
  for i=1:y
    C=Clusters{i};
    meanAge = mean(C(1:end,1));
    meanHours = mean(C(1:end, 2));
    Average{i} = [meanAge,meanHours];
  
  endfor

endfunction



 