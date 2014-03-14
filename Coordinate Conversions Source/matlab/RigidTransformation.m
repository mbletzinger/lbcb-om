classdef RigidTransformation < handle
    properties
        motionCenter
        platformCenter
        directionalVector
    end
    methods
        function me = RigidTransformation(motionCenter)
            me.motionCenter = motionCenter;
            me.platformCenter = zeros(1,3);
        end
        function result = transform(me,disp,isreverse)
            result = disp;
            roll = rotationalMatrix(disp(4),1);
            pitch = rotationalMatrix(disp(5),2);
            yaw = rotationalMatrix(disp(6),3);
            trans = me.translate(disp, isreverse)
            rot = roll * pitch * yaw
            unt = rot * me.directionalVector'
            result(1:3) = unt + trans';
        end
        function result = transformForces(me,forces)
            result = forces;
            rotationalM = [0 1 1; 1 0 1; 1 1 0];
            tforce = forces(1:3);
            moments = forces(4:6);
            for d = 1:3
                moments = moments + cross(rotationalM(d,:),me.directionalVector) * tforce(d);
            end
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
            translation = disp(1:3) + reference - target;
        end
    end
end
