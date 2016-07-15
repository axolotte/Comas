function [diffDB] = diff_Private(Clusters, Average, k, eps)
debug_on_warning(1);
debug_on_error(1);

[rows,x]=size(Clusters);

y=1;
#iterate through Cluster until the last cluster
  for i=1:(x-1)

    A=Average{i};
  
     for j=1:k
 
       rnd_Age = laplace_random(65, eps);
       
       diffAge= A(1,1) + rnd_Age;
       diffHours = A(1,2) + laplace_random(70, eps);
    
       diffDB(y,1)=diffAge;
       diffDB(y,2)=diffHours;
    
       y++;
    endfor  
    
  endfor

[n,m]=size(Average);
A=Average{n};
C= Clusters{x};

rest = size(C,1);

  for l=1:rest
   
    
       diffAge= A(1,1) + laplace_random(100, eps);
       diffHours = A(1,2) + laplace_random(80, eps);
    
       diffDB(y,1)=diffAge;
       diffDB(y,2)=diffHours;
       y++;
    
  endfor

  

endfunction