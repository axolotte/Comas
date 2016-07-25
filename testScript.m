#script for comparing the algorithms MDAV,MicroDiff and justDiff
#@param file: filename
#@param k: clustersize (relevant for MDAV and MicroDiff)
#@param eps: epsilon, relavant for MicroDiff and justDiff
#@param c1,c2: columns for the attributes
function testScript(file,c1,c2, runNumber)
debug_on_warning(1);
debug_on_error(1);

#evaluation for e-differntial privacy for epsilon ={0.01,0.1,1,10}
evalDiff = [];

eps = {0.01,0.1,1,10};
for i=1:4
  i
  [Masked,Origin] = only_diff(eps{i}, file, c1, c2);
  infoLoss = infoLoss_diff(Origin, Masked);
  rl = disclosureRisk_diffPrivacy(Origin, Masked);
  evalDiff = [evalDiff ; [eps{i},infoLoss,rl]];

endfor
  output = ['evalDiff' num2str(file) num2str(runNumber) '.txt']
  save ("-ascii", output ,"evalDiff");
  
  
#run evaluation for MDAV, for k from 2 to 100
evalMDAV = [];

for k=2:100

  [clusterContainer, Masked, originalValues, Average] = sensitive_MDAV(k, file, c1, c2);
  infoLoss = infoLoss_MDAV(clusterContainer, Average);
  rl = disclosureRisk_MDAV(originalValues,Masked);
  evalMDAV = [evalMDAV ; [k,infoLoss,rl]];
 
  
endfor

  output = ['evalMDAV' num2str(file) num2str(runNumber) '.txt'];
  save ("-ascii", output, "evalMDAV");



#evaluation for Microaggreagation+Differntial Privacy
evalMicroDiff = [];

eps = {0.01,0.1,1,10};
for i=1:4
  for k=2:100
    [Masked,Origin,IndexList,Clusters] = MicroDiff(k,eps{i}, file, c1, c2);
    infoLoss = infoLoss_diff(Origin, Masked, IndexList);
    rl = disclosureRisk_diffPrivacy(Origin, Masked, IndexList);
    evalMicroDiff = [evalMicroDiff ; [k, eps{i},infoLoss,rl]];
    
  
  endfor
endfor
    output = ['evalMicroDiff' num2str(file) num2str(runNumber) '.txt'];
  
    save ("-ascii", output, "evalMicroDiff");
endfunction