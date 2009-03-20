clear all;
close all;
clc
FileName='Z3voltages.txt';

fid_1=fopen (FileName,'r');
tmp_str=fgets(fid_1);
HeadName=strread (tmp_str,'%s','delimiter','\t');
tmp_str=fgets(fid_1);
Num_step=0;
while tmp_str~=-1
	Num_step=Num_step+1;
	tmp_value=strread (tmp_str,'%s','delimiter','\t');

	GotValue(Num_step,1)=Num_step;
	for i=2:max(size(tmp_value))
		GotValue(Num_step,i)=str2num(tmp_value{i});
	end
	tmp_str=fgets(fid_1);
end
fclose (fid_1);
% Each Data Plot
scrsz = get(0,'ScreenSize');
Title={'CartesianCmd','CartesianDisplRota','CartesianForMom',...
        'ActuatorCmd','ActuatorStroke','ActuatorForMom','ServoError'};
for i=1:7
	fig=figure (i);
	set(fig,'Position',[0 70 scrsz(3) scrsz(4)-150]);
	for j=1:6
		subplot (3,2,j)
		plot (GotValue(:,1),GotValue(:,6*(i-1)+j+1),'r');
		grid on
		xlabel ('Step');
		ylabel (HeadName{6*(i-1)+j+1})
	end
	FigureName=sprintf('%02d_%s.png',i,Title{i});
	saveas (fig,FigureName);
end

% Comparison between Command and Measured Data
k=i;
Title_2={'CartesianComparison','ActuatorComparison'};
for i=1:2
	k=k+1;
	fig=figure (k);
	set(fig,'Position',[0 70 scrsz(3) scrsz(4)-150]);
	for j=1:6
		subplot (3,2,j)
		plot (GotValue(:,1),GotValue(:,18*(i-1)+j+1),'b','LineWidth',2.0);
		hold on
		plot (GotValue(:,1),GotValue(:,18*(i-1)+6+j+1),'r');
		hold off
		grid on
		xlabel ('Step');
		ylabel (HeadName{18*(i-1)+6+j+1});
		legend ('Command','Measured Data');
	end
	FigureName=sprintf('%02d_%s.png',k,Title_2{i});
	saveas (fig,FigureName);
end
% Displ. vs Force
Title_3={'CartesianDisplForce','ActuatorStrokeForce'};
for i=1:2
	k=k+1;
	fig=figure (k);
	set(fig,'Position',[0 70 scrsz(3) scrsz(4)-150]);
	for j=1:6
		subplot (3,2,j)
		plot (GotValue(:,18*(i-1)+j+7),GotValue(:,18*(i-1)+6+j+7),'- .r');
		grid on
		xlabel (HeadName{18*(i-1)+j+7});
		ylabel (HeadName{18*(i-1)+6+j+7});
	end
	FigureName=sprintf('%02d_%s.png',k,Title_3{i});
	saveas (fig,FigureName);
end
