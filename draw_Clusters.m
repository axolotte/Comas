function draw_Clusters(Clusters)
debug_on_warning(1);
debug_on_error(1);


[rows,x]=size(Clusters);

symbs = {'r', 'g','m','b','k','y'}; 

#x = linspace(0,3*pi,200);
#y = cos(x) + rand(1,200);

figure(1)
hold on
axis ([0 100 0 80])

for i=1:x

  C = Clusters{i}
  x = C(1:end,1)
  y= C(1:end, 2)
  
  scatter(x',y',[],symbs{i});
  
  
endfor



endfunction