function RL = disclosureRisk_diffPrivacy(Origin,Masked)

n = size(Origin,1);
sum = 0;
for i=1:n
  x = Masked(i,:);
  pr = recordLinkProb(x,i);
  sum = sum + pr;
endfor

RL=100*sum/n;
endfunction

function pr = recordLinkProb(x,i)
  distancesToX = euclidean(Origin, x);
  minDis = min(distancesToX);
  G = size(minDis,1);
  originalX = Origin(i,:);
  
  if ismember(orginalX , minDis)
    pr = 1/G;
  else  pr = 0
  endif
endfunction