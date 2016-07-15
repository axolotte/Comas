function Sum = infoLoss_diff(Origin, Mask)


    Sum = 0;
    rows = size(Origin,1);
    for i=1:rows  
      dist = sqrt((Origin(i,1)-Mask(i,1))*(Origin(i,1)-Mask(i,1)));
      Sum= Sum+dist;
    endfor
  

endfunction