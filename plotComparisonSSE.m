function plotComparisonSSE(file1, file2)

filename = [file1 ".txt"];
fid = fopen(filename, "r");
temp1= dlmread(filename);
fclose(fid);

filename = [file2 ".txt"];
fid = fopen(filename, "r");
temp2= dlmread(filename);
fclose(fid);


k = temp2(:,1)
sseMicroDiff1 = temp2(1:98,3);
sseMicroDiff2 = temp2(1:196,3);
sseMicroDiff3 = temp2(1:294,3);
sseMicroDiff4 = temp2(1:392,3);

SSEDiff1 = temp1(1,2);
SSEDiff2 = temp1(2,2);
SSEDiff3 = temp1(3,2);
SSEDiff4 = temp1(4,2);



figure(1)
hold on

semilogy(k,sseMicroDiff1, k, sseMicroDiff2, k, sseMicroDiff3, k, sseMicroDiff4, k SSEDiff1,k, SSEDiff2, k, SSEDiff3, k , SSEDiff4);
endfunction