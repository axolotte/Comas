function [Sum]=infoLoss_k(Origin,Mask,Index)

Sum = 0;
    rows = size(Origin,1);
    for i=1:rows  
      dist = sqrt((Origin(Index(i,1),1)-Mask(i,1))*(Origin(Index(i,1),1)-Mask(i,1)));
      Sum= Sum+dist;
    endfor
endfunction