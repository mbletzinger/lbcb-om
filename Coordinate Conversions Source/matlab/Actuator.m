classdef Actuator < handle
    properties
        initialPlat
        currentPlat
        fixed
        label
    end
    methods
        function me = Actuator(positions, label)
            me.fixed = positions(1:3);
            me.initialPlat = positions(4:6);
            me.currentPlat = me.initialPlat;
            me.label = label;
        end
        function jacob = newDiffs(me, cart)
            jacob = jacobianDiffs(me.initialPlat, me.currentPlat, me.fixed,cart);
        end
        function update(me, cart)
            roll = me.rotationalMatrix(cart(4),1);
            pitch = me.rotationalMatrix(cart(5),2);
            yaw = me.rotationalMatrix(cart(6),3);
            current = roll * pitch * yaw * me.initialPlat' + cart(1:3)';
            me.currentPlat = current';
        end
        function rot = rotationalMatrix(me,angle, type)
            rot = eye(3);
            switch type
                case 1
                    rot(2,2) =  cos( angle );
                    rot(2,3) = -sin( angle );
                    rot(3,2) =  sin( angle );
                    rot(3,3) =  cos( angle );
                    return;
                case 2
                    rot(1,1) =  cos( angle );
                    rot(1,3) =  sin( angle );
                    rot(3,1) = -sin( angle );
                    rot(3,3) =  cos( angle );
                    return;
                case 3
                    rot(1,1) =  cos( angle );
                    rot(1,2) = -sin( angle );
                    rot(2,1) =  sin( angle );
                    rot(2,2) =  cos( angle );
            end
            return;
        end
        function length = getLength(me)
            directional_vector = me.currentPlat - me.fixed;
            length = norm(directional_vector);
        end
    end
end
