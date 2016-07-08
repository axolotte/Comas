##color cluster in same color
##so far 6 colours, more can be added
function draw_Clusters(Clusters)
debug_on_warning(1);
debug_on_error(1);


[rows,x]=size(Clusters);

symbs = {'blue', 'green','magenta','yellow','k','y'}; 


figure(1)
hold on
axis ([0 100 0 100]);

for i=1:x

  C = Clusters{i};
  x = C(1:end,1);
  y= C(1:end, 2);
  
  r=size(C,1);
    for j=1:r
       distance = euclidean(C(j,:));
       txt = [' ' num2str(distance) ' '];
       text(C(j,1),C(j,2),txt);
       hold on
     endfor
  scatter(x',y',[],symbs{i});
  
  
  
endfor



endfunction