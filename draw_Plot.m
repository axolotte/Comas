##draws Points (not clustered)
##
function draw_Plot(Points)
debug_on_warning(1);
debug_on_error(1);
  

x = Points(1:end,1);
y=Points(1:end,2);

scatter(x',y');


endfunction