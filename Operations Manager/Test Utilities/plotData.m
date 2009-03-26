classdef plotData < handle
    properties
        data = zeros(3000,1);
        label = 'Label';
        lineSeries = cell(20,2);
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
            [lgth, d] = lineSeries;
            lineSeries(lgth,1) = series;
            lineSeries(lgth,2) = inXOrY;
        end
        function removeLineSeries(series)
            
        end
    end;
end