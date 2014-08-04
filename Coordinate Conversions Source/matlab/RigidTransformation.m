classdef RigidTransformation < handle
    properties
        motionCenter
        platformCenter
        directionalVector
        transformMatrix
    end
    methods
        function me = RigidTransformation(motionCenter, transformMatrix)
            me.motionCenter = motionCenter;
            me.platformCenter = zeros(1,3);
            me.transformMatrix = transformMatrix;
        end
        function result = transform(me,disp,isreverse)
            xform = me.transformMatrix;
            result = disp;
            if size(result,1) == 1
                result = disp';
            end
            if isreverse
                result = xform\result;
            end
            roll = rotationalMatrix(result(4),1);
            pitch = rotationalMatrix(result(5),2);
            yaw = rotationalMatrix(result(6),3);
            trans = me.translate(result, isreverse);
            rot = roll * pitch * yaw;
            unt = rot * me.directionalVector';
            result(1:3) = unt + trans';
            if isreverse == false
                result = xform * result;
            end
            if size(disp,1) == 1
                result = result';
            end
        end
        function result = transformForces(me,forces)
            result = forces;
            rotationalM = eye(3);
            tforce = forces(1:3);
            moments = forces(4:6);
            for d = 1:3
                moments = moments + cross(rotationalM(d,:),me.directionalVector) * tforce(d);
            end
            result(4:6) = moments;
        end
        function result = transformForces2(me,forces)
            result = forces;
            tforce = forces(1:3);
            moments = forces(4:6);
            moments = moments + cross(tforce,me.directionalVector);
            result(4:6) = moments;
        end
        function translation = translate(me,disp,isreverse)
            if(isreverse)
                reference = me.motionCenter;
                target = me.platformCenter;
            else
                reference = me.platformCenter;
                target = me.motionCenter;
            end
            me.directionalVector = target - reference;
            translation = disp(1:3)' + reference - target;
        end
    end
end
