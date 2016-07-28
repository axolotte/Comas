function Score(fileDiff, fileMDAV, fileMicroDiff)

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
mdavRL(:,2) = MDAV(:,4);

#SSE and RL value for MicroDiff
i=1;
microDiffSSE =[];
microDiffRL=[];
while i<=363
microDiffSSE = [microDiffSSE ;MicroDiff(i,3)];
microDiffRL = [microDiffRL; MicroDiff(i,4)];
i=i+33;
endwhile

#----------------calculate Score compared to DIFF--------------------------

#for eps=0.01
sseDiff = diffSSE(1,1);
rlDiff = diffRL(1,2);

finalScoreDiff = [];
#get first three values from microDiffSSE/RL which are eps=0.01 and k=2,33,66
for i=1:3
 
      sseScoreDiff = sqrt(sseDiff)/sqrt(microDiffSSE(i,1));
     rlScoreDiff = rlDiff/microDiffRL(i,2);
    finalScoreDiff = [finalScoreDiff ; sseScoreDiff/rlScoreDiff];
endfor
#for eps=0.1
sseDiff = diffSSE(2,1);
rlDiff = diffRL(2,2);
#get first three values from microDiffSSE/RL which are eps=0.1 and k=2,33,66
for i=1:3
 
      sseScoreDiff = sqrt(sseDiff)/sqrt(microDiffSEE(i+3,1));
     rlScoreDiff = rlDiff/microDiffRL(i+3,2);
    finalScoreDiff = [finalScoreDiff ; sseScoreDiff/rlScoreDiff];
endfor

#for eps=1
sseDiff = diffSSE(3,1);
rlDiff = diffRL(3,2);
#get first three values from microDiffSSE/RL which are eps=1 and k=2,33,66
for i=1:3
 
      sseScoreDiff = sqrt(sseDiff)/sqrt(microDiffSEE(i+6,1));
     rlScoreDiff = rlDiff/microDiffRL(i+6,2);
    finalScoreDiff = [finalScoreDiff ; sseScoreDiff/rlScoreDiff];
endfor

#for eps=10
sseDiff = diffSSE(4,1);
rlDiff = diffRL(4,2);
#get first three values from microDiffSSE/RL which are eps=1 and k=2,33,66
for i=1:3
 
      sseScoreDiff = sqrt(sseDiff)/sqrt(microDiffSEE(i+9,1));
     rlScoreDiff = rlDiff/microDiffRL(i+9,2);
    finalScoreDiff = [finalScoreDiff ; sseScoreDiff/rlScoreDiff];
endfor  

#------------------------Score for MDAV-----------------------------------
endfunction