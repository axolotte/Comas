#takes a,b as input, which specify which columns of the table should be used
function Points = input(a,b)
debug_on_warning(1);
debug_on_error(1);

filename = "numbers.txt";
fid = fopen(filename, "r");
temp= dlmread(filename);
fclose(fid);

Points(:,1) = temp(:,a);
Points(:,2) = temp(:,b);

endfunction