﻿using log4net;
using MathNet.Numerics.LinearAlgebra.Double;

namespace LbcbConversions
{
    public class RigidTransform
    {
        private DenseVector motionCenter;
        private DenseVector platformCenter = DenseVector.Create(3, 0.0);
        private DenseVector directionalVector;
        private RotationalMatrix roll = new RotationalMatrix(RotationalOrientation.Roll);
        private RotationalMatrix pitch = new RotationalMatrix(RotationalOrientation.Pitch);
        private RotationalMatrix yaw = new RotationalMatrix(RotationalOrientation.Yaw);
        private ILog log = LogManager.GetLogger(typeof(RigidTransform));
        private DenseMatrix collective = DenseMatrix.OfArray(new double[,] {{ 0.0, 1.0, 1.0 },{ 1.0, 0.0, 1.0 },{ 1.0, 1.0, 0.0 }});
        private DenseMatrix transformation;

        public RigidTransform(double[] motionCenter, double [,] transformation)
        {
            this.motionCenter = new DenseVector(motionCenter);
            this.transformation = DenseMatrix.OfArray(transformation);
            List2String l2s = new List2String();
            log.Debug("motionCenter: " + l2s.ToString(this.motionCenter.Values) +
                " platformCenter: " + l2s.ToString(this.platformCenter.Values));
        }

        public double[] transform(double[] displacement, bool isreverse)
        {
            DenseMatrix xform = (isreverse ? (DenseMatrix) transformation.Transpose() : transformation);
            double[] ddisp = new double[6];
            displacement.CopyTo(ddisp, 0);
            DenseMatrix2String m2s = new DenseMatrix2String();
            List2String l2s = new List2String();
            DenseVector dispV = new DenseVector(ddisp);
            log.Debug("original disp: " + l2s.ToString(displacement));
            DenseVector newDisp = translate(displacement, isreverse);
            log.Debug("newDisp: " + l2s.ToString(newDisp.Values));
            DenseMatrix rollM = roll.create(displacement[3]);
            DenseMatrix pitchM = pitch.create(displacement[4]);
            DenseMatrix yawM = yaw.create(displacement[5]);
            DenseMatrix rotation = (DenseMatrix)rollM.Multiply(pitchM.Multiply(yawM));
            log.Debug("rotation: " + m2s.ToString(rotation));
            DenseVector unt = (DenseVector)rotation.Multiply(directionalVector);
            log.Debug("unt: " + l2s.ToString(unt.Values));
            DenseVector newDisp1 = (DenseVector)unt.Add(newDisp);
            log.Debug("newDisp1: " + l2s.ToString(newDisp1.Values));
            dispV.SetSubVector(0, 3, newDisp1);
            dispV = (DenseVector) xform.Multiply(dispV);
            return dispV.Values;
        }
        public double[] transformMoments(double[] forces)
        {
            double [] fforce = new double[6];
            forces.CopyTo(fforce, 0);
            DenseVector forceV = new DenseVector(fforce);
            DenseVector tforce = (DenseVector)forceV.SubVector(0, 3);
            DenseVector moments = (DenseVector) forceV.SubVector(3, 3);

            for (int i = 0; i < 3; i++)
            {
                DenseVector oneMass = (DenseVector) collective.Column(i);
                DenseVectorCrossProduct crs = new DenseVectorCrossProduct(oneMass);
                moments = (DenseVector)crs.crossProduct(directionalVector).Multiply(tforce[i]).Add(moments);
            }
            forceV.SetSubVector(3, 3, moments);
            return forceV.Values;
        }
        private DenseVector translate(double[] displacement, bool isreverse) {
            double[] ddisp = new double[6];
            displacement.CopyTo(ddisp, 0);
            DenseVector translation = DenseVector.Create(3, 0.0); ;
            List2String l2s = new List2String();
            log.Debug("original disp: " + l2s.ToString(displacement));
            DenseVector dispV = new DenseVector(ddisp);
            log.Debug("original disp: " + l2s.ToString(displacement));
            dispV.CopySubVectorTo(translation,0,0,3);
            log.Debug("given trans:" + l2s.ToString(translation.Values) +
                " from: " + l2s.ToString(dispV.Values) + 
                " orig: " + l2s.ToString(displacement));
            DenseVector target;
            DenseVector reference;
            if (isreverse == false)
            {
                log.Debug("Normal Translation");
                directionalVector = (DenseVector)motionCenter.Subtract(platformCenter);
                target = motionCenter;
                reference = platformCenter;
            }
            else
            {
                log.Debug("Reverse Translation");
                directionalVector = (DenseVector)platformCenter.Subtract(motionCenter);
                target = platformCenter;
                reference = motionCenter;
            }
            log.Debug("translation: " + l2s.ToString(translation.Values) + 
                " reference: " + l2s.ToString(reference.Values) + 
                " target: " + l2s.ToString(target.Values));
            DenseVector newDisp = (DenseVector) translation.Add(reference).Subtract(target);
            log.Debug("calculated trans:" + l2s.ToString(newDisp.Values) + 
                " dv: " + l2s.ToString(directionalVector.Values));
            return newDisp;
        }
    }
}