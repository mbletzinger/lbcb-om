function solveActuatorDisplacement(me,act)
cart = me.cartDisp;
prevAct = me.actDisp;
error = act - prevAct;
jacob = zeros(6);
done = false;
while done == false
    for a = 1:6
        jacob(a,:) = me.transducers{a}.newDiffs(cart);
    end
    cartDiffs = linsolve(jacob,error');
    me.setCartesianDisplacement(cart + cartDiffs');
    error = act - me.actDisp;
    done = true;
    for a = 1:6
     done = done && (error(a) < me.limitation(a));
    end
end
end
