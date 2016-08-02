#{
Function to compare graphically Diff to MicroDiff in terms of RL 
#@param file1,2: filenames where file1 is MDAV/Diff and file2 is MicroDiff
#}
function plotComparisonRL(file1, file2)

filename = [file1 ".txt"];
fid = fopen(filename, "r");
temp1= dlmread(filename);
fclose(fid);

filename = [file2 ".txt"];
fid = fopen(filename, "r");
MicroDiff= dlmread(filename);
fclose(fid);


k = [1:99]';


rlMicroDiff1 = MicroDiff(1:99,4);
rlMicroDiff2 = MicroDiff(100:198,4);
rlMicroDiff3 = MicroDiff(199:297,4);
rlMicroDiff4 = MicroDiff(298:396,4);


rlDiff1(1:99,1) = temp1(1,3);
rlDiff2(1:99,1) = temp1(2,3);
rlDiff3 (1:99,1)= temp1(3,3);
rlDiff4 (1:99,1)= temp1(4,3);

figure(1)
hold on
title('RL');
plot(k,rlMicroDiff1,'k --', k, rlMicroDiff2,'r:',
       k, rlMicroDiff3,'g-.', k, rlMicroDiff4, 'm-', k, rlDiff1,'k--', k , 
       rlDiff2,'r:', k, rlDiff3, 'g-.',k, rlDiff4,'m-');
legend({'eps=0.01','eps=0.1','eps=1','eps=10'});
 
endfunction