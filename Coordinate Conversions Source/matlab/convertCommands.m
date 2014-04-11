function aCommands = convertCommands(cCommands,lbcb,xfrm)
rows = size(cCommands,1);
aCommands = zeros(rows,6);
for r = 1:rows
    lbcb.setCartesianDisplacement(cCommands(r,:));
    act = xfrm.transform(lbcb.actDisp,true);
    aCommands(r,:) = act;
end
end