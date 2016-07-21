function testDraw(Clusters)
  
  x = size(Clusters,2);

  #symbs = {'blue', 'green','magenta','black','red','cyan'}; 


    figure(1)
     hold on
    axis ([0 100 0 100]);

  for i=1:x

    C = Clusters{i};
    x = C(:,1);
    y= C(:, 2);
    
    scatter(x',y',[],mod(i,6));
    
  
  
endfor

endfunction