function saveText(data,filename)
sz = size(data);
fmt = '';
for c = 1:sz(2)
    fmt = sprintf('%s%%7.5e\t',fmt);
end
fmt = sprintf('%s\n',fmt);
disp(fmt)
hndl = fopen(filename,'w+');
for r = 1:sz(1)
    fprintf(hndl,fmt,data(r,:));
end
fclose(hndl);
end