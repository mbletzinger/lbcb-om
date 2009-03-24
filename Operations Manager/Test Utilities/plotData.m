classdef plotData < handle
    properties
        data = zeros(4,1);
        label = 'Label';
        lineSeries = cell(4,1);
        xOrY = zeros(4,1);
        haveData = 0;
        haveLineSeries = 0;
    end;
    methods
        function me = plotData(inLabel)
            me.label = Label;
        end;
        function me = addData(inData)
            if(haveData)
                data = cat(1, data,inData);
            else
                data = inData;
                haveData = 1;
            end
        end;
        function addLineSeries(series,inXOrY)
            if(haveLineSeries)
                lineSeries = cat(lineSeries,series);
                xOrY = cat(xOrY,inXOrY);
            else
                lineSeries = series;
                xOrY = inXOrY;
            end
        end
    end;
end