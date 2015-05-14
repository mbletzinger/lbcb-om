classdef Transducer < handle
    properties
        initialPlat
        currentPlat
        fixed
        label
        currentDisp
        initialLength
    end
    methods
        function me = Transducer(positions, label)
            me.fixed = positions(1:3);
            me.initialPlat = positions(4:6);
            me.currentPlat = me.initialPlat;
            me.label = label;
            me.currentDisp = 0;
            me.initialLength = me.getLength();
        end
        function jacob = newDiffs(me, cart)
            jacob = jacobianDiffs(me.initialPlat, me.currentPlat, me.fixed,cart);
        end
        function update(me, cart)
            roll = rotationalMatrix(cart(4),1);
            pitch = rotationalMatrix(cart(5),2);
            yaw = rotationalMatrix(cart(6),3);
            current = roll * pitch * yaw * me.initialPlat' + cart(1:3)';
            me.currentPlat = current';
            me.currentDisp = me.getLength() - me.initialLength;
        end
        function length = getLength(me)
            directional_vector = me.currentPlat - me.fixed;
            length = norm(directional_vector);
        end
        function vec = getUnitVector(me)
            vec = me.currentPlat - me.fixed;
            vec = vec / norm(vec);
        end
        function fa = getForceArm(me,trans)
            fa = me.currentPlat - trans;
        end
    end
end
