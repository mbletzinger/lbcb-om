classdef Actuator
    properties (Dependent = true)
        current_stroke
    end
    properties
    nominal_length = 0;
    current_length = 0;
    basepin = [0,0,0];
    nominal_platformpin = [0,0,0];
    current_platformpin = [0,0,0];
    end %properties
    methods
        function returnO = set.nominal_length(obj,value)
            obj.nominal_length = value;
            obj.current_length = value;
            returnO = obj;
        end
        function returnO = set.nominal_platformpin(obj,value)
            obj.nominal_platformpin = value;
            obj.current_platformpin = value;
            returnO = obj;
        end
        function returnO = cartesianInput(obj, vector)
            translation = [vector(1), vector(2), vector(3)];
            roll = eye(3);
            roll(2,2) = cos(vector(4));
            roll(2,3) = -sin(vector(4));
            roll(3,2) = sin(vector(4));
            roll(3,3) = cos(vector(4));
            pitch = eye(3);
            pitch(1,1) = cos(vector(5));
            pitch(1,3) = -sin(vector(5));
            pitch(3,1) = sin(vector(5));
            pitch(3,3) = cos(vector(5));
            yaw = eye(3);
            yaw(1,1) = cos(vector(6));
            yaw(1,2) = -sin(vector(6));
            yaw(2,1) = sin(vector(6));
            yaw(2,2) = cos(vector(6));
            
            obj.current_platformpin = roll * pitch * yaw * obj.nominal_platformpin * translation;
            directional_vector = obj.current_platformpin - obj.basepin;
            obj.current_length = norm(directional_vector);
            returnO = obj;

        end
        function DL_Dd = jacobian(cart)
            act_unit_vector  = (obj.current_platformpin - obj.basepin)/obj.current_length;
            J = zeros(3,3);
            J(1,2) = -sin(cart(5))*cos(cart(6))*obj.nominal_platformpin(1) ...
                + sin(cart(5))*sin(cart(6))*obj.nominal_platformpin(2) ...
                + cos(cart(5))* obj.nominal_platformpin(3);
            J(1,3) = -cos(cart(5))*sin(cart(6))*obj.nominal_platformpin(1) ...
                - cos(cart(5))*cos(cart(6))*obj.nominal_platformpin(2);

            J(2,1) = (cos(cart(4))*sin(cart(5))*cos(cart(6)) ...
                - sin(cart(4))*sin(cart(6)))*obj.nominal_platformpin(1);
            J(2,1) = J(2,1) + (-cos(cart(4))*sin(cart(5))*sin(cart(6)) ...
                - sin(cart(4)) * cos(cart(4)))*obj.nominal_platformpin(2);
            J(2,1) = J(2,1) - sin(cart(4))*cos(cart(5))*obj.nominal_platformpin(3);
            
            J(2,2) = sin(cart(4))*cos(cart(5))*cos(cart(6))*obj.nominal_platformpin(1);
            J(2,2) = J(2,2) - sin(cart(4))*cos(cart(5))*sin(cart(6))*obj.nominal_platformpin(2);
            J(2,2) = J(2,2) - sin(cart(4))*cos(cart(5))*obj.nominal_platformpin(3);

            J(2,3) = (-sin(cart(4))*sin(cart(5))*sin(cart(6)) ...
                * cos(cart(4))*cos(cart(6)))*obj.nominal_platformpin(1);
            J(2,3) = J(2,3) + (-sin(cart(4))*sin(cart(5))*cos(cart(6)) ...
                - cos(cart(4)) * sin(cart(4)))*obj.nominal_platformpin(2);

            
            J(3,1) = (sin(cart(4))*sin(cart(5))*cos(cart(6)) ...
                + cos(cart(4))*sin(cart(6)))*obj.nominal_platformpin(1);
            J(3,1) = J(3,1) + (-sin(cart(4))*sin(cart(5))*cos(cart(6)) ...
                + cos(cart(4)) * cos(cart(4)))*obj.nominal_platformpin(2);
            J(3,1) = J(3,1) - sin(cart(4))*cos(cart(5))*obj.nominal_platformpin(3);
            
            J(3,2) = -cos(cart(4))*cos(cart(5))*cos(cart(6))*obj.nominal_platformpin(1);
            J(3,2) = J(3,2) + cos(cart(4))*cos(cart(5))*sin(cart(6))*obj.nominal_platformpin(2);
            J(3,2) = J(3,2) - cos(cart(4))*sin(cart(5))*obj.nominal_platformpin(3);

            J(3,3) = (cos(cart(4))*sin(cart(5))*sin(cart(6)) ...
                + sin(cart(4))*cos(cart(6)))*obj.nominal_platformpin(1);
            J(3,3) = J(3,3) + (cos(cart(4))*sin(cart(5))*cos(cart(6)) ...
                - sin(cart(4)) * sin(cart(4)))*obj.nominal_platformpin(2);
            DL_Dd(1:3) = act_unit_vector;
            DL_Dd(4:6) = J * act_unit_vector;
        end
        function value = get.current_stroke(obj)
            value = obj.current_length - obj.nominal_length;
        end
    end %methods
end %classdef