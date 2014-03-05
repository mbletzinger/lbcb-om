function diffs = jacobianDiffs(iplatPins, cplatPins, fixPins,cartesian)

rotTrig = zeros(3, 2);
rotTrig(1, 1) = sin(cartesian(4));
rotTrig(1, 2) = cos(cartesian(4));
rotTrig(2, 1) = sin(cartesian(5));
rotTrig(2, 2) = cos(cartesian(5));
rotTrig(3, 1) = sin(cartesian(6));
rotTrig(3, 2) = cos(cartesian(6));
Ppx = iplatPins(1);
Ppy = iplatPins(2);
Ppz = iplatPins(3);

phai = cplatPins - fixPins;

phai = phai/norm(phai);

J = zeros(3, 3);
% Jacobian Element
J(1, 1) = 1;
J(1, 2) = -rotTrig(2, 1) * rotTrig(3, 2) * Ppx + rotTrig(2, 1) * rotTrig(3, 1) * Ppy + rotTrig(2, 2) * Ppz;
J(1, 3) = -rotTrig(2, 2) * rotTrig(3, 1) * Ppx - rotTrig(2, 2) * rotTrig(3, 2) * Ppy;
J(2, 1) = (rotTrig(1, 2) * rotTrig(2, 1) * rotTrig(3, 2) - rotTrig(1, 1) * rotTrig(3, 1)) * Ppx +...
    (-rotTrig(1, 2) * rotTrig(2, 1) * rotTrig(3, 1) - rotTrig(1, 1) * rotTrig(1, 2)) * Ppy...
    - rotTrig(1, 2) * rotTrig(2, 2) * Ppz;
J(2, 2) = rotTrig(1, 1) * rotTrig(2, 2) * rotTrig(3, 2) * Ppx - rotTrig(1, 1) * rotTrig(2, 2) * rotTrig(3, 1) * Ppy...
    - rotTrig(1, 1) * rotTrig(2, 2) * Ppz;
J(2, 3) = (-rotTrig(1, 1) * rotTrig(2, 1) * rotTrig(3, 1) * rotTrig(1, 2) * rotTrig(3, 2)) * Ppx +...
    (-rotTrig(1, 1) * rotTrig(2, 1) * rotTrig(3, 2) - rotTrig(1, 2) * rotTrig(3, 1)) * Ppy;
J(3, 1) = (rotTrig(1, 1) * rotTrig(2, 1) * rotTrig(3, 2) + rotTrig(1, 2) * rotTrig(3, 1)) * Ppx +...
    (-rotTrig(1, 1) * rotTrig(2, 1) * rotTrig(3, 1) + rotTrig(1, 2) * rotTrig(3, 2)) * Ppy...
    - rotTrig(1, 1) * rotTrig(2, 2) * Ppz;
J(3, 2) = -rotTrig(1, 2) * rotTrig(2, 2) * rotTrig(3, 2) * Ppx + rotTrig(1, 2) * rotTrig(2, 2) * rotTrig(3, 1) * Ppy...
    - rotTrig(1, 2) * rotTrig(2, 1) * Ppz;
J(3, 3) = (rotTrig(1, 2) * rotTrig(2, 1) * rotTrig(3, 1) + rotTrig(1, 1) * rotTrig(3, 2)) * Ppx...
    + (rotTrig(1, 2) * rotTrig(2, 1) * rotTrig(3, 2) - rotTrig(1, 1) * rotTrig(3, 1)) * Ppy;

rphai = [ (J(1, 1) * phai(1) + J(2, 1) * phai(2) + J(3, 1) * phai(3))...
    (J(1, 2) * phai(1) + J(2, 2) * phai(2) + J(3, 2) * phai(3))...
    (J(1, 3) * phai(1) + J(2, 3) * phai(3) + J(3, 3) * phai(3))];
diffs = zeros(6,1);
diffs(1:3) = phai;
diffs(4:6) = rphai;
end
