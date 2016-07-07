##color cluster in same color
##so far 6 colours, more can be added
function draw_Clusters(Clusters)
debug_on_warning(1);
debug_on_error(1);


[rows,x]=size(Clusters);

symbs = {'r', 'g','m','b','k','y'}; 


figure(1)
hold on
axis ([0 100 0 100])

for i=1:x

  C = Clusters{i}
  x = C(1:end,1)
  y= C(1:end, 2)
  
  scatter(x',y',[],symbs{i});
  
  
endfor



endfunction