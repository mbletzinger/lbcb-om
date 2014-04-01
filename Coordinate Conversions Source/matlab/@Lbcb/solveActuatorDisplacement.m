function solveActuatorDisplacement(me,act)
cart = me.cartDisp;
prevAct = me.actDisp;
error = act - prevAct;
jacob = zeros(6);
done = false;
while done == false
    for a = 1:6
        jacob(a,:) = me.actuators{a}.newDiffs(cart);
    end
    cartDiffs = linsolve(jacob,error');
    me.setCartesianDisplacement(cart + cartDiffs');
    error = act - me.actDisp;
    done = max(abs(error)) < me.limitation;
end
end
