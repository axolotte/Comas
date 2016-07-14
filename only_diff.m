function only_diff(k, eps, file, column1, column2)

Points = input(column1,column2,file);

rows = size(Points,1);

y=1;
#iterate through Points 
  for i=1:(rows)
  
     
 
       rnd_Age = laplace_random(100, eps);
       
       diffAge= Points(i,1) + rnd_Age;
       diffHours = Points(i,2) + laplace_random(80, eps);
    
       diffDB(y,1)=diffAge;
       diffDB(y,2)=diffHours;
    
       y++;
    
    
  endfor


  
endfunction