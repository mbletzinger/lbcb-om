function sensors = loadSensorsTxt(folder,lbcbNumber, errorWindows)
pinFile = 'L[X]_SensorPins.txt';
labelFile = 'L[X]_SensorLabels.txt';
file = strrep(pinFile,'[X]',sprintf('%d',lbcbNumber));
path = fullfile(folder,file);
pins = load(path);
file = strrep(labelFile,'[X]',sprintf('%d',lbcbNumber));
path = fullfile(folder,file);
labels = load(path);
sensors = TransducersSpace(pins, sprintf('L%d_Sensors',lbcbNumber), labels, errorWindows);
end
