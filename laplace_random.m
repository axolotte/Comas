#{
Calculates Laplace noise which is added to mask the data.
@param f:sensitivity of the data
@param eps: parameter eps, determining the strenght of privacy
#}
function [noise] = laplace_random(f, eps)


  x = rand(1)-0.5;
  noise = -(f/eps)*sign(x)*log(1-2*abs(x));
 
while noise < 0 || noise >f
    x = rand(1)-0.5;
    noise = -(f/eps)*sign(x)*log(1-2*abs(x));
endwhile
 

endfunction