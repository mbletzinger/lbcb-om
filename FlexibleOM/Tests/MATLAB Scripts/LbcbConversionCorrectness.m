clear all
clear classes
if(libisloaded('newVersion'))
    unloadlibrary('newVersion');
end
if(libisloaded('oldVersion'))
    unloadlibrary('oldVersion');
end
loadlibrary('LBCB_ConversionsOldVersion.dll', 'LBCB_ConversionOldVersion.h','alias', 'oldVersion');
loadlibrary('LBCB_Conversions.dll', 'LBCB_Conversion.h','alias', 'newVersion');
sizze = 0;
calllib('oldVersion','LBCB_Conversion_Init',sizze);
calllib('newVersion','LBCB_Conversion_Init',sizze);
calc = DLL_Calculations();
cartlimits = [ -2 2; -1 1; -1 1; -0.15 0.15; -0.15 0.15; -0.15 0.15];
movelabels = {'Moved Cart Dx','Moved Cart Dy','Moved Cart Dz','Moved Cart Rx','Moved Cart Ry','Moved Cart Rz'};
[numdofs, dum ] = size(cartlimits);
plotc = [1 1;1 2; 1 3; 2 1; 2 2; 2 3];
for dof = 1:numdofs
    low = cartlimits(dof,1);
    high = cartlimits(dof,2);
    sequence = low :(high - low)/30 : high;
    [dum, numpoints] = size(sequence);
    data = zeros(numpoints,numdofs);
    inputs = zeros(numpoints,numdofs);
    for d = 1:numpoints
        inputs(d,dof) = sequence(d)
    end
    oldActValues = calc.oldActuatorValues(inputs);
    oldCartValues = calc.oldCartValues(oldActValues);
    error = oldCartValues - inputs;
%    finish
    subplot(2,3,dof); plot(sequence,error);
    ylabel(movelabels{dof});
    title('Old Version Errors');
    grid on;
end
legend('Dx','Dy','Dz','Rx','Ry','Rz');
