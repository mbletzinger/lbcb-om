classdef DLL_Calculations 
    properties
        type = 1;
        motion_center = [0 0 0];
        cartposition = [0 0 0 0 0 0 ];
        length = 6;
        actposition = zeros(6,1);
        actforces = zeros(6,1);
        cartforces = zeros(6,1);
        error = 0;
    end
    methods
        function result = oldActuatorValues(me,cartvalues)
            sizes = size(cartvalues);
            last = sizes(1);
            result = zeros(last,6);
            for i = 1:last
                cartposition = cartvalues(i,1:6);
                [motionCenterReturn, actPositionReturn, cartPositionReturn ] = ...
                    calllib('oldVersion','LBCB_conversion_C2A', ...
                    me.type, me.motion_center, me.actposition, cartposition,me.error);
               result(i,1:6) = actPositionReturn;
            end
        end
        function result = oldCartValues(me,actvalues)
            sizes = size(actvalues);
            last = sizes(1);
            result = zeros(last,6);
            for i = 1:last
                actposition = actvalues(i,1:6);
                [motionCenterReturn, actPositionReturn, cartPositionReturn ] = ...
                    calllib('oldVersion','LBCB_Conversion_A2C', ...
                    me.type, me.motion_center, me.length, actposition, me.cartposition,me.error);
                result(i,1:6) = cartPositionReturn;
            end
        end
        function result = newActuatorDisplacements(me,cartvalues)
            sizes = size(cartvalues);
            last = sizes(1);
            result = zeros(last,6);
            for i = 1:last
                cartposition = cartvalues(i,1:6);
                [actPositionReturn, cartPositionReturn ] = ...
                    calllib('newVersion','LBCB_Conversion_C2A_Displacement', ...
                    me.type, me.actposition, cartposition,me.error);
               result(i,1:6) = actPositionReturn;
            end
        end
        function result = newActForces(me,cartdispvalues, cartforcevalues)
            sizes = size(cartforcevalues);
            dsizes = size(cartdispvalues);
            last = sizes(2);
            dlast = dsizes(1);
            result = zeros(dlast,last,6);
            for d = 1:dlast
                cartposition = cartdispvalues(d,1:6);
                [actPositionReturn, cartPositionReturn ] = ...
                    calllib('newVersion','LBCB_Conversion_C2A_Displacement', ...
                    me.type, me.actposition, cartposition,me.error);                
                for f = 1:last
                    cartforces = cartforcevalues(d,f,1:6);
                    [actForcesReturn, cartForcesReturn, errorReturn ] = ...
                        calllib('newVersion','LBCB_Conversion_C2A_Forces', ...
                        me.type, me.actforces, cartforces,me.error);
                result(d,f,1:6) = actForcesReturn;
                end
            end
        end
        function result = newCartDisplacements(me,actvalues)
            sizes = size(actvalues);
            last = sizes(1);
            result = zeros(last,6);
            for i = 1:last
                actposition = actvalues(i,1:6);
                [actPositionReturn, cartPositionReturn ] = ...
                    calllib('newVersion','LBCB_Conversion_A2C_Displacement', ...
                    me.type, actposition, me.cartposition,me.error);
                result(i,1:6) = cartPositionReturn;
            end
        end
        function result = newCartForces(me,cartdispvalues, actforcevalues)
            sizes = size(actforcevalues);
            dsizes = size(cartdispvalues);
            last = sizes(2);
            dlast = dsizes(1);
            result = zeros(dlast,last,6);
            for d = 1:dlast
                cartposition = cartdispvalues(d,1:6);
                [actPositionReturn, cartPositionReturn ] = ...
                    calllib('newVersion','LBCB_Conversion_C2A_Displacement', ...
                    me.type, me.actposition, cartposition,me.error);                
                for f = 1:last
                    actforces = actforcevalues(d,f,1:6);
                    [actPositionReturn, cartPositioReturn, cartForcesReturn, errorReturn ] = ...
                        calllib('newVersion','LBCB_Conversion_A2C_Forces', ...
                        me.type, actforces, cartposition, me.cartforces,me.error);
                    result(d,f,1:6) = cartForcesReturn;
                end
            end
        end
     end
end
    
% actposition = actPositionReturn;
% [motionCenterReturn, actPositionReturn, cartPositionReturn ] = ...
%     calllib('oldVersion','LBCB_Conversion_A2C',...
%     type, motion_center, length, actposition, cartposition,error)
