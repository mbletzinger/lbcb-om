function [lbcb, xfrm ] = loadLbcbsTxt(folder,lbcbNumber)
pinFile = 'Lbcb[X]PinPositions.txt';
xfrmFile = 'LBCB[X]_Transform.txt';
mcFile = 'MotionCenters.txt';
file = strrep(pinFile,'[X]',sprintf('%d',lbcbNumber));
path = fullfile(folder,file);
pins = load(path);
lbcb = Lbcb(pins,sprintf('LBCB %d',lbcbNumber));
file = strrep(xfrmFile,'[X]',sprintf('%d',lbcbNumber));
path = fullfile(folder,file);
xfm = load(path);
path = fullfile(folder,mcFile);
mcs = load(path);
xfrm = RigidTransformation(mcs(lbcbNumber,:),xfm);
end
