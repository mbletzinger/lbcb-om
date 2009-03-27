classdef dofLabelFilter < handle
    properties
        labels = cell(13,1);
        time = '';
    end
    methods
        function me = dofLabelFilter(dataSet)
            for i = 0:13
                lbls = {};
                ldx = 0;
                for d = 1:length(dataSet)
                    if(dataSet{d}.dofType == i)
                        ldx = ldx + 1;
                        lbls{ldx} = sprintf('%s %s',dataSet{d}.label,dataSet{d}.shortLabel);
%                        echo = sprintf('dof %d ldx %d d %d i %d label %s',dataSet{d}.dofType,ldx,d,i,lbls{ldx})
                    end
                    if(i == 0)
                        me.time = lbls(1);
                    else
                        me.labels{i} = lbls';
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
                results = cat(1,results, me.labels{dofs(i)});
            end
        end
        function results = getForceLabels(me,dispDofs)
            results = {};
            for i = 1:length(dispDofs)
                results = cat(1,results, me.labels{dispDofs(i)+6});
            end
        end
    end
end