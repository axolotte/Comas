function [diffDB] = diff_Private(Clusters, Average, k, eps)
debug_on_warning(1);
debug_on_error(1);

[rows,x]=size(Clusters);
y=1;
#iterate through Cluster until the last cluster
  for i=1:(rows-1)

    A=Average{i}
  
     for j=1:k
       epsAge = ((eps*k)/200)*exp^((-abs(A(1,1))*eps*k)/100);
       epsHours = ((eps*k)/160)*exp^((-abs(A(1,2))*eps*k)/80);
    
       diffAge= A(1,1) + epsAge;
       diffHours = A(1,2) + epsHours;
    
       diffDB(y,1)=diffAge;
       diffDB(y,2)=diffHours;
    
       y++;
    endfor  
    
  endfor

[n,m]=size(Average);
A=Average{n};
C= Clusters{rows};

rest = size(C,1);

  for l=1:rest
       epsAge = ((eps*k)/200)*exp((-abs(A(1,1))*eps*k)/100);
       epsHours = ((eps*k)/160)*exp((-abs(A(1,2))*eps*k)/80);
    
       diffAge= A(1,1) + epsAge;
       diffHours = A(1,2) + epsHours;
    
       diffDB(y,1)=diffAge;
       diffDB(y,2)=diffHours;
       y++;
    
  endfor


endfunction