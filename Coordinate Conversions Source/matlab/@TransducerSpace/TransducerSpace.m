classdef TransducerSpace < handle
    properties
        cartDisp
        actDisp
        transducers
        label
        limitations
    end
    methods
        function me = TransducerSpace(pins, label, pinLabels, errorWindow)
            me.transducers = cell(1,6);
            for a = 1:6
                me.transducers{a} = Transducer(pins(a,:),pinLabels{a});
            end
            me.label = label;
            me.cartDisp = zeros(1,6);
            me.actDisp = zeros(1,6);
            me.limitations = errorWindow;
        end
        setCartesianDisplacement(me,cart)
        setActuatorDisplacement(me,act)
        solveActuatorDisplacement(me,act)
    end
            
end
