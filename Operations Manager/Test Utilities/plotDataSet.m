classdef plotDataSet < handle
    properties
        sortedLabels = cell(13,1);
        lookupTable = {};
        dataSet = {};
        time = '';
    end
    methods
        function me = plotDataSet(dataSet)
            me.dataSet = dataSet;
            me.lookupTable = cell(length(dataSet),2);
            for d = 1:length(dataSet)
                label = sprintf('%s %s %s',dataSet{d}.cps,dataSet{d}.label,dataSet{d}.shortLabel);
                me.lookupTable{d,1} = label;
                me.lookupTable{d,2} = dataSet(d);
            end
            for i = 0:13
                lbls = {};
                ldx = 0;
                for d = 1:length(dataSet)
                    if(dataSet{d}.dofType == i)
                        ldx = ldx + 1;
                        lbls{ldx} = me.lookupTable{d,1};
%                        echo = sprintf('dof %d ldx %d d %d i %d label %s',dataSet{d}.dofType,ldx,d,i,lbls{ldx})
                    end
                    if(i == 0)
                        me.time = lbls(1);
                    else
                        me.sortedLabels{i} = lbls';
                    end
                end
            end
            
        end
        function results = getLabels(me,dofs, withTime)
            results = {};
            if(withTime)
                results = me.time;
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
    end
end