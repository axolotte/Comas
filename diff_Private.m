function [diffDB] diff_Private(Clusters, Average, k, eps)

for i=1:(rows-1)
  x=Average{i}
  for j=1:k
    epsAge = ((eps*k)/200)*exp^((-abs(x)*eps*k)/100);
    epsHours = ((eps*k)/160)*exp^((-abs(x)*eps*k)/80);
    
    diffAge= x(1,1) + epsAge;
    diffHours = x(1,2) + epsHours;
    
    diffDB(y,1)=diffAge;
    diffDB(y,2)=diffHours;
    
    endfor
endfor

endfunction