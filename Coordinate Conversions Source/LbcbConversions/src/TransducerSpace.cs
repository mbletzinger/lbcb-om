using log4net;
using MathNet.Numerics.LinearAlgebra.Double;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class TransducerSpace
    {
        protected DispTransducer[] transducers = new DispTransducer[6];
        private DenseVector transducerDisp = new DenseVector(6);
        protected DenseVector cartesianDisp = new DenseVector(6);
        private DenseVector errorWindow;
        private readonly static ILog log = LogManager.GetLogger(typeof(TransducerSpace));
        private double[][] transducerPins;
        private string label;

        public TransducerSpace(String label, double[][] transPins, String [] transLabels, double [] errorWindow)
        {
            this.transducerPins = transPins;

            for (int aps = 0; aps < 6; aps++)
            {
                DispTransducer act = new DispTransducer(transLabels[aps], transPins[aps]);
                transducers[aps] = act;
            }
            this.label = label;
            this.errorWindow = new DenseVector(errorWindow);
        }
        public void setTransducerDisp(double[] adisp)
        {
            solveTransducer2CartesianDisp(adisp);
        }
        public double[] getTransducerDisp()
        {
            return transducerDisp.ToArray();
        }
        public void setCartesianDisp(double[] cdisp)
        {
            cartesianDisp.SetValues(cdisp);
            cartesionDisplacement2Transducers();
            transducers2TransducerDisp();
        }
        public double[] getCartesianDisp()
        {
            return cartesianDisp.ToArray();
        }
        private void cartesionDisplacement2Transducers()
        {
            foreach (DispTransducer a in transducers)
            {
                a.update(cartesianDisp.Values);
            }
        }
        private void transducers2TransducerDisp()
        {
            for (int a = 0; a < 6; a++)
            {
                transducerDisp[a] = transducers[a].getCurrentDisplacement();
            }

        }
        private void solveTransducer2CartesianDisp(double[] adisp)
        {
            bool check = false;
            DenseVector cartDisp = new DenseVector(6);
            DenseVector newAct = new DenseVector(adisp);
            DenseVector actError = (DenseVector)newAct.Subtract(transducerDisp);
            cartesianDisp.CopyTo(cartDisp);
            int iterations = 0;

            while (check == false)
            {
                List2String l2s = new List2String();

                DenseMatrix JacobianMatrix = new DenseMatrix(6, 6);

                for (int i = 0; i < 6; i++)
                {
                    DenseVector DL_Dd = transducers[i].calcNewDiffs(cartDisp.Values);
                    JacobianMatrix.SetRow(i, DL_Dd);
                }
                DenseVector diffCart = (DenseVector)JacobianMatrix.LU().Solve(actError);
                log.Debug("Cartesian differences " + l2s.ToString(diffCart.Values));
                cartDisp = (DenseVector)cartDisp.Add(diffCart);
                setCartesianDisp(cartDisp.Values);
                log.Debug("New cartesian estimate " + this);
                actError = (DenseVector)newAct.Subtract(transducerDisp);
                log.Debug("Transducer error " + l2s.ToString(actError.Values));

                check = withinErrorWindow(actError);
                if (iterations > 20)
                {
                    check = true;
                    log.Error("Calculations for " + label + " won't converge with " + this);
                }
                iterations++;
            }

        }
        private Boolean withinErrorWindow(DenseVector error)
        {
            for (int d = 0; d < 6; d++)
            {
                if (Math.Abs(error[d]) > errorWindow[d])
                {
                    return false;
                }
            }
            return true;
        }
        public override string ToString()
        {
            List2String l2s = new List2String();
            string result = label + ":";
            result += "\nCartD: " + l2s.ToString(cartesianDisp.Values);
            result += "\nTransD: " + l2s.ToString(transducerDisp.Values);
            return result;
        }
        public double[][] getTransducerPins()
        {
            return transducerPins;
        }
        public String getLabel()
        {
            return label;
        }
        public double[] getErrorWindow()
        {
            return errorWindow.ToArray();
        }
    }
}
