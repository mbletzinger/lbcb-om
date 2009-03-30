classdef plotSettings < handle
    properties
        xdata = cell(1,1);
        ydata = cell(20,1);
        lineSeries = [];
    end
    methods
        function me = setXdata(me,data,idx)
            me.xdata = data;
            for l = 1:length(me.lineSeries)
                data.attachLineSeries(me.lineSeries(l),idx,1);
            end
        end
        function me = setYdata(me,data,idx)
            me.ydata{idx} = data;
            data.attachLineSeries(me.lineSeries(idx),idx,0);
        end
        function me = setLineSeries(me,series)
            me.lineSeries = series;
        end
    end
end