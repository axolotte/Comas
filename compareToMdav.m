function compareToMdav(mdavFile, microdiffFile)
filename = [mdavFile ".txt"];
fid = fopen(filename, "r");
mdav= dlmread(filename);
fclose(fid);

filename = [microdiffFile ".txt"];
fid = fopen(filename, "r");
MicroDiff= dlmread(filename);
fclose(fid);

k = [1:99]';

compareSSE(mdav,MicroDiff,k);
compareRL(mdav,MicroDiff,k);
endfunction

function compareSSE(mdav,MicroDiff,k)




rlMicroDiff1 = MicroDiff(1:99,3);
rlMicroDiff2 = MicroDiff(100:198,3);
rlMicroDiff3 = MicroDiff(199:297,3);
rlMicroDiff4 = MicroDiff(298:396,3);


rlMdav(1:99,1) = mdav(1:end,2);


figure(1)
hold on

title('SSE');
semilogy(k,rlMicroDiff1, k, rlMicroDiff2, k, rlMicroDiff3, k, rlMicroDiff4, k, rlMdav);
legend({'eps=0.01','eps=0.1','eps=1','eps=10', 'MDAV'});
endfunction

function compareRL(mdav,MicroDiff,k)



rlMicroDiff1 = MicroDiff(1:99,4);
rlMicroDiff2 = MicroDiff(100:198,4);
rlMicroDiff3 = MicroDiff(199:297,4);
rlMicroDiff4 = MicroDiff(298:396,4);


rlMdav(1:99,1) = mdav(1:end,3)


figure(2)
hold on

title('RL');
semilogy(k,rlMicroDiff1, k, rlMicroDiff2, k, rlMicroDiff3, k, rlMicroDiff4, k, rlMdav);
legend({'eps=0.01','eps=0.1','eps=1','eps=10', 'MDAV'});
endfunction