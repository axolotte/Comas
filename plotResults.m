function plotResults(fileDiff)

filename = [fileDiff ".txt"];
fid = fopen(filename, "r");
temp= dlmread(filename);
fclose(fid);

epsDiff = temp(:,1)
SSEDiff = temp(:,2)
RLDiff = temp(:,3)


figure(1)
hold on

semilogy(epsDiff,SSEDiff, epsDiff, RLDiff);

endfunction