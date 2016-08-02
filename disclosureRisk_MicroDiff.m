#{
Disclosure Risk for MicroDiff
@param Origin: Original Dataset
@param Masked: Masked (Clustered and Noise added) dataset
@param IndexList: Contains indices of the values in the masked list, so that we can conclude
the original values
#}
function rl = disclosureRisk_MicroDiff(Origin, Masked, IndexList)

n = size(Origin,1);
sum = 0;

for i=1:n
  x = Masked(i,:);
  pr = recordLinkProb(x,i,Origin, IndexList);
  sum = sum+pr;
endfor

rl = 100*sum/n;
endfunction
#{Calculates the Record Linkage Probability
#}
function pr = recordLinkProb(x,i,Origin, IndexList)
  distancesToX = euclidean(Origin, x);
  [minDis, indexMin] = min(distancesToX);
  G = size(minDis,1);
  originalValueX = Origin(IndexList(i),:);
  minOriginValues = Origin(indexMin,:);
  
  if ismember(originalValueX , minOriginValues)
    pr = 1/G;
  else  pr = 0;
  endif 
endfunction