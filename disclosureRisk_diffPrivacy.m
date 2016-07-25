#function to calculate the percentage of Record Linkages for Differential Privacy
#@param Origin: Original Values
#@param Masked: Masked values
function RL = disclosureRisk_diffPrivacy(Origin,Masked)

Origin = Origin;
n = size(Origin,1);
sum = 0;
for i=1:n
  x = Masked(i,:);
  pr = recordLinkProb(x,i, Origin);
  sum = sum + pr;
endfor

RL=100*sum/n;
endfunction

function pr = recordLinkProb(x,i, Origin)
  
  distancesToX = euclidean(Origin, x);
  [minDis, indexMin] = min(distancesToX);
  G = size(minDis,1);
  originalX = Origin(i,:);
  minOriginValues = Origin(indexMin,:);
  
  
  if ismember(originalX , minOriginValues)
    pr = 1/G;
  else  pr = 0;
  endif
endfunction