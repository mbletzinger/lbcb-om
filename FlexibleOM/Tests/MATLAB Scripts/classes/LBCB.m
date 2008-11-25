classdef LBCB
    properties
       actuators = [Actuator(), Actuator(), Actuator(),Actuator(),Actuator(),Actuator()];
       current_cartesian = [0,0,0,0,0,0 ];
       error_tolerance = [0.00001,0.00001,0.00001,0.00001,0.00001,0.00001];
       iterations = 10;
    end %properties
    methods
        function stroke = currentActuatorStroke(obj)
            stroke = zeros(6);
            for i = 1:6
                stroke(i) = obj.actuators(i).current_stroke;
            end
        end
        function unit_vector = unitVector(obj)
           unit_vector = zeroes(6,6);
           for i = 1:6
               basePin = obj.actuators(i).basepin;
               strokeVector = obj.actuators(i).current_platformpin - basePin;
               dirVector = strokeVector/max(strokeVector);
               length = dot(basePin, dirVector);
               momentVector = cross((basePin - length * dirVector),dirVector);
               unit_vector(1:3,i) = dirVector;
               unit_vector(4:6,i) = momentVector;               
           end
        end
        function actuator_force = actuatorForce(obj,cart_force)
           actuator_force = linsolve(obj.unitVector(),cart_force); 
        end
        function actuator_stroke = actuatorDisplacement(obj, cart_disp)
            actuator_stroke = zeroes(6);
            for i = 1:6
                obj.actuators(i).cartesianInput(cart_disp);
                actuator_stroke = obj.actuators(i).current_length;
            end
        end
        function cartesian_disp = actuator2CartesianDisplacement(obj, actuator_stroke,last_cartesian)
            initial_strokes = zeroes(6);
            check = zeroes(6);
            for i = 1:6
                initial_strokes = obj.actuators(i).current_length;
            end
            error = actuator_stroke - initial_strokes;
            current_cartesian = last_cartesian;
            jacobian_matrix = zeroes(6,6);
            iter = 0;
            while check ~= true(6)
                for i = 1:6
                    jacobian_matrix(i) = obj.actuators(i).jacobian(current_cartesian);
                end

                   d_cartesian = linsolve(jacobian_matrix,error);
            
                check = abs(d_cartesian) > obj.error_tolerance;
                iter = iter + 1;
                if iter >= obj.iterations
                    check = true(6);
                end
            end
            cartesian_disp = current_cartesian;
        end
        function cartesian_force = cartesianForce(obj, loadcell_reading)
            unit_vectors = obj.unitVector();
            for i = 1:6
                cartesian_force = cartesian_force + unit_vectors(1:6,i) * loadcell_reading(i);
            end
        end
    end %methods
end %classdef