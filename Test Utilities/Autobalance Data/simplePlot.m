[FileName,PathName,FilterIndex] = uigetfile('.txt');
fullname = sprintf('%s\%s',PathName, FileName);
disp(sprintf('loading "%s',fullname))
raw = load(fullname);