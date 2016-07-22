#Information Loss metric for Differential Privacy Algorithm
function Sum = infoLoss_diff(Origin, Mask)


    Sum = 0;
    rows = size(Origin,1);
    for i=1:rows  
      #information loss for attribute1
      dist1 = sqrt((Origin(i,1)-Mask(i,1))*(Origin(i,1)-Mask(i,1)));
      #information loss for attribute2
      dist2 = sqrt((Origin(i,2)-Mask(i,2))*(Origin(i,2)-Mask(i,2)));
      Sum= Sum+dist1+dist2;
    endfor
  

endfunction