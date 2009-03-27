classdef plotData < handle
    properties
        data = zeros(3,1);
        label = 'Label';
        shortLabel = 'Dx';
        haveData=0;
        dofType=0;
    end;
    methods
        function me = plotData(inLabel,short)
            me.label = inLabel;
            me.shortLabel = short;
        end
        
        function me = addData(me,inData)
            if(me.haveData)
                me.data = cat(1, me.data,inData);
            else
                me.haveData = 1;
                me.data = inData;
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