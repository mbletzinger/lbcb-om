classdef dofMenus < handle
    properties
        checkHandles = [];
        popupHandles = [];
        dofVector = [];
        dataSet = {};
        includeTime = 0;
        useForces = 0;
        includeForces = 0;
    end
    methods
        function me = dofMenus(dataSet,it,ufrc,ifrc)
            me.dataSet = dataSet;
            me.includeTime = it;
            me.useForces = ufrc;
            me.includeForces = ifrc;
        end
        function setCheckHandles(me,handles)
            me.checkHandles = handles;
            me.dofVector = zeros(1,length(handles));
        end
        function setPopupHandles(me,handles)
            me.popupHandles = handles;
            for i = 1:length(handles)
                set(handles(i),'String','None');
            end
        end
        function setMenus(me,idx)
            value = get(me.checkHandles(idx),'Value');
            dofs = [];
            me.dofVector(idx) = value;
            for i  = 1:length(me.dofVector)
                if(me.dofVector(i))
                    dofs = cat(1,i)
                end
            end
            menu = 'None';
            if(me.useForces)
                menu = cat(1,menu, me.dataSet.getForceLabels(dofs))
            elseif(me.includeForces)
                menu = cat(1,menu, me.dataSet.getLabels(dofs,me.includeTime),me.dataSet.getForceLabels(dofs))
            else
                menu = cat(1,menu, me.dataSet.getLabels(dofs,me.includeTime))
            end
            for i = 1:length(me.popupHandles)
                h = me.popupHandles(i);
                idx = get(h,'Value');
                if idx ~= 1
                    oldMenu = get(h,'String');
                    menu(idx) = oldMenu(idx);
                end
                set(h,'String',menu);
            end
        end
        function clearMenus(me)
            for i = 1:length(me.popupHandles)
                set(me.popupHandles,'Value',1);
            end
        end
    end
end