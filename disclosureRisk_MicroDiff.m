function rl = disclosureRisk_MicroDiff(Origin, Masked, IndexList)

n = size(Origin,1);
sum = 0;

for i=1:n
  x = Masked(i,:);
  pr = recordLinkProb(x,i);
  sum = sum+pr;
endfor

rl = 100*sum/n;
endfunction

function pr = recordLinkProb(x,i)
  distancesToX = euclidean(Origin, x);
  minDis = min(distancesToX);
  G = size(minDis,1);
  originalValueX = Origin(IndexList(i),:);
  
  if ismember(orginalX , minDis)
    pr = 1/G;
  else  pr = 0
  endif 
endfunction