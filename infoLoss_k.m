#information loss metric for MicroAgg algorithm
#needs to get the Indexlist to calculate informationloss
function [Sum]=infoLoss_k(Origin,Mask,Index)

Sum = 0;
    rows = size(Origin,1);
    for i=1:rows  
      #information loss for attribute1
      dist1 = sqrt((Origin(Index(i,1),1)-Mask(i,1))*(Origin(Index(i,1),1)-Mask(i,1)));
      #information loss for attribute2
      dist2 = sqrt((Origin(Index(i,1),2)-Mask(i,2))*(Origin(Index(i,1),2)-Mask(i,2)));
      Sum= Sum+dist1+dist2;
    endfor
endfunction