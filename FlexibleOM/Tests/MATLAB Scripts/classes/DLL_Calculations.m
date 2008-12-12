classdef DLL_Calculations 
    properties
        type = 1;
        motion_center = [0 0 0];
        cartposition = [0 0 0 0 0 0 ];
        length = 6;
        actposition = zeros(6,1);
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
        function result = newActuatorValues(me,cartvalues)
            sizes = size(cartvalues);
            last = sizes(1);
            result = zeros(last,6);
            for i = 1:last
                cartposition = cartvalues(i,1:6);
                [motionCenterReturn, actPositionReturn, cartPositionReturn ] = ...
                    calllib('newVersion','LBCB_conversion_C2A', ...
                    me.type, me.motion_center, me.actposition, cartposition,me.error);
               result(i,1:6) = actPositionReturn;
            end
        end
        function result = newCartValues(me,actvalues)
            sizes = size(actvalues);
            last = sizes(1);
            result = zeros(last,6);
            for i = 1:last
                actposition = actvalues(i,1:6);
                [motionCenterReturn, actPositionReturn, cartPositionReturn ] = ...
                    calllib('newVersion','LBCB_Conversion_A2C', ...
                    me.type, me.motion_center, me.length, actposition, me.cartposition,me.error);
                result(i,1:6) = cartPositionReturn;
            end
        end
     end
end
    
% actposition = actPositionReturn;
% [motionCenterReturn, actPositionReturn, cartPositionReturn ] = ...
%     calllib('oldVersion','LBCB_Conversion_A2C',...
%     type, motion_center, length, actposition, cartposition,error)
