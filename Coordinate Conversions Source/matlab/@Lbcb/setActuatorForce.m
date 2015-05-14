function setActuatorForce(me,act)
    force = zeros(1,3);
    moment = zeros(1,3);
    me.actForce = act;
    for a = 1:6
        force = force + me.transducers{a}.getUnitVector() * act(a);
        mvec = cross(me.transducers{a}.getForceArm(me.cartDisp(1:3)),...
            me.transducers{a}.getUnitVector());
        moment = moment +  mvec * act(a);
    end
    me.cartForce(1:3) = force;
    me.cartForce(4:6) = moment;
end
