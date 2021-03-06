pth = fullfile(pwd,'Log_*.txt');
lst = dir(pth);
numF = length(lst);
list = cell(length(lst),1);
for l = 1 : numF
    list{l} = lst(l).name;
end
data = cell(numF,1);
desc = cell(numF,1);
for f = 1:numF
    data{f} = load(fullfile(pwd,list{f}));
    m = regexp(list{f},'Log_(\d+)_([\d.]+)_(\d+)_(\d+)','tokens');
% samples per channel _ rate _ Number of Increments _ milliseconds wait
    desc{f} = sprintf('/samples=%s/rate=%s/increments=%s/wait=%s',m{1}{1},m{1}{2},m{1}{3},m{1}{4});
end

% Gold Log_100_30.000_500_100.txt
goldIdx = 1;
for f = 1:numF
    if strcmp(list{f},'Log_100_30.000_500_100.txt')
        goldIdx = f;
        break;
    end
end

gold = data{goldIdx};

diffNum = cell(numF - 1,1);
diffDesc = cell(numF - 1,1);
g = 1;


for f = 1:numF
    if f == goldIdx
        continue;
    end
    disp(sprintf('%d into %d',f,g));
    diffNum{g} = data{f} - gold;
    diffDesc{g} = desc{f};
    g = g+ 1;
end