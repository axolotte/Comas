#{
Calculates the Score (from the paper) for MicroDiff compared to Diff and MDAV
@param fileDiff, fileMDAV, fileMicroDiff: filenames where the results of the testscript are stored
#}
function Score(fileDiff, fileMDAV, fileMicroDiff)
debug_on_warning(1);
debug_on_error(1);

filename = [fileDiff ".txt"];
fid = fopen(filename, "r");
Diff= dlmread(filename);
fclose(fid);

filename = [fileMDAV ".txt"];
fid = fopen(filename, "r");
MDAV= dlmread(filename);
fclose(fid);

filename = [fileMicroDiff ".txt"];
fid = fopen(filename, "r");
MicroDiff= dlmread(filename);
fclose(fid);

#SSE and RL values for Differential Algorithm
diffSSE(:,1) = Diff(:,2);
diffRL(:,2) = Diff(:,3);

#SSE and RL values for MDAV algorithm
mdavSSE(:,1) = MDAV(:,2);
mdavRL(:,2) = MDAV(:,3);

#SSE and RL value for MicroDiff for k=2,33,66 for eps={0.01,0.1,1,10}
i=1;
microDiffSSE =[];
microDiffRL=[];
microDiffSSE = [microDiffSSE ;MicroDiff(i,3)];
microDiffRL = [microDiffRL; MicroDiff(i,4)];
i=i+31;
while i<=66
  
microDiffSSE = [microDiffSSE ;MicroDiff(i,3)];
microDiffRL = [microDiffRL; MicroDiff(i,4)];
i=i+33;
endwhile

i= 100;

microDiffSSE = [microDiffSSE ;MicroDiff(i,3)];
microDiffRL = [microDiffRL; MicroDiff(i,4)];
i=i+31;
while i<=167
  
microDiffSSE = [microDiffSSE ;MicroDiff(i,3)];
microDiffRL = [microDiffRL; MicroDiff(i,4)];
i=i+33;
endwhile


i= 199;

microDiffSSE = [microDiffSSE ;MicroDiff(i,3)];
microDiffRL = [microDiffRL; MicroDiff(i,4)];
i=i+31;

while i<=264
  
microDiffSSE = [microDiffSSE ;MicroDiff(i,3)];
microDiffRL = [microDiffRL; MicroDiff(i,4)];
i=i+33;
endwhile

i= 298;

microDiffSSE = [microDiffSSE ;MicroDiff(i,3)];
microDiffRL = [microDiffRL; MicroDiff(i,4)];
i=i+31;

while i<=362
  
microDiffSSE = [microDiffSSE ;MicroDiff(i,3)];
microDiffRL = [microDiffRL; MicroDiff(i,4)];
i=i+33;
endwhile

microDiffSSE
microDiffRL
#----------------calculate Score compared to DIFF--------------------------

#for eps=0.01
sseDiff = diffSSE(1,1);
rlDiff = diffRL(1,2);

finalScoreDiff = [];
#get first three values from microDiffSSE/RL which are eps=0.01 and k=2,33,66
for i=1:3
 
      sseScoreDiff = sqrt(sseDiff)/sqrt(microDiffSSE(i,1));
     rlScoreDiff = rlDiff/microDiffRL(i,1);
    finalScoreDiff = [finalScoreDiff ; sseScoreDiff*rlScoreDiff];
endfor
#for eps=0.1
sseDiff = diffSSE(2,1);
rlDiff = diffRL(2,2);
#get first three values from microDiffSSE/RL which are eps=0.1 and k=2,33,66
for i=1:3
 
      sseScoreDiff = sqrt(sseDiff)/sqrt(microDiffSSE(i+3,1));
     rlScoreDiff = rlDiff/microDiffRL(i+3,1);
    finalScoreDiff = [finalScoreDiff ; sseScoreDiff*rlScoreDiff];
endfor

#for eps=1
sseDiff = diffSSE(3,1);
rlDiff = diffRL(3,2);
#get first three values from microDiffSSE/RL which are eps=1 and k=2,33,66
for i=1:3
 
      sseScoreDiff = sqrt(sseDiff)/sqrt(microDiffSSE(i+6,1));
     rlScoreDiff = rlDiff/microDiffRL(i+6,1);
    finalScoreDiff = [finalScoreDiff ; sseScoreDiff*rlScoreDiff];
endfor

#for eps=10
sseDiff = diffSSE(4,1);
rlDiff = diffRL(4,2);
#get first three values from microDiffSSE/RL which are eps=10 and k=2,33,66
for i=1:3
 
      sseScoreDiff = sqrt(sseDiff)/sqrt(microDiffSSE(i+9,1));
     rlScoreDiff = rlDiff/microDiffRL(i+9,1);
    finalScoreDiff = [finalScoreDiff ; sseScoreDiff*rlScoreDiff];
endfor  

#------------------------Score for MDAV-----------------------------------

#Mdav sse and rl values for k=2,33,66
sseMdav(1) = mdavSSE(1,1);
sseMdav(2) = mdavSSE(32,1);
sseMdav(3)= mdavSSE(65,1);


rlMdav(1)= mdavRL(1,2);
rlMdav(2)= mdavRL(31,2);
rlMdav(3) = mdavRL(65,2);


finalScoreMDAV = [];
#get first three values from microDiffSSE/RL which are eps=0.01 and k=2,33,66
for i=1:3
 
      sseScore = sqrt(sseMdav(i))/sqrt(microDiffSSE(i,1));
     rlScore = rlMdav(i)/microDiffRL(i,1);
    finalScoreMDAV = [finalScoreMDAV ; sseScore*rlScore];
endfor

#get first three values from microDiffSSE/RL which are eps=0.1 and k=2,33,66
for i=1:3
 
      sseScore= sqrt(sseMdav(i))/sqrt(microDiffSSE(i+3,1));
     rlScore = rlMdav(i)/microDiffRL(i+3,1);
    finalScoreMDAV= [finalScoreMDAV ; sseScore*rlScore];
endfor


#get first three values from microDiffSSE/RL which are eps=1 and k=2,33,66
for i=1:3
 
      sseScore = sqrt(sseMdav(i))/sqrt(microDiffSSE(i+6,1));
     rlScore= rlMdav(i)/microDiffRL(i+6,1);
    finalScoreMDAV = [finalScoreMDAV; sseScore*rlScore];
endfor


#get first three values from microDiffSSE/RL which are eps=10 and k=2,33,66
for i=1:3
 
      sseScore = sqrt(sseMdav(i))/sqrt(microDiffSSE(i+9,1));
     rlScore = rlMdav(i)/microDiffRL(i+9,1);
    finalScoreMDAV= [finalScoreMDAV ; sseScore*rlScore];
endfor  

output1 = ['ScoreDiff' num2str(fileDiff) '.txt'];

output2 = ['ScoreMDAV' num2str(fileMDAV) '.txt'];

 save ("-ascii", output1 ,"finalScoreDiff");
  save ("-ascii", output2 ,"finalScoreMDAV");
endfunction