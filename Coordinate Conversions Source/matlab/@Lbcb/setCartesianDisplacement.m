function setCartesianDisplacement(me,cart)
    act = zeros(1,6);
    for a = 1:6
        me.actuators{a}.update(cart);
        act(a) = me.actuators{a}.currentDisp;
    end
    me.cartDisp = cart;
    me.actDisp = act;
end
