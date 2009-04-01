classdef plotSettings < handle
    properties
        xdata = cell(1,1);
        ydata = cell(8,1);
        lineSeries = [];
        legends = {};
    end
    methods
        function me = setXData(me,data,idx)
            me.xdata = data;
            for i = 1:8
                d = me.ydata{i};
                if(isobject(d))
                    data.attachLineSeries(me.lineSeries(i),i,1);
                end
            end
        end
        function me = setYData(me,data,idx)
            me.ydata{idx} = data;
            data.attachLineSeries(me.lineSeries(idx),idx,0);
            xd = me.xdata;
            xd.attachLineSeries(me.lineSeries(idx),idx,1);
            lgnds = me.legends;
            lgnds{idx} = data.shortLabel;
            me.legends = lgnds;
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
        function me = clearAll(me)
            lgnds = cell(length(me.lineSeries),1);
            for i = 1:length(me.lineSeries)
                set(me.lineSeries(i),'XData',0);
                set(me.lineSeries(i),'YData',0);
                lgnds{i} = '';
            end
            me.legends = lgnds;
            legend(me.lineSeries,lgnds);
        end
        function me = plotPopup(me)
            y = cell(8,1);
            x = cell(8,1);
            for i = 1:8
                d = me.ydata{i};
                if(isobject(d))
                    y{i} = d.data;
                    x{i} = me.xdata.data;
                else
                    y{i} = 0;
                    x{i} = 0;
                end
            end
            figure
            ls = plot(x{1},y{1},'k',x{2},y{2},'b',x{3},y{3},'r',x{4},y{4},'g',x{5},y{5},'m',x{6},y{6},':k',x{7},y{7},':b',x{8},y{8},':r');
            
            legend(ls,me.legends);
        end
    end
end