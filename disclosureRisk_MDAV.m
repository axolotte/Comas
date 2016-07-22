#disclosure Risk for MDAV
#@param Origin: original values
#@param masked: masked values, clustered and replaced by evarage,
#    each row contains one point
#returns rl: disclosureRisk in percent
function disclosureRisk_MDAV(Origin, Masked)

n = size(Origin,1);
sum = 0;

for i=1:n
  x = Masked(i,:)
  pr = recordLinkProb(x,i,Origin);
  sum = sum+pr;
endfor

rl = 100*sum/n;
endfunction

function pr = recordLinkProb(x,i,Origin)
  distancesToX = euclidean(Origin, x);
  minDis = min(distancesToX);
  G = size(minDis,1);
  originalValueX = Origin(i,:);
  
  if ismember(originalValueX , minDis)
    pr = 1/G;
  else  pr = 0
  endif 
endfunction

