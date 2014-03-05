using MathNet.Numerics.LinearAlgebra.Double;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public enum RotationalOrientation
    {
        Roll,
        Pitch,
        Yaw
    }
    public class RotationalMatrix
    {
        private RotationalOrientation orient;
        public RotationalMatrix(RotationalOrientation orient)
        {
            this.orient = orient;
        }
        public DenseMatrix create(double radians)
        {
            double sine = Math.Sin(radians);
            double cosine = Math.Cos(radians);
            DenseMatrix result = DenseMatrix.CreateIdentity(3);
            switch (orient)
            {
                case RotationalOrientation.Roll:
                    result[0, 0] = cosine;
                    result[1, 2] = -sine;
                    result[2, 1] = sine;
                    result[2, 2] = cosine;
                    break;
                case RotationalOrientation.Pitch:
                    result[0, 0] = cosine;
                    result[0, 2] = sine;
                    result[2, 0] = -sine;
                    result[2, 2] = cosine;
                    break;
                case RotationalOrientation.Yaw:
                    result[0, 0] = cosine;
                    result[0, 1] = -sine;
                    result[1, 0] = sine;
                    result[1, 1] = cosine;
                    break;
            }
            return result;
        }
    }
}
