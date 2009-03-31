classdef plotSettings < handle
    properties
        xdata = cell(1,1);
        ydata = cell(20,1);
        lineSeries = [];
    end
    methods
        function me = setXData(me,data,idx)
            me.xdata = data;
            data.attachLineSeries(me.lineSeries(idx),idx,1);
        end
        function me = setYData(me,data,idx)
            me.ydata{idx} = data;
            data.attachLineSeries(me.lineSeries(idx),idx,0);
        end
        function me = setLineSeries(me,series)
            me.lineSeries = series;
        end
        function me = clearPlot(me,idx)
            set(series,'XData',0);
            set(series,'YData',0);
        end
    end
end