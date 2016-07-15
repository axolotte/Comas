function output(name, Matrix)

filename = [name ".txt"];
fid = fopen (filename, "w");
save ("-ascii", Matrix);
fclose (fid);
endfunction