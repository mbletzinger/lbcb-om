classdef LBCB < handle
    properties
       actuators = [Actuator(), Actuator(), Actuator(),Actuator(),Actuator(),Actuator()];
       error_tolerance = [0.00001,0.00001,0.00001,0.00001,0.00001,0.00001];
       iterations = 10;
    end %properties
    methods
        function stroke = currentActuatorStroke(obj)
            stroke = zeros(1,6);
            for i = 1:6
                stroke(i) = obj.actuators(i).current_stroke;
            end
        end
        function unit_vector = unitVector(obj)
           unit_vector = zeros(6,6);
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
        function actuator_force = cartesian2ActuatorForce(obj,cart_force)
           actuator_force = linsolve(obj.unitVector(),cart_force); 
        end
        function actuator_stroke = cartesian2ActuatorDisplacement(obj, cart_disp)
            actuator_stroke = zeros(1,6);
            for i = 1:6
                obj.actuators(i) = obj.actuators(i).cartesianInput(cart_disp);
                actuator_stroke(i) = obj.actuators(i).current_stroke;
            end
        end
        function cartesian_disp = actuator2CartesianDisplacement(obj, actuator_stroke,last_cartesian)
            initial_strokes = zeros(1,6);
            check = zeros(6);
            for i = 1:6
                initial_strokes(i) = obj.actuators(i).current_stroke;
            end
            error = (actuator_stroke - initial_strokes)';
            current_cartesian = last_cartesian;
            jacobian_matrix = zeros(6);
            iter = 0;
            while check ~= true(6)
                for i = 1:6
                    rowJ = obj.actuators(i).jacobian(current_cartesian);
                    jacobian_matrix(i,1:6) = rowJ;
                end
                   jacobian_matrix
                   d_cartesian = linsolve(jacobian_matrix,error)
                check = abs(d_cartesian) > obj.error_tolerance;
                iter = iter + 1;
                if iter >= obj.iterations
                    check = true(6);
                end
            end
            cartesian_disp = current_cartesian;
        end
        function cartesian_force = actuator2CartesianForce(obj, loadcell_reading)
            unit_vectors = obj.unitVector();
            for i = 1:6
                cartesian_force = cartesian_force + unit_vectors(1:6,i) * loadcell_reading(i);
            end
        end
    end %methods
end %classdef