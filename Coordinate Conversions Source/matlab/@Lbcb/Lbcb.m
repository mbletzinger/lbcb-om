classdef Lbcb < handle
    properties
        cartDisp
        cartForce
        actDisp
        actForce
        actuators
        alabels = { 'X1', 'X2', 'Y1', 'Z1', 'Z2', 'Z3' }; 
        label
        limitation = 0.00001;
    end
    methods
        function me = Lbcb(pins, label)
            me.actuators = cell(1,6);
            for a = 1:6
                me.actuators{a} = Actuator(pins(a,:),me.alabels{a});
            end
            me.label = label;
            me.cartDisp = zeros(1,6);
            me.cartForce = zeros(1,6);
            me.actDisp = zeros(1,6);
            me.actForce = zeros(1,6);
        end
        setCartesianDisplacement(me,cart)
        setActuatorDisplacement(me,act)
        setCartesianForce(me,cart)
        setActuatorForce(me,act)
        solveActuatorDisplacement(me,act)
    end
            
end
