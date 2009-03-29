classdef plotData < handle
    properties
        data = zeros(3,1);
        label = 'Label';
        shortLabel = 'Dx';
        cps = 'LBCB1';
        haveData=0;
        dofType=0;
    end;
    methods
        function me = plotData(label,short,cps)
            me.label = label;
            me.shortLabel = short;
            me.cps = cps;
        end
        
        function me = addData(me,data)
            if(me.haveData)
                me.data = cat(1, me.data,data);
            else
                me.haveData = 1;
                me.data = data;
            end
        end
        
        function attachLineSeries(me,series,idx,isXData)
            if(isXData)
                set(series,'XDataSource',me.data);
            else
                set(series,'YDataSource',me.data);
            end
        end
        function setDofType(me,dof)
            me.dofType = dof;
        end
    end
end