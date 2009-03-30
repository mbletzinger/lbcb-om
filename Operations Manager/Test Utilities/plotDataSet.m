classdef plotDataSet < handle
    properties
        sortedLabels = cell(13,1);
        lookupTable = {};
        dataSet = {};
        timeLabel = '';
        timeData={}; 
    end
    methods
        function me = plotDataSet(dataSet,timeData)
            me.dataSet = dataSet;
            me.timeData = timeData;
            me.timeLabel = timeData.label;
            me.lookupTable = cell(length(dataSet),2);
            for d = 1:length(dataSet)
                label = sprintf('%s %s %s',dataSet{d}.cps,dataSet{d}.label,dataSet{d}.shortLabel);
                me.lookupTable{d,1} = label;
                me.lookupTable{d,2} = me.dataSet(d);
            end
            for i = 1:13
                lbls = {};
                ldx = 0;
                for d = 1:length(dataSet)
                    if(dataSet{d}.dofType == i)
                        ldx = ldx + 1;
                        lbls{ldx} = me.lookupTable{d,1};
                        %                        echo = sprintf('dof %d ldx %d d %d i %d label %s',dataSet{d}.dofType,ldx,d,i,lbls{ldx})
                    end
                end
                me.sortedLabels{i} = lbls';
            end
            
        end
        function results = getLabels(me,dofs, withTime)
            results = {};
            if(withTime)
                results = me.timeLabel;
            end
            for i = 1:length(dofs)
                results = cat(1,results, me.sortedLabels{dofs(i)});
            end
        end
        function results = getForceLabels(me,dispDofs)
            results = {};
            for i = 1:length(dispDofs)
                results = cat(1,results, me.sortedLabels{dispDofs(i)+6});
            end
        end
        function results = findData(me,label)
            results = {};
            for i=1:length(me.dataSet)
                if  strcmp(me.lookupTable{i,1},label)
                    results = me.lookupTable{i,2};
                    return
                end
            end
        end
    end %methods
end % classdef