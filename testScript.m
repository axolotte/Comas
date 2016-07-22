#script for comparing the algorithms MDAV,MicroDiff and justDiff
#@param file: filename
#@param k: clustersize (relevant for MDAV and MicroDiff)
#@param eps: epsilon, relavant for MicroDiff and justDiff
#@param c1,c2: columns for the attributes

function testScript(file,k,eps,c1,c2)

data = input(c1,c2,file);
#run evaluation for MDAV, for k from 2 to 100
for k=2:100
  [clusterContainer, Masked, originalValues, Average] = sensitive_MDAV(k, file, a, b, data)
endfor
endfunction