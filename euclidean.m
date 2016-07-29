#{calculates euclidean distance betwenn reference point R and input points P
#}

function [E] = euclidean(P,R)

  n = rows(P);

  E=0;
#for every point calculate euclidic distance to R
#save distance into Euclidic
  for i=1:n
    point = [P(i,1) P(i,2)];

    distance =  sqrt(((R(1,1)-point(1,1))*(R(1,1)-point(1,1)))+ ((R(1,2)-point(1,2))*(R(1,2)-point(1,2))));
    E(i,1) = distance;
  endfor
endfunction