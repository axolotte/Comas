function [diffDB, Points]=only_diff(eps, file, column1, column2)
#{
Differntial Algorithm, working only with Laplace noise
#@param eps: parameter epsilon
#@param file: input file
#@param column1,column2: columns in which the attribute to mask are stored
#}

Points = input(column1,column2,file);

rows = size(Points,1);

y=1;
#iterate through Points 
  for i=1:(rows)
  
     
 
       rnd_Age = laplace_random(65, eps);
       
       diffAge= Points(i,1) + rnd_Age;
       diffHours = Points(i,2) + laplace_random(70, eps);
    
       diffDB(y,1)=diffAge;
       diffDB(y,2)=diffHours;
    
       y++;
    
    
  endfor


  
endfunction