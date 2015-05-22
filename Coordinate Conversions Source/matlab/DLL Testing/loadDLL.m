function sensors = loadDLL( pinfile, labelfile, errorWindows )
%loadDLL loads the .NET assembly and creates a sensor object for converting
%lengths to cartesian displacements.

lf = fopen(labelfile);
lbls = textscan(lf,'%s',6,'Delimiter','\t');
fclose(lf);
pinsM = load(pinfile);
pinsM = pinsM';
pins = pinsM(:);
if(IsAssemblyAdded('LbcbConversions') == false) 
    netfile = fullfile(pwd,'DLL Copy','LbcbConversions.dll');
    NET.addAssembly(netfile);
end
fac = LbcbConversions.ConversionFactory;
fac.setSensors(false, pins, lbls{:}, errorWindows);
sensors = fac.getSensors(false);
end

