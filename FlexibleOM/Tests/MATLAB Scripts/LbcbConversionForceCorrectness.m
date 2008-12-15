clear all
clear classes
if(libisloaded('newVersion'))
    unloadlibrary('newVersion');
end
if(libisloaded('oldVersion'))
    unloadlibrary('oldVersion');
end
loadlibrary('LBCB_Conversions.dll', 'LBCB_Conversion.h','alias', 'newVersion');
loadlibrary('LBCB_ConversionsOldVersion.dll', 'LBCB_ConversionOldVersion.h','alias', 'oldVersion');
sizze = 0;
calllib('oldVersion','LBCB_Conversion_Init',sizze);
calllib('newVersion','LBCB_Conversion_Init',sizze);
calc = DLL_Calculations();
cartlimits = [ -2 2; -1 1; -1 1; -0.15 0.15; -0.15 0.15; -0.15 0.15];
forcelimits = [ -1950 1950; -950 950; -2900 2900; -10000 10000; -16000 16000; -10000 10000];
movelabels = {'Moved Cart Dx','Moved Cart Dy','Moved Cart Dz','Moved Cart Rx','Moved Cart Ry','Moved Cart Rz'};
[numdofs, dum ] = size(cartlimits);
plotc = [1 1;1 2; 1 3; 2 1; 2 2; 2 3];
for dof = 1:numdofs
    dlow = cartlimits(dof,1);
    dhigh = cartlimits(dof,2);
    dsequence = dlow :(dhigh - dlow)/5 : dhigh;
    low = forcelimits(dof,1);
    high = forcelimits(dof,2);
    sequence = low :(high - low)/10 : high;
    [dum, numpoints] = size(sequence);
    [dum, dnumpoints] = size(dsequence);
    displacements = zeros(dnumpoints,numdofs);
    forces = zeros(numpoints,numdofs);
    input_forces = zeros(dnumpoints, numpoints, numdofs);
    for d = 1:dnumpoints
        displacements(d,dof) = dsequence(d);
        for f = 1:numpoints
            input_forces(d,f,dof) = sequence(d);
        end
    end

    newActForces = calc.newActForces(displacements,input_forces);
    newCartForces = calc.newCartForces(displacements,newActForces);
    error = newCartForces - input_forces
%     ylabel(movelabels{dof});
%     title('New Version Actuator Errors');
%     legend('X1','X2','Y1','Z1','Z2','Z3');
%     newCartDisplacement = calc.newCartDisplacement(oldActValues);
%     error = newCartDisplacement - oldCartValues;
%     subplot(4,3,dof + numdofs); plot(sequence,error);
%     ylabel(movelabels{dof});
%     title('New Version Cartesian Errors');
%     legend('Dx','Dy','Dz','Rx','Ry','Rz');
end
