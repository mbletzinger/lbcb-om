classdef Lbcb < TransducerSpace
    properties
        cartForce
        actForce
        label
    end
    methods
        function me = Lbcb(pins, label)
            errors = repmat(0.00001,6);
            alabels = { 'X1', 'X2', 'Y1', 'Z1', 'Z2', 'Z3' }; 
            me@TransducerSpace(pins, label, alabels, errors);
            me.cartForce = zeros(1,6);
            me.actForce = zeros(1,6);
        end
        setCartesianForce(me,cart)
        setActuatorForce(me,act)
    end
            
end
