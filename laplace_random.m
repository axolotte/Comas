function [noise] = laplace_random(f, eps)

x = rand(1) - 0.5;
noise = f/eps*sgn(x)log(1-2*abs(x));

endfunction