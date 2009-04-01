classdef plotSettings < handle
    properties
        xdata = cell(1,1);
        ydata = cell(20,1);
        lineSeries = [];
        legends = {};
    end
    methods
        function me = setXData(me,data,idx)
            me.xdata = data;
            data.attachLineSeries(me.lineSeries(idx),idx,1);
       end
        function me = setYData(me,data,idx)
            me.ydata{idx} = data;
            data.attachLineSeries(me.lineSeries(idx),idx,0);
            lgnds = me.legends;
            lgnds{idx} = data.shortLabel;
            me.legends = lgnds
            legend(me.lineSeries,lgnds);
        end
        function me = setLineSeries(me,series)
            me.lineSeries = series;
            lgnds = cell(length(series),1);
            for i = 1:length(series)
                lgnds{i} = '';
            end
            me.legends = lgnds;
           legend(series,lgnds);
        end
        function me = clearPlot(me,idx)
            set(me.lineSeries(idx),'XData',0);
            set(me.lineSeries(idx),'YData',0);
            lgnds = me.legends;
            lgnds{idx} = '';
            me.legends = lgnds;
            legend(me.lineSeries,lgnds);
        end
    end
end