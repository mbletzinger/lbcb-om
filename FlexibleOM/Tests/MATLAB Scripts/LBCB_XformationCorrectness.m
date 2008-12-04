c1 = [0 0 0 0 0 0 ];
c2 = [.1 0 0 0 0 0 ];
c3 = [.2 0 0 0 0 0 ];
c4 = [.3 0 0 0 0 0 ];
c5 = [.4 0 0 0 0 0 ];
Param = LBCB_Geometry();
lbcb = Param.createLBCB(0);
a1 = lbcb.cartesian2ActuatorDisplacement(c1)
a2 = lbcb.cartesian2ActuatorDisplacement(c2)
a3 = lbcb.cartesian2ActuatorDisplacement(c3)
a4 = lbcb.cartesian2ActuatorDisplacement(c4)
a5 = lbcb.cartesian2ActuatorDisplacement(c5)

