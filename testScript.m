#script for comparing the algorithms MDAV,MicroDiff and justDiff
#@param file: filename
#@param k: clustersize (relevant for MDAV and MicroDiff)
#@param eps: epsilon, relavant for MicroDiff and justDiff
#@param c1,c2: columns for the attributes
function testScript(file,c1,c2, runNumber)
debug_on_warning(1);
debug_on_error(1);

%{
#evaluation for e-differntial privacy for epsilon ={0.01,0.1,1,10}
evalDiff = [eps InfoLoss RL];

eps = {0.01,0.1,1,10};
for i=1:4
  i
  [Masked,Origin] = only_diff(eps{i}, file, c1, c2);
  infoLossDiff = infoLoss_diff(Origin, Masked);
  rlDiff = disclosureRisk_diffPrivacy(Origin, Masked);
  evalDiff = [evalDiff ; [eps{i},infoLossDiff,rlDiff]];

endfor
  output = ['evalDiff' num2str(file) num2str(runNumber) '.txt']
  save ("-ascii", output ,"evalDiff");
  
%}
 %{ 
#run evaluation for MDAV, for k from 2 to 100
evalMDAV = ["k" "InfoLoss" "RL"];
output = ['evalMDAV' num2str(file) num2str(runNumber) '.txt'];
for k=2:100

  [clusterContainer, Masked, originalValues, Average] = sensitive_MDAV(k, file, c1, c2);
  infoLossMDAV = infoLoss_MDAV(clusterContainer, Average);
  rlMDAV = disclosureRisk_MDAV(originalValues,Masked);
  evalMDAV = [evalMDAV ; [k,infoLossMDAV,rlMDAV]];
   
  save ("-ascii", output, "evalMDAV");

  
endfor


%}

#evaluation for Microaggreagation+Differential Privacy
evalMicroDiff = [];
 output = ['evalMicroDiff' num2str(file) num2str(runNumber) '.txt'];
eps = {0.01,0.1,1,10};
for i=1:4
    #change k depending on dataset, bigger for bigger datasets
  for k=2:100
    [Masked,Origin,IndexList,Clusters] = MicroDiff(k,eps{i}, file, c1, c2);
    infoLoss = infoLoss_diff(Origin, Masked, IndexList);
    rl = disclosureRisk_diffPrivacy(Origin, Masked, IndexList);
    
    %{
    sseScoreDiff = sqrt(infoLossDiff)/sqrt(infoLoss);
    rlScoreDiff = rlDiff/rl;
    finalScoreDiff = sseScoreDiff/rlScoreDiff;
    
    sseScoreMDAV = sqrt(infoLossMDAV)/sqrt(infoLoss);
    rlScoreMDAV = rlMDAV/rl;
    finalScoreMDAV = sseScoreMDAV/rlScoreMDAV;
    %}
    
    evalMicroDiff = [evalMicroDiff ; [k, eps{i},infoLoss,rl]];

    save ("-ascii", output, "evalMicroDiff");
  endfor
endfor
   
  
endfunction

function Score()


endfunction