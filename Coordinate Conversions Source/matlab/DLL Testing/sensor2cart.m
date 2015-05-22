function cart = sensor2cart( sensors, trans )
% sensor2cart converts transducer lengths to cartesian displacments using
% the LbcbConversions DLL.
sensors.setTransducerDisp(trans);
dcart = sensors.getCartesianDisp();
cart = zeros(1,6);
for d = 1:6
    cart(d) = double(dcart(d));
end

