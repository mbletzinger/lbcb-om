load ../LbcbConversionsUnitTests/resources/Lbcb1PinPositions.txt
act = Actuator(Lbcb1PinPositions(1,:),'x1');
test = [0.1 0 0 0 0 0; 0 0.2 0 0 0 0; 0 0 0.45 0 0 0; 0 0 0 0.005 0 0;...
    0 0 0 0 0.003 0; 0 0 0 0 0 -0.002];
for t = 1:6
    cartesian = test(t,:)
    act.update(test(t,:));
    length = act.getLength()
    current = act.currentPlat
end
