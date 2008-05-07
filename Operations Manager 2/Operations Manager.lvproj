<?xml version='1.0'?>
<Project Type="Project" LVVersion="8508002">
   <Item Name="My Computer" Type="My Computer">
      <Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="server.tcp.enabled" Type="Bool">false</Property>
      <Property Name="server.tcp.port" Type="Int">0</Property>
      <Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
      <Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
      <Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
      <Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="specify.custom.address" Type="Bool">false</Property>
      <Item Name="Config" Type="Folder">
         <Item Name="Config_Default.xml" Type="Document" URL="Config/Config_Default.xml"/>
         <Item Name="Config_Default.xml.bak" Type="Document" URL="Config/Config_Default.xml.bak"/>
         <Item Name="Config_Default2.xml" Type="Document" URL="Config/Config_Default2.xml"/>
         <Item Name="Config_Default_bak.xml" Type="Document" URL="Config/Config_Default_bak.xml"/>
         <Item Name="Config_Default_large.xml" Type="Document" URL="Config/Config_Default_large.xml"/>
         <Item Name="Config_Default_small.xml.xml" Type="Document" URL="Config/Config_Default_small.xml.xml"/>
         <Item Name="Config_Default_small2.xml" Type="Document" URL="Config/Config_Default_small2.xml"/>
         <Item Name="NTCP Socket.ini" Type="Document" URL="Config/NTCP Socket.ini"/>
      </Item>
      <Item Name="Coordinate Alignment" Type="Folder">
         <Item Name="CoordinateAlignment061807.txt" Type="Document" URL="Coordinate Alignment/CoordinateAlignment061807.txt"/>
         <Item Name="CoordinateAlignment061907.txt" Type="Document" URL="Coordinate Alignment/CoordinateAlignment061907.txt"/>
         <Item Name="DataCheck.txt" Type="Document" URL="Coordinate Alignment/DataCheck.txt"/>
         <Item Name="DataCheckOrg.txt" Type="Document" URL="Coordinate Alignment/DataCheckOrg.txt"/>
         <Item Name="GetTransformation.asv" Type="Document" URL="Coordinate Alignment/GetTransformation.asv"/>
         <Item Name="InputDualLBCB.txt" Type="Document" URL="Coordinate Alignment/InputDualLBCB.txt"/>
         <Item Name="KryptonDualContinuous.txt" Type="Document" URL="Coordinate Alignment/KryptonDualContinuous.txt"/>
         <Item Name="KryptonDualContinuous0613.txt" Type="Document" URL="Coordinate Alignment/KryptonDualContinuous0613.txt"/>
         <Item Name="KryptonDualStepWise.txt" Type="Document" URL="Coordinate Alignment/KryptonDualStepWise.txt"/>
         <Item Name="KryptonDualStepWise0613.txt" Type="Document" URL="Coordinate Alignment/KryptonDualStepWise0613.txt"/>
         <Item Name="PlotKryptonData.asv" Type="Document" URL="Coordinate Alignment/PlotKryptonData.asv"/>
         <Item Name="Test1_61207_DynamicLBCB1.txt" Type="Document" URL="Coordinate Alignment/Test1_61207_DynamicLBCB1.txt"/>
         <Item Name="Test1_61207_DynamicLBCB2.txt" Type="Document" URL="Coordinate Alignment/Test1_61207_DynamicLBCB2.txt"/>
         <Item Name="Test1_61307_LBCB1Dynamic.txt" Type="Document" URL="Coordinate Alignment/Test1_61307_LBCB1Dynamic.txt"/>
         <Item Name="Test1_61307_LBCB2Dynamic.txt" Type="Document" URL="Coordinate Alignment/Test1_61307_LBCB2Dynamic.txt"/>
         <Item Name="Transformation.txt" Type="Document" URL="Coordinate Alignment/Transformation.txt"/>
         <Item Name="Transformation061907.txt" Type="Document" URL="Coordinate Alignment/Transformation061907.txt"/>
      </Item>
      <Item Name="Data Transmission" Type="Folder">
         <Item Name="Data Transmission Launcher.vi" Type="VI" URL="Data Transmission/Data Transmission Launcher.vi"/>
         <Item Name="Data Transmission Test.vi" Type="VI" URL="Data Transmission/Data Transmission Test.vi"/>
         <Item Name="DataTransmissionActions.vi" Type="VI" URL="Data Transmission/DataTransmissionActions.vi"/>
         <Item Name="DataTransmissionGlobals.vi" Type="VI" URL="Data Transmission/DataTransmissionGlobals.vi"/>
         <Item Name="DataTransmissionTcpWriter.vi" Type="VI" URL="Data Transmission/DataTransmissionTcpWriter.vi"/>
         <Item Name="TransmitData.vi" Type="VI" URL="Data Transmission/TransmitData.vi"/>
         <Item Name="LaunchDataTransmissionTcpWriterVi.vi" Type="VI" URL="Data Transmission/LaunchDataTransmissionTcpWriterVi.vi"/>
      </Item>
      <Item Name="DigitalFilter" Type="Folder">
         <Item Name="Butter8thWn0008.txt" Type="Document" URL="DigitalFilter/Butter8thWn0008.txt"/>
         <Item Name="Butter8thWn004.txt" Type="Document" URL="DigitalFilter/Butter8thWn004.txt"/>
         <Item Name="Butter8thWn005.txt" Type="Document" URL="DigitalFilter/Butter8thWn005.txt"/>
         <Item Name="Butter8thWn01.txt" Type="Document" URL="DigitalFilter/Butter8thWn01.txt"/>
         <Item Name="Butter8thWn02.txt" Type="Document" URL="DigitalFilter/Butter8thWn02.txt"/>
      </Item>
      <Item Name="DLL" Type="Folder">
         <Item Name="AdaptiveMiddleLoop.dll" Type="Document" URL="DLL/AdaptiveMiddleLoop.dll"/>
         <Item Name="AutoBalance.dll" Type="Document" URL="DLL/AutoBalance.dll"/>
         <Item Name="AutoBalance2.dll" Type="Document" URL="DLL/AutoBalance2.dll"/>
         <Item Name="FunctionGenerator.dll" Type="Document" URL="DLL/FunctionGenerator.dll"/>
         <Item Name="LBCB_Conversion_A2C.dll" Type="Document" URL="DLL/LBCB_Conversion_A2C.dll"/>
         <Item Name="LBCB_Conversion_C2A.dll" Type="Document" URL="DLL/LBCB_Conversion_C2A.dll"/>
         <Item Name="MiddlePIDController.dll" Type="Document" URL="DLL/MiddlePIDController.dll"/>
         <Item Name="MixedMode2DirecMethod.dll" Type="Document" URL="DLL/MixedMode2DirecMethod.dll"/>
         <Item Name="MixedModeControl2Step.dll" Type="Document" URL="DLL/MixedModeControl2Step.dll"/>
         <Item Name="RampHold.dll" Type="Document" URL="DLL/RampHold.dll"/>
         <Item Name="StepwiseRamp.dll" Type="Document" URL="DLL/StepwiseRamp.dll"/>
      </Item>
      <Item Name="External Actuators" Type="Folder">
         <Item Name="Actuator Actions.ctl" Type="VI" URL="External Actuators/Actuator Actions.ctl"/>
         <Item Name="Actuator Commands.ctl" Type="VI" URL="External Actuators/Actuator Commands.ctl"/>
         <Item Name="Actuator Direct DAQ.vi" Type="VI" URL="External Actuators/Actuator Direct DAQ.vi"/>
         <Item Name="Actuator Feedback.ctl" Type="VI" URL="External Actuators/Actuator Feedback.ctl"/>
         <Item Name="Actuator Global Values.vi" Type="VI" URL="External Actuators/Actuator Global Values.vi"/>
         <Item Name="External Actuator Control Test.vi" Type="VI" URL="External Actuators/External Actuator Control Test.vi"/>
         <Item Name="External Actuator Control.vi" Type="VI" URL="External Actuators/External Actuator Control.vi"/>
         <Item Name="External Control Test.vi" Type="VI" URL="External Actuators/External Control Test.vi"/>
         <Item Name="RampHold_Ext.vi" Type="VI" URL="External Actuators/RampHold_Ext.vi"/>
         <Item Name="RampHold_Test.vi" Type="VI" URL="External Actuators/RampHold_Test.vi"/>
      </Item>
      <Item Name="IconFiles" Type="Folder">
         <Item Name="LBCB Operation Manager.ico" Type="Document" URL="IconFiles/LBCB Operation Manager.ico"/>
         <Item Name="NTCP socket.ico" Type="Document" URL="IconFiles/NTCP socket.ico"/>
         <Item Name="Thumbs.db" Type="Document" URL="IconFiles/Thumbs.db"/>
      </Item>
      <Item Name="image" Type="Folder">
         <Item Name="LBCB.bmp" Type="Document" URL="image/LBCB.bmp"/>
         <Item Name="Thumbs.db" Type="Document" URL="image/Thumbs.db"/>
         <Item Name="UILogoCL1c_mdf.bmp" Type="Document" URL="image/UILogoCL1c_mdf.bmp"/>
      </Item>
      <Item Name="InputData" Type="Folder">
         <Item Name="Check_DualLBCB.txt" Type="Document" URL="InputData/Check_DualLBCB.txt"/>
         <Item Name="Check_DualLBCB2.txt" Type="Document" URL="InputData/Check_DualLBCB2.txt"/>
         <Item Name="EC_Check.txt" Type="Document" URL="InputData/EC_Check.txt"/>
         <Item Name="EC_Input.txt" Type="Document" URL="InputData/EC_Input.txt"/>
         <Item Name="EC_Input2.txt" Type="Document" URL="InputData/EC_Input2.txt"/>
         <Item Name="EC_Input3.txt" Type="Document" URL="InputData/EC_Input3.txt"/>
         <Item Name="EC_Input4.txt" Type="Document" URL="InputData/EC_Input4.txt"/>
         <Item Name="ExampleData.txt" Type="Document" URL="InputData/ExampleData.txt"/>
         <Item Name="ExampleData2.txt" Type="Document" URL="InputData/ExampleData2.txt"/>
         <Item Name="KryptonTestInput1.txt" Type="Document" URL="InputData/KryptonTestInput1.txt"/>
         <Item Name="KryptonTestInput2.txt" Type="Document" URL="InputData/KryptonTestInput2.txt"/>
         <Item Name="KryptonTestInput3.txt" Type="Document" URL="InputData/KryptonTestInput3.txt"/>
         <Item Name="Rx_012.txt" Type="Document" URL="InputData/Rx_012.txt"/>
         <Item Name="Ry_012.txt" Type="Document" URL="InputData/Ry_012.txt"/>
         <Item Name="Rz_012.txt" Type="Document" URL="InputData/Rz_012.txt"/>
         <Item Name="Sin075X.txt" Type="Document" URL="InputData/Sin075X.txt"/>
         <Item Name="Sin075X0Z.txt" Type="Document" URL="InputData/Sin075X0Z.txt"/>
         <Item Name="Sin075X120FZ.txt" Type="Document" URL="InputData/Sin075X120FZ.txt"/>
         <Item Name="Sin075X_2.txt" Type="Document" URL="InputData/Sin075X_2.txt"/>
         <Item Name="Sin07X0Z.txt" Type="Document" URL="InputData/Sin07X0Z.txt"/>
         <Item Name="Sin07X120FZ.txt" Type="Document" URL="InputData/Sin07X120FZ.txt"/>
         <Item Name="X003.txt" Type="Document" URL="InputData/X003.txt"/>
         <Item Name="X003Fz300.txt" Type="Document" URL="InputData/X003Fz300.txt"/>
         <Item Name="X15.txt" Type="Document" URL="InputData/X15.txt"/>
      </Item>
      <Item Name="lib" Type="Folder">
         <Item Name="Global Data" Type="Folder" URL="lib/Global Data">
            <Property Name="NI.DISK" Type="Bool">true</Property>
         </Item>
         <Item Name="Logging" Type="Folder" URL="lib/Logging">
            <Property Name="NI.DISK" Type="Bool">true</Property>
         </Item>
         <Item Name="About LBCB Operation Manager.vi" Type="VI" URL="lib/About LBCB Operation Manager.vi"/>
         <Item Name="ActuatorArray2Cluster.vi" Type="VI" URL="lib/ActuatorArray2Cluster.vi"/>
         <Item Name="ActuatorCluster2Array.vi" Type="VI" URL="lib/ActuatorCluster2Array.vi"/>
         <Item Name="Adaptive Middle Controller.vi" Type="VI" URL="lib/Adaptive Middle Controller.vi"/>
         <Item Name="Add New Events.vi" Type="VI" URL="lib/Add New Events.vi"/>
         <Item Name="Auto Balance Controller.vi" Type="VI" URL="lib/Auto Balance Controller.vi"/>
         <Item Name="Auto Balance Loop.vi" Type="VI" URL="lib/Auto Balance Loop.vi"/>
         <Item Name="CartesianArray2Cluster.vi" Type="VI" URL="lib/CartesianArray2Cluster.vi"/>
         <Item Name="CartesianCluster2Array.vi" Type="VI" URL="lib/CartesianCluster2Array.vi"/>
         <Item Name="CartesianGlobal2Indiv.vi" Type="VI" URL="lib/CartesianGlobal2Indiv.vi"/>
         <Item Name="Channel List.vi" Type="VI" URL="lib/Channel List.vi"/>
         <Item Name="DAQ Property.vi" Type="VI" URL="lib/DAQ Property.vi"/>
         <Item Name="Displacement Limit.vi" Type="VI" URL="lib/Displacement Limit.vi"/>
         <Item Name="Double2Wave.vi" Type="VI" URL="lib/Double2Wave.vi"/>
         <Item Name="Double2WaveWithFlag.vi" Type="VI" URL="lib/Double2WaveWithFlag.vi"/>
         <Item Name="ExtractArray.vi" Type="VI" URL="lib/ExtractArray.vi"/>
         <Item Name="ExtractCartesianArray.vi" Type="VI" URL="lib/ExtractCartesianArray.vi"/>
         <Item Name="ExtractCartesianDAQArray.vi" Type="VI" URL="lib/ExtractCartesianDAQArray.vi"/>
         <Item Name="Force Limit.vi" Type="VI" URL="lib/Force Limit.vi"/>
         <Item Name="FunctionGenerator.vi" Type="VI" URL="lib/FunctionGenerator.vi"/>
         <Item Name="GetChannelNameArray.vi" Type="VI" URL="lib/GetChannelNameArray.vi"/>
         <Item Name="GetSamplingRate.vi" Type="VI" URL="lib/GetSamplingRate.vi"/>
         <Item Name="InputUpdate.vi" Type="VI" URL="lib/InputUpdate.vi"/>
         <Item Name="InsertCartesianArray.vi" Type="VI" URL="lib/InsertCartesianArray.vi"/>
         <Item Name="Jacobian Setup.vi" Type="VI" URL="lib/Jacobian Setup.vi"/>
         <Item Name="LBCB_Conversions.vi" Type="VI" URL="lib/LBCB_Conversions.vi"/>
         <Item Name="LBCB_Conversions2.vi" Type="VI" URL="lib/LBCB_Conversions2.vi"/>
         <Item Name="Limit Check.vi" Type="VI" URL="lib/Limit Check.vi"/>
         <Item Name="Load Config Data.vi" Type="VI" URL="lib/Load Config Data.vi"/>
         <Item Name="Load Digital Filter File.vi" Type="VI" URL="lib/Load Digital Filter File.vi"/>
         <Item Name="Middle Loop Property.vi" Type="VI" URL="lib/Middle Loop Property.vi"/>
         <Item Name="Middle PID Controller.vi" Type="VI" URL="lib/Middle PID Controller.vi"/>
         <Item Name="MilisecLogger.vi" Type="VI" URL="lib/MilisecLogger.vi"/>
         <Item Name="MilisecLoggerCoverter.vi" Type="VI" URL="lib/MilisecLoggerCoverter.vi"/>
         <Item Name="MixedModeCommandControl.vi" Type="VI" URL="lib/MixedModeCommandControl.vi"/>
         <Item Name="MixedModeControl.vi" Type="VI" URL="lib/MixedModeControl.vi"/>
         <Item Name="MixedModeDataTrigger.vi" Type="VI" URL="lib/MixedModeDataTrigger.vi"/>
         <Item Name="MixedModeInputType.vi" Type="VI" URL="lib/MixedModeInputType.vi"/>
         <Item Name="MixedModeInputType_rev.vi" Type="VI" URL="lib/MixedModeInputType_rev.vi"/>
         <Item Name="MixedModeLoopProperty.vi" Type="VI" URL="lib/MixedModeLoopProperty.vi"/>
         <Item Name="MultiSignalDigitalFilter.vi" Type="VI" URL="lib/MultiSignalDigitalFilter.vi"/>
         <Item Name="PlotInputData.vi" Type="VI" URL="lib/PlotInputData.vi"/>
         <Item Name="RampHold.vi" Type="VI" URL="lib/RampHold.vi"/>
         <Item Name="RampInputType.vi" Type="VI" URL="lib/RampInputType.vi"/>
         <Item Name="ReplaceArray.vi" Type="VI" URL="lib/ReplaceArray.vi"/>
         <Item Name="Save Config Data.vi" Type="VI" URL="lib/Save Config Data.vi"/>
         <Item Name="Servo Limit.vi" Type="VI" URL="lib/Servo Limit.vi"/>
         <Item Name="SetLocalCoordinates.vi" Type="VI" URL="lib/SetLocalCoordinates.vi"/>
         <Item Name="Shift Cartesian Axes.vi" Type="VI" URL="lib/Shift Cartesian Axes.vi"/>
         <Item Name="StepRampInputTypeRev.vi" Type="VI" URL="lib/StepRampInputTypeRev.vi"/>
         <Item Name="StepwiseRamp.vi" Type="VI" URL="lib/StepwiseRamp.vi"/>
         <Item Name="vector2cluster.vi" Type="VI" URL="lib/vector2cluster.vi"/>
         <Item Name="WavechartWithCaption.vi" Type="VI" URL="lib/WavechartWithCaption.vi"/>
         <Item Name="WriteTextData.vi" Type="VI" URL="lib/WriteTextData.vi"/>
         <Item Name="XY Chart Buffer_rev.vi" Type="VI" URL="lib/XY Chart Buffer_rev.vi"/>
      </Item>
      <Item Name="NTCP library" Type="Folder">
         <Item Name=".svn" Type="Folder">
            <Item Name="prop-base" Type="Folder">
               <Item Name="About NTCP Socket.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/About NTCP Socket.vi.svn-base"/>
               <Item Name="ExternalSensorsDataString.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/ExternalSensorsDataString.vi.svn-base"/>
               <Item Name="Generate 12-value control pt return value.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/Generate 12-value control pt return value.vi.svn-base"/>
               <Item Name="ntcp cmd - parse and enqueue.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/ntcp cmd - parse and enqueue.vi.svn-base"/>
               <Item Name="ntcp command.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/ntcp command.vi.svn-base"/>
               <Item Name="NTCP return.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/NTCP return.vi.svn-base"/>
               <Item Name="NTCP Socket.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/NTCP Socket.vi.svn-base"/>
               <Item Name="NTCPtestcommand.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/NTCPtestcommand.vi.svn-base"/>
               <Item Name="NTCPtestreceiver.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/NTCPtestreceiver.vi.svn-base"/>
               <Item Name="OM reply - parse and enqueue.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/OM reply - parse and enqueue.vi.svn-base"/>
               <Item Name="Open ntcp command queue.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/Open ntcp command queue.vi.svn-base"/>
               <Item Name="Open OM reply queue.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/Open OM reply queue.vi.svn-base"/>
               <Item Name="ProposeCommand.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/ProposeCommand.vi.svn-base"/>
               <Item Name="TCP read command.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/TCP read command.vi.svn-base"/>
               <Item Name="WriteLogFile.vi.svn-base" Type="Document" URL="NTCP library/.svn/prop-base/WriteLogFile.vi.svn-base"/>
            </Item>
            <Item Name="props" Type="Folder"/>
            <Item Name="text-base" Type="Folder">
               <Item Name="About NTCP Socket.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/About NTCP Socket.vi.svn-base"/>
               <Item Name="ExternalSensorsDataString.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/ExternalSensorsDataString.vi.svn-base"/>
               <Item Name="Generate 12-value control pt return value.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/Generate 12-value control pt return value.vi.svn-base"/>
               <Item Name="ntcp cmd - parse and enqueue.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/ntcp cmd - parse and enqueue.vi.svn-base"/>
               <Item Name="ntcp command.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/ntcp command.vi.svn-base"/>
               <Item Name="NTCP return.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/NTCP return.vi.svn-base"/>
               <Item Name="NTCP Socket.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/NTCP Socket.vi.svn-base"/>
               <Item Name="NTCPtestcommand.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/NTCPtestcommand.vi.svn-base"/>
               <Item Name="NTCPtestreceiver.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/NTCPtestreceiver.vi.svn-base"/>
               <Item Name="OM reply - parse and enqueue.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/OM reply - parse and enqueue.vi.svn-base"/>
               <Item Name="Open ntcp command queue.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/Open ntcp command queue.vi.svn-base"/>
               <Item Name="Open OM reply queue.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/Open OM reply queue.vi.svn-base"/>
               <Item Name="ProposeCommand.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/ProposeCommand.vi.svn-base"/>
               <Item Name="TCP read command.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/TCP read command.vi.svn-base"/>
               <Item Name="WriteLogFile.vi.svn-base" Type="VI" URL="NTCP library/.svn/text-base/WriteLogFile.vi.svn-base"/>
            </Item>
            <Item Name="tmp" Type="Folder">
               <Item Name="prop-base" Type="Folder"/>
               <Item Name="props" Type="Folder"/>
               <Item Name="text-base" Type="Folder"/>
            </Item>
            <Item Name="all-wcprops" Type="Document" URL="NTCP library/.svn/all-wcprops"/>
            <Item Name="entries" Type="Document" URL="NTCP library/.svn/entries"/>
            <Item Name="format" Type="Document" URL="NTCP library/.svn/format"/>
         </Item>
         <Item Name="About NTCP Socket.vi" Type="VI" URL="NTCP library/About NTCP Socket.vi"/>
         <Item Name="ExternalSensorsDataString.vi" Type="VI" URL="NTCP library/ExternalSensorsDataString.vi"/>
         <Item Name="Generate 12-value control pt return value.vi" Type="VI" URL="NTCP library/Generate 12-value control pt return value.vi"/>
         <Item Name="ntcp cmd - parse and enqueue.vi" Type="VI" URL="NTCP library/ntcp cmd - parse and enqueue.vi"/>
         <Item Name="ntcp command.vi" Type="VI" URL="NTCP library/ntcp command.vi"/>
         <Item Name="NTCP return.vi" Type="VI" URL="NTCP library/NTCP return.vi"/>
         <Item Name="NTCP Socket.vi" Type="VI" URL="NTCP library/NTCP Socket.vi"/>
         <Item Name="NTCPtestcommand.vi" Type="VI" URL="NTCP library/NTCPtestcommand.vi"/>
         <Item Name="NTCPtestreceiver.vi" Type="VI" URL="NTCP library/NTCPtestreceiver.vi"/>
         <Item Name="OM reply - parse and enqueue.vi" Type="VI" URL="NTCP library/OM reply - parse and enqueue.vi"/>
         <Item Name="Open ntcp command queue.vi" Type="VI" URL="NTCP library/Open ntcp command queue.vi"/>
         <Item Name="Open OM reply queue.vi" Type="VI" URL="NTCP library/Open OM reply queue.vi"/>
         <Item Name="ProposeCommand.vi" Type="VI" URL="NTCP library/ProposeCommand.vi"/>
         <Item Name="TCP read command.vi" Type="VI" URL="NTCP library/TCP read command.vi"/>
         <Item Name="WriteLogFile.vi" Type="VI" URL="NTCP library/WriteLogFile.vi"/>
      </Item>
      <Item Name="TestData" Type="Folder">
         <Item Name=".svn" Type="Folder">
            <Item Name="prop-base" Type="Folder">
               <Item Name="AluminumTest.xls.svn-base" Type="Document" URL="TestData/.svn/prop-base/AluminumTest.xls.svn-base"/>
               <Item Name="AluminumTest2.xls.svn-base" Type="Document" URL="TestData/.svn/prop-base/AluminumTest2.xls.svn-base"/>
               <Item Name="CrazyForceControlTest.mat.svn-base" Type="Document" URL="TestData/.svn/prop-base/CrazyForceControlTest.mat.svn-base"/>
               <Item Name="CrazyTest.mat.svn-base" Type="Document" URL="TestData/.svn/prop-base/CrazyTest.mat.svn-base"/>
               <Item Name="Sin07X0Z120_1.mat.svn-base" Type="Document" URL="TestData/.svn/prop-base/Sin07X0Z120_1.mat.svn-base"/>
               <Item Name="Sin07X0Z_1.mat.svn-base" Type="Document" URL="TestData/.svn/prop-base/Sin07X0Z_1.mat.svn-base"/>
            </Item>
            <Item Name="props" Type="Folder"/>
            <Item Name="text-base" Type="Folder">
               <Item Name="AluminumTest.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/AluminumTest.txt.svn-base"/>
               <Item Name="AluminumTest.xls.svn-base" Type="Document" URL="TestData/.svn/text-base/AluminumTest.xls.svn-base"/>
               <Item Name="AluminumTest2.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/AluminumTest2.txt.svn-base"/>
               <Item Name="AluminumTest2.xls.svn-base" Type="Document" URL="TestData/.svn/text-base/AluminumTest2.xls.svn-base"/>
               <Item Name="AluminumTestFz250.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/AluminumTestFz250.txt.svn-base"/>
               <Item Name="AluminumX003Fz300.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/AluminumX003Fz300.txt.svn-base"/>
               <Item Name="CrazyForceControlTest.mat.svn-base" Type="Document" URL="TestData/.svn/text-base/CrazyForceControlTest.mat.svn-base"/>
               <Item Name="CrazyForceControlTest.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/CrazyForceControlTest.txt.svn-base"/>
               <Item Name="CrazyTest.mat.svn-base" Type="Document" URL="TestData/.svn/text-base/CrazyTest.mat.svn-base"/>
               <Item Name="EC_Pin.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/EC_Pin.txt.svn-base"/>
               <Item Name="PlotCrazyForceControlTest.m.svn-base" Type="Document" URL="TestData/.svn/text-base/PlotCrazyForceControlTest.m.svn-base"/>
               <Item Name="PlotSin07X0Z120_1.m.svn-base" Type="Document" URL="TestData/.svn/text-base/PlotSin07X0Z120_1.m.svn-base"/>
               <Item Name="PlotSin07X0Z_1.m.svn-base" Type="Document" URL="TestData/.svn/text-base/PlotSin07X0Z_1.m.svn-base"/>
               <Item Name="Sin07X0Z120_1.mat.svn-base" Type="Document" URL="TestData/.svn/text-base/Sin07X0Z120_1.mat.svn-base"/>
               <Item Name="Sin07X0Z120_1.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/Sin07X0Z120_1.txt.svn-base"/>
               <Item Name="Sin07X0Z_1.mat.svn-base" Type="Document" URL="TestData/.svn/text-base/Sin07X0Z_1.mat.svn-base"/>
               <Item Name="Sin07X0Z_1.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/Sin07X0Z_1.txt.svn-base"/>
               <Item Name="SinX075Z0144Fix.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/SinX075Z0144Fix.txt.svn-base"/>
               <Item Name="SinX075Z0_2.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/SinX075Z0_2.txt.svn-base"/>
               <Item Name="SinX075Z120Fix.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/SinX075Z120Fix.txt.svn-base"/>
               <Item Name="Test011305.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/Test011305.txt.svn-base"/>
               <Item Name="Test011305_2.txt.svn-base" Type="Document" URL="TestData/.svn/text-base/Test011305_2.txt.svn-base"/>
            </Item>
            <Item Name="tmp" Type="Folder">
               <Item Name="prop-base" Type="Folder"/>
               <Item Name="props" Type="Folder"/>
               <Item Name="text-base" Type="Folder"/>
            </Item>
            <Item Name="entries" Type="Document" URL="TestData/.svn/entries"/>
            <Item Name="format" Type="Document" URL="TestData/.svn/format"/>
         </Item>
         <Item Name="AluminumTest.txt" Type="Document" URL="TestData/AluminumTest.txt"/>
         <Item Name="AluminumTest.xls" Type="Document" URL="TestData/AluminumTest.xls"/>
         <Item Name="AluminumTest2.txt" Type="Document" URL="TestData/AluminumTest2.txt"/>
         <Item Name="AluminumTest2.xls" Type="Document" URL="TestData/AluminumTest2.xls"/>
         <Item Name="AluminumTestFz250.txt" Type="Document" URL="TestData/AluminumTestFz250.txt"/>
         <Item Name="AluminumX003Fz300.txt" Type="Document" URL="TestData/AluminumX003Fz300.txt"/>
         <Item Name="CrazyForceControlTest.mat" Type="Document" URL="TestData/CrazyForceControlTest.mat"/>
         <Item Name="CrazyForceControlTest.txt" Type="Document" URL="TestData/CrazyForceControlTest.txt"/>
         <Item Name="CrazyTest.mat" Type="Document" URL="TestData/CrazyTest.mat"/>
         <Item Name="EC_Pin.txt" Type="Document" URL="TestData/EC_Pin.txt"/>
         <Item Name="PlotCrazyForceControlTest.m" Type="Document" URL="TestData/PlotCrazyForceControlTest.m"/>
         <Item Name="PlotSin07X0Z120_1.m" Type="Document" URL="TestData/PlotSin07X0Z120_1.m"/>
         <Item Name="PlotSin07X0Z_1.m" Type="Document" URL="TestData/PlotSin07X0Z_1.m"/>
         <Item Name="Sin07X0Z120_1.mat" Type="Document" URL="TestData/Sin07X0Z120_1.mat"/>
         <Item Name="Sin07X0Z120_1.txt" Type="Document" URL="TestData/Sin07X0Z120_1.txt"/>
         <Item Name="Sin07X0Z_1.mat" Type="Document" URL="TestData/Sin07X0Z_1.mat"/>
         <Item Name="Sin07X0Z_1.txt" Type="Document" URL="TestData/Sin07X0Z_1.txt"/>
         <Item Name="SinX075Z0144Fix.txt" Type="Document" URL="TestData/SinX075Z0144Fix.txt"/>
         <Item Name="SinX075Z0_2.txt" Type="Document" URL="TestData/SinX075Z0_2.txt"/>
         <Item Name="SinX075Z120Fix.txt" Type="Document" URL="TestData/SinX075Z120Fix.txt"/>
         <Item Name="Test011305.txt" Type="Document" URL="TestData/Test011305.txt"/>
         <Item Name="Test011305_2.txt" Type="Document" URL="TestData/Test011305_2.txt"/>
      </Item>
      <Item Name="Operations Manager 2.vi" Type="VI" URL="Operations Manager 2.vi"/>
      <Item Name="OperationManagerGlobalSmallFacility.vi" Type="VI" URL="OperationManagerGlobalSmallFacility.vi"/>
      <Item Name="Operation Manager.ini" Type="Document" URL="Operation Manager.ini"/>
      <Item Name="OperationManagerGlobal.vi" Type="VI" URL="OperationManagerGlobal.vi"/>
      <Item Name="OperationManagerGlobalLargeFacility.vi" Type="VI" URL="OperationManagerGlobalLargeFacility.vi"/>
      <Item Name="Dependencies" Type="Dependencies">
         <Item Name="vi.lib" Type="Folder">
            <Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
            <Item Name="NI_MABase.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MABase.lvlib"/>
            <Item Name="Merge Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Merge Errors.vi"/>
            <Item Name="TCP Listen.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen.vi"/>
            <Item Name="Internecine Avoider.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/Internecine Avoider.vi"/>
            <Item Name="TCP Listen List Operations.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen List Operations.ctl"/>
            <Item Name="TCP Listen Internal List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen Internal List.vi"/>
            <Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
            <Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
            <Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
            <Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
            <Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
            <Item Name="General Error Handler CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler CORE.vi"/>
            <Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
            <Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
            <Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
            <Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
            <Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
            <Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
            <Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
            <Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
            <Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
            <Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
            <Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
            <Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
            <Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
            <Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
            <Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
            <Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
            <Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
            <Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
            <Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
            <Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
            <Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
            <Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
            <Item Name="DAQmx Read.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read.vi"/>
            <Item Name="DAQmx Read (Analog 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D Wfm NChan NSamp).vi"/>
            <Item Name="DAQmx Fill In Error Info.vi" Type="VI" URL="/&lt;vilib&gt;/daqmx/miscellaneous.llb/DAQmx Fill In Error Info.vi"/>
            <Item Name="DAQmx Read (Analog 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D DBL 1Chan NSamp).vi"/>
            <Item Name="DAQmx Read (Analog 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D DBL NChan 1Samp).vi"/>
            <Item Name="DAQmx Read (Analog 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D Wfm NChan 1Samp).vi"/>
            <Item Name="DAQmx Read (Analog 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D DBL NChan NSamp).vi"/>
            <Item Name="DAQmx Read (Analog DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog DBL 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Read (Analog Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog Wfm 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Read (Analog Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog Wfm 1Chan NSamp).vi"/>
            <Item Name="DAQmx Read (Digital 1D Bool 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Bool 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Read (Digital 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U32 1Chan NSamp).vi"/>
            <Item Name="DAQmx Read (Digital 1D U8 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U8 1Chan NSamp).vi"/>
            <Item Name="DAQmx Read (Digital 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Wfm NChan 1Samp).vi"/>
            <Item Name="DAQmx Read (Digital 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D U32 NChan NSamp).vi"/>
            <Item Name="DAQmx Read (Digital 2D U8 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D U8 NChan NSamp).vi"/>
            <Item Name="DAQmx Read (Digital Bool 1Line 1Point).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Bool 1Line 1Point).vi"/>
            <Item Name="DAQmx Read (Digital Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Wfm 1Chan NSamp).vi"/>
            <Item Name="DAQmx Read (Raw 1D I16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D I16).vi"/>
            <Item Name="DAQmx Read (Raw 1D I32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D I32).vi"/>
            <Item Name="DAQmx Read (Raw 1D I8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D I8).vi"/>
            <Item Name="DAQmx Read (Raw 1D U16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D U16).vi"/>
            <Item Name="DAQmx Read (Raw 1D U32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D U32).vi"/>
            <Item Name="DAQmx Read (Raw 1D U8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D U8).vi"/>
            <Item Name="DAQmx Read (Digital 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Wfm NChan NSamp).vi"/>
            <Item Name="DAQmx Read (Digital Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Wfm 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Read (Counter 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D DBL 1Chan NSamp).vi"/>
            <Item Name="DAQmx Read (Counter DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter DBL 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Read (Counter U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter U32 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Read (Counter 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D U32 1Chan NSamp).vi"/>
            <Item Name="DAQmx Read (Digital 1D U8 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U8 NChan 1Samp).vi"/>
            <Item Name="DAQmx Read (Digital 1D U32 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U32 NChan 1Samp).vi"/>
            <Item Name="DAQmx Read (Digital U8 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital U8 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Read (Digital U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital U32 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Read (Digital 1D Bool NChan 1Samp 1Line).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Bool NChan 1Samp 1Line).vi"/>
            <Item Name="DAQmx Read (Digital 2D Bool NChan 1Samp NLine).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D Bool NChan 1Samp NLine).vi"/>
            <Item Name="DAQmx Read (Analog 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D U16 NChan NSamp).vi"/>
            <Item Name="DAQmx Read (Analog 2D I16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D I16 NChan NSamp).vi"/>
            <Item Name="DAQmx Read (Analog 2D I32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D I32 NChan NSamp).vi"/>
            <Item Name="DAQmx Read (Analog 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D U32 NChan NSamp).vi"/>
            <Item Name="DAQmx Read (Digital U16 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital U16 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Read (Digital 1D U16 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U16 1Chan NSamp).vi"/>
            <Item Name="DAQmx Read (Digital 1D U16 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U16 NChan 1Samp).vi"/>
            <Item Name="DAQmx Read (Digital 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D U16 NChan NSamp).vi"/>
            <Item Name="DAQmx Write.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write.vi"/>
            <Item Name="DAQmx Write (Analog 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D DBL 1Chan NSamp).vi"/>
            <Item Name="DAQmx Write (Analog 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D DBL NChan 1Samp).vi"/>
            <Item Name="DAQmx Write (Analog 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D Wfm NChan 1Samp).vi"/>
            <Item Name="DAQmx Write (Analog 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D DBL NChan NSamp).vi"/>
            <Item Name="DAQmx Write (Analog DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog DBL 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Analog Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog Wfm 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Analog Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog Wfm 1Chan NSamp).vi"/>
            <Item Name="DAQmx Write (Digital 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U32 NChan NSamp).vi"/>
            <Item Name="DAQmx Write (Digital 2D U8 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U8 NChan NSamp).vi"/>
            <Item Name="DAQmx Write (Digital 1D Bool 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Bool 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Digital 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U32 1Chan NSamp).vi"/>
            <Item Name="DAQmx Write (Digital 1D U8 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U8 1Chan NSamp).vi"/>
            <Item Name="DAQmx Write (Digital Bool 1Line 1Point).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Bool 1Line 1Point).vi"/>
            <Item Name="DAQmx Write (Digital Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Wfm 1Chan NSamp).vi"/>
            <Item Name="DWDT Uncompress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Uncompress Digital.vi"/>
            <Item Name="DTbl Uncompress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Uncompress Digital.vi"/>
            <Item Name="DTbl Digital Size.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Digital Size.vi"/>
            <Item Name="DAQmx Write (Raw 1D I16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I16).vi"/>
            <Item Name="DAQmx Write (Raw 1D I32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I32).vi"/>
            <Item Name="DAQmx Write (Raw 1D I8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I8).vi"/>
            <Item Name="DAQmx Write (Raw 1D U16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U16).vi"/>
            <Item Name="DAQmx Write (Raw 1D U32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U32).vi"/>
            <Item Name="DAQmx Write (Raw 1D U8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U8).vi"/>
            <Item Name="DAQmx Write (Digital 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Wfm NChan 1Samp).vi"/>
            <Item Name="DAQmx Write (Digital Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Wfm 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Analog 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D Wfm NChan NSamp).vi"/>
            <Item Name="DAQmx Write (Digital 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Wfm NChan NSamp).vi"/>
            <Item Name="DAQmx Write (Digital U8 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U8 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Digital U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U32 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Digital 1D U32 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U32 NChan 1Samp).vi"/>
            <Item Name="DAQmx Write (Digital 1D U8 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U8 NChan 1Samp).vi"/>
            <Item Name="DAQmx Write (Digital 2D Bool NChan 1Samp NLine).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D Bool NChan 1Samp NLine).vi"/>
            <Item Name="DAQmx Write (Digital 1D Bool NChan 1Samp 1Line).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Bool NChan 1Samp 1Line).vi"/>
            <Item Name="DAQmx Write (Analog 2D I16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D I16 NChan NSamp).vi"/>
            <Item Name="DAQmx Write (Analog 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D U16 NChan NSamp).vi"/>
            <Item Name="DAQmx Write (Counter Frequency 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Frequency 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Counter Ticks 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Ticks 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Counter Time 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Time 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Counter 1D Frequency NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Frequency NChan 1Samp).vi"/>
            <Item Name="DAQmx Write (Counter 1D Time NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Time NChan 1Samp).vi"/>
            <Item Name="DAQmx Write (Counter 1DTicks NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1DTicks NChan 1Samp).vi"/>
            <Item Name="DAQmx Write (Analog 2D I32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D I32 NChan NSamp).vi"/>
            <Item Name="DAQmx Write (Digital U16 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U16 1Chan 1Samp).vi"/>
            <Item Name="DAQmx Write (Digital 1D U16 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U16 1Chan NSamp).vi"/>
            <Item Name="DAQmx Write (Digital 1D U16 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U16 NChan 1Samp).vi"/>
            <Item Name="DAQmx Write (Digital 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U16 NChan NSamp).vi"/>
            <Item Name="Dynamic To Waveform Array.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Dynamic To Waveform Array.vi"/>
            <Item Name="How many pts in the wave.vi" Type="VI" URL="/&lt;vilib&gt;/express/express arith-compare/FormulaBlock.llb/How many pts in the wave.vi"/>
            <Item Name="ex_Modify Signal Name.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_Modify Signal Name.vi"/>
            <Item Name="Waveform Array To Dynamic.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Waveform Array To Dynamic.vi"/>
            <Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
            <Item Name="Read BMP File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File.vi"/>
            <Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
            <Item Name="Read BMP File Data.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File Data.vi"/>
            <Item Name="Read BMP Header Info.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP Header Info.vi"/>
            <Item Name="Calc Long Word Padded Width.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Calc Long Word Padded Width.vi"/>
            <Item Name="Flip and Pad for Picture Control.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Flip and Pad for Picture Control.vi"/>
            <Item Name="Draw Flattened Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Flattened Pixmap.vi"/>
            <Item Name="FixBadRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/FixBadRect.vi"/>
            <Item Name="Read Characters From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Characters From File.vi"/>
            <Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
            <Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
            <Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
            <Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
            <Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
            <Item Name="NI_Matrix.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/Matrix/NI_Matrix.lvlib"/>
            <Item Name="Read From XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File.vi"/>
            <Item Name="Read From XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(array).vi"/>
            <Item Name="Open_Create_Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/Open_Create_Replace File.vi"/>
            <Item Name="compatFileDialog.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatFileDialog.vi"/>
            <Item Name="compatOpenFileOperation.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOpenFileOperation.vi"/>
            <Item Name="compatCalcOffset.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatCalcOffset.vi"/>
            <Item Name="ParseXMLFragments.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/ParseXMLFragments.vi"/>
            <Item Name="FindFirstTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindFirstTag.vi"/>
            <Item Name="FindEmptyElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindEmptyElement.vi"/>
            <Item Name="FindElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElement.vi"/>
            <Item Name="FindMatchingCloseTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindMatchingCloseTag.vi"/>
            <Item Name="FindCloseTagByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindCloseTagByName.vi"/>
            <Item Name="FindElementStartByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElementStartByName.vi"/>
            <Item Name="Read From XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(string).vi"/>
            <Item Name="compatOverwrite.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOverwrite.vi"/>
            <Item Name="Write Characters To File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Characters To File.vi"/>
            <Item Name="Write File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write File+ (string).vi"/>
            <Item Name="compatWriteText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatWriteText.vi"/>
            <Item Name="Open/Create/Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open/Create/Replace File.vi"/>
            <Item Name="Write to XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File.vi"/>
            <Item Name="Write to XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(string).vi"/>
            <Item Name="Write to XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(array).vi"/>
            <Item Name="Error to Warning.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error to Warning.vi"/>
            <Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
            <Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
            <Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
            <Item Name="DAQmx Timing.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing.vi"/>
            <Item Name="DAQmx Timing (Sample Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Sample Clock).vi"/>
            <Item Name="DAQmx Timing (Handshaking).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Handshaking).vi"/>
            <Item Name="DAQmx Timing (Implicit).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Implicit).vi"/>
            <Item Name="DAQmx Timing (Use Waveform).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Use Waveform).vi"/>
            <Item Name="DAQmx Timing (Change Detection).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Change Detection).vi"/>
            <Item Name="DAQmx Timing (Burst Import Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Burst Import Clock).vi"/>
            <Item Name="DAQmx Timing (Burst Export Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Burst Export Clock).vi"/>
            <Item Name="DAQmx Timing (Pipelined Sample Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Pipelined Sample Clock).vi"/>
            <Item Name="DAQmx Start Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Start Task.vi"/>
            <Item Name="exnFormulaBlock how many pts in the wave.vi" Type="VI" URL="/&lt;vilib&gt;/express/express arith-compare/Formula/Block/exnFormulaBlock how many pts in the wave.vi"/>
            <Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
            <Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
         </Item>
         <Item Name="lvanlys.dll" Type="Document" URL="../../../../../Program Files/National Instruments/LabVIEW 8.5/resource/lvanlys.dll"/>
         <Item Name="OperationManagerGlobal.vi" Type="VI" URL="NTCP library/.svn/OperationManagerGlobal.vi"/>
         <Item Name="GetChannelNameArray.vi" Type="VI" URL="NTCP library/.svn/lib/GetChannelNameArray.vi"/>
         <Item Name="ExternalSensorsDataString.vi" Type="VI" URL="NTCP library/.svn/text-base/ExternalSensorsDataString.vi"/>
         <Item Name="Open ntcp command queue.vi" Type="VI" URL="NTCP library/.svn/text-base/Open ntcp command queue.vi"/>
         <Item Name="ProposeCommand.vi" Type="VI" URL="NTCP library/.svn/text-base/ProposeCommand.vi"/>
         <Item Name="ntcp cmd - parse and enqueue.vi" Type="VI" URL="NTCP library/.svn/text-base/ntcp cmd - parse and enqueue.vi"/>
         <Item Name="WriteLogFile.vi" Type="VI" URL="NTCP library/.svn/text-base/WriteLogFile.vi"/>
         <Item Name="OM reply - parse and enqueue.vi" Type="VI" URL="NTCP library/.svn/text-base/OM reply - parse and enqueue.vi"/>
         <Item Name="Open OM reply queue.vi" Type="VI" URL="NTCP library/.svn/text-base/Open OM reply queue.vi"/>
         <Item Name="NTCP return.vi" Type="VI" URL="NTCP library/.svn/text-base/NTCP return.vi"/>
         <Item Name="TCP read command.vi" Type="VI" URL="NTCP library/.svn/text-base/TCP read command.vi"/>
         <Item Name="Error to Warning.vi" Type="VI" URL="../../Program Files/National Instruments/LabVIEW 7.0/examples/comm/TCP.llb/Error to Warning.vi"/>
         <Item Name="ntcp command.vi" Type="VI" URL="NTCP library/.svn/text-base/ntcp command.vi"/>
         <Item Name="Generate 12-value control pt return value.vi" Type="VI" URL="NTCP library/.svn/text-base/Generate 12-value control pt return value.vi"/>
         <Item Name="Error to Warning.vi" Type="VI" URL="../../../../Program Files/National Instruments/LabVIEW 7.0/examples/comm/TCP.llb/Error to Warning.vi"/>
         <Item Name="LBCB Operation Manager Menu.rtm" Type="Document" URL="BuildFiles/LBCB Operation Manager Menu.rtm"/>
         <Item Name="Adjust LBCB LVDT Measurement.vi" Type="VI" URL="lib/Adjust LBCB LVDT Measurement.vi"/>
         <Item Name="nilvaiu.dll" Type="Document" URL="nilvaiu.dll"/>
         <Item Name="systemexec" Type="VI" URL="systemexec"/>
      </Item>
      <Item Name="Build Specifications" Type="Build">
         <Item Name="Operations Manager 2" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{682C94EA-AC13-4434-B6A7-51FA5225B779}</Property>
            <Property Name="App_applicationName" Type="Str">LBCB Operations Manager 2.exe</Property>
            <Property Name="App_companyName" Type="Str">University of Illinois</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">1</Property>
            <Property Name="App_fileVersion.minor" Type="Int">5</Property>
            <Property Name="App_fileVersion.patch" Type="Int">1</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{70B20583-C803-4F2F-8E06-8C90BD37741D}</Property>
            <Property Name="App_INI_GUID" Type="Str">{6FD68DC5-C420-4B79-92C3-51E09742247F}</Property>
            <Property Name="App_internalName" Type="Str">Operations Manager</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright © 2008 University of Illinois</Property>
            <Property Name="App_productName" Type="Str">Operations Manager</Property>
            <Property Name="Bld_buildSpecName" Type="Str">Operations Manager 2</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_excludeTypedefs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Destination[0].destName" Type="Str">LBCB Operations Manager 2.exe</Property>
            <Property Name="Destination[0].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM Build/internal.llb</Property>
            <Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
            <Property Name="Destination[1].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM Build/data</Property>
            <Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[2].destName" Type="Str">Destination Directory</Property>
            <Property Name="Destination[2].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM Build</Property>
            <Property Name="Destination[2].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[3].destName" Type="Str">Operations Manager LLB</Property>
            <Property Name="Destination[3].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM Build/NI_AB_PROJECTNAME.llb</Property>
            <Property Name="Destination[3].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[3].type" Type="Str">LLB</Property>
            <Property Name="Destination[4].destName" Type="Str">Config</Property>
            <Property Name="Destination[4].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM Build/Config</Property>
            <Property Name="Destination[4].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[5].destName" Type="Str">DigitalFilter</Property>
            <Property Name="Destination[5].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM Build/DigitalFilter</Property>
            <Property Name="Destination[5].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[6].destName" Type="Str">image</Property>
            <Property Name="Destination[6].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM Build/image</Property>
            <Property Name="Destination[6].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="DestinationCount" Type="Int">7</Property>
            <Property Name="Exe_iconItemID" Type="Ref">/My Computer/IconFiles/LBCB Operation Manager.ico</Property>
            <Property Name="Source[0].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyProperties" Type="Bool">true</Property>
            <Property Name="Source[0].itemID" Type="Str">{C6B59FD9-DFDD-4EBE-81D3-C2632ABCE77D}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[1].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[1].itemID" Type="Ref">/My Computer/Config</Property>
            <Property Name="Source[1].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[1].type" Type="Str">Container</Property>
            <Property Name="Source[10].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[10].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[10].itemID" Type="Ref">/My Computer/Coordinate Alignment</Property>
            <Property Name="Source[10].type" Type="Str">Container</Property>
            <Property Name="Source[100].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[100].itemID" Type="Ref">/My Computer/lib/vector2cluster.vi</Property>
            <Property Name="Source[100].type" Type="Str">VI</Property>
            <Property Name="Source[101].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[101].itemID" Type="Ref">/My Computer/lib/WavechartWithCaption.vi</Property>
            <Property Name="Source[101].type" Type="Str">VI</Property>
            <Property Name="Source[102].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[102].itemID" Type="Ref">/My Computer/lib/WriteTextData.vi</Property>
            <Property Name="Source[102].type" Type="Str">VI</Property>
            <Property Name="Source[103].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[103].itemID" Type="Ref">/My Computer/lib/XY Chart Buffer_rev.vi</Property>
            <Property Name="Source[103].type" Type="Str">VI</Property>
            <Property Name="Source[104].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[104].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[104].itemID" Type="Ref">/My Computer/NTCP library</Property>
            <Property Name="Source[104].type" Type="Str">Container</Property>
            <Property Name="Source[105].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[105].itemID" Type="Ref">/My Computer/Operations Manager 2.vi</Property>
            <Property Name="Source[105].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[105].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[105].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[105].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[105].type" Type="Str">VI</Property>
            <Property Name="Source[106].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[106].itemID" Type="Ref">/My Computer/Operation Manager.ini</Property>
            <Property Name="Source[106].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[107].destinationIndex" Type="Int">2</Property>
            <Property Name="Source[107].itemID" Type="Ref">/My Computer/OperationManagerGlobal.vi</Property>
            <Property Name="Source[107].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[107].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[107].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[107].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[107].type" Type="Str">VI</Property>
            <Property Name="Source[11].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[11].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[11].itemID" Type="Ref">/My Computer/Data Transmission</Property>
            <Property Name="Source[11].type" Type="Str">Container</Property>
            <Property Name="Source[12].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[12].itemID" Type="Ref">/My Computer/Data Transmission/Data Transmission Launcher.vi</Property>
            <Property Name="Source[12].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[12].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[12].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[12].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[12].type" Type="Str">VI</Property>
            <Property Name="Source[13].itemID" Type="Ref">/My Computer/Data Transmission/Data Transmission Test.vi</Property>
            <Property Name="Source[13].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[13].properties[0].value" Type="Bool">true</Property>
            <Property Name="Source[13].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[13].type" Type="Str">VI</Property>
            <Property Name="Source[14].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[14].itemID" Type="Ref">/My Computer/Data Transmission/DataTransmissionActions.vi</Property>
            <Property Name="Source[14].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[14].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[14].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[14].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[14].type" Type="Str">VI</Property>
            <Property Name="Source[15].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[15].itemID" Type="Ref">/My Computer/Data Transmission/DataTransmissionGlobals.vi</Property>
            <Property Name="Source[15].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[15].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[15].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[15].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[15].type" Type="Str">VI</Property>
            <Property Name="Source[16].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[16].itemID" Type="Ref">/My Computer/Data Transmission/DataTransmissionTcpWriter.vi</Property>
            <Property Name="Source[16].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[16].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[16].properties[1].type" Type="Str">Run when opened</Property>
            <Property Name="Source[16].properties[1].value" Type="Bool">true</Property>
            <Property Name="Source[16].propertiesCount" Type="Int">2</Property>
            <Property Name="Source[16].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[16].type" Type="Str">VI</Property>
            <Property Name="Source[17].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[17].itemID" Type="Ref">/My Computer/Data Transmission/TransmitData.vi</Property>
            <Property Name="Source[17].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[17].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[17].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[17].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[17].type" Type="Str">VI</Property>
            <Property Name="Source[18].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[18].itemID" Type="Ref">/My Computer/Data Transmission/LaunchDataTransmissionTcpWriterVi.vi</Property>
            <Property Name="Source[18].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[18].type" Type="Str">VI</Property>
            <Property Name="Source[19].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[19].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[19].destinationIndex" Type="Int">5</Property>
            <Property Name="Source[19].itemID" Type="Ref">/My Computer/DigitalFilter</Property>
            <Property Name="Source[19].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[19].type" Type="Str">Container</Property>
            <Property Name="Source[2].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[2].itemID" Type="Ref">/My Computer/Config/Config_Default.xml</Property>
            <Property Name="Source[20].destinationIndex" Type="Int">5</Property>
            <Property Name="Source[20].itemID" Type="Ref">/My Computer/DigitalFilter/Butter8thWn0008.txt</Property>
            <Property Name="Source[21].destinationIndex" Type="Int">5</Property>
            <Property Name="Source[21].itemID" Type="Ref">/My Computer/DigitalFilter/Butter8thWn004.txt</Property>
            <Property Name="Source[22].destinationIndex" Type="Int">5</Property>
            <Property Name="Source[22].itemID" Type="Ref">/My Computer/DigitalFilter/Butter8thWn005.txt</Property>
            <Property Name="Source[23].destinationIndex" Type="Int">5</Property>
            <Property Name="Source[23].itemID" Type="Ref">/My Computer/DigitalFilter/Butter8thWn01.txt</Property>
            <Property Name="Source[24].destinationIndex" Type="Int">5</Property>
            <Property Name="Source[24].itemID" Type="Ref">/My Computer/DigitalFilter/Butter8thWn02.txt</Property>
            <Property Name="Source[25].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[25].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[25].destinationIndex" Type="Int">1</Property>
            <Property Name="Source[25].itemID" Type="Ref">/My Computer/DLL</Property>
            <Property Name="Source[25].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[25].type" Type="Str">Container</Property>
            <Property Name="Source[26].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[26].itemID" Type="Ref">/My Computer/DLL/AdaptiveMiddleLoop.dll</Property>
            <Property Name="Source[27].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[27].itemID" Type="Ref">/My Computer/DLL/AutoBalance.dll</Property>
            <Property Name="Source[28].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[28].itemID" Type="Ref">/My Computer/DLL/AutoBalance2.dll</Property>
            <Property Name="Source[29].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[29].itemID" Type="Ref">/My Computer/DLL/FunctionGenerator.dll</Property>
            <Property Name="Source[3].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[3].itemID" Type="Ref">/My Computer/Config/Config_Default.xml.bak</Property>
            <Property Name="Source[30].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[30].itemID" Type="Ref">/My Computer/DLL/LBCB_Conversion_A2C.dll</Property>
            <Property Name="Source[31].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[31].itemID" Type="Ref">/My Computer/DLL/LBCB_Conversion_C2A.dll</Property>
            <Property Name="Source[32].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[32].itemID" Type="Ref">/My Computer/DLL/MiddlePIDController.dll</Property>
            <Property Name="Source[33].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[33].itemID" Type="Ref">/My Computer/DLL/MixedMode2DirecMethod.dll</Property>
            <Property Name="Source[34].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[34].itemID" Type="Ref">/My Computer/DLL/MixedModeControl2Step.dll</Property>
            <Property Name="Source[35].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[35].itemID" Type="Ref">/My Computer/DLL/RampHold.dll</Property>
            <Property Name="Source[36].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[36].itemID" Type="Ref">/My Computer/DLL/StepwiseRamp.dll</Property>
            <Property Name="Source[37].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[37].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[37].itemID" Type="Ref">/My Computer/External Actuators</Property>
            <Property Name="Source[37].type" Type="Str">Container</Property>
            <Property Name="Source[38].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[38].itemID" Type="Ref">/My Computer/External Actuators/Actuator Actions.ctl</Property>
            <Property Name="Source[38].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[38].type" Type="Str">VI</Property>
            <Property Name="Source[39].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[39].itemID" Type="Ref">/My Computer/External Actuators/Actuator Commands.ctl</Property>
            <Property Name="Source[39].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[39].type" Type="Str">VI</Property>
            <Property Name="Source[4].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[4].itemID" Type="Ref">/My Computer/Config/Config_Default2.xml</Property>
            <Property Name="Source[40].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[40].itemID" Type="Ref">/My Computer/External Actuators/Actuator Feedback.ctl</Property>
            <Property Name="Source[40].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[40].type" Type="Str">VI</Property>
            <Property Name="Source[41].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[41].itemID" Type="Ref">/My Computer/External Actuators/Actuator Global Values.vi</Property>
            <Property Name="Source[41].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[41].type" Type="Str">VI</Property>
            <Property Name="Source[42].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[42].itemID" Type="Ref">/My Computer/External Actuators/External Actuator Control.vi</Property>
            <Property Name="Source[42].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[42].type" Type="Str">VI</Property>
            <Property Name="Source[43].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[43].itemID" Type="Ref">/My Computer/External Actuators/RampHold_Ext.vi</Property>
            <Property Name="Source[43].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[43].type" Type="Str">VI</Property>
            <Property Name="Source[44].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[44].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[44].destinationIndex" Type="Int">6</Property>
            <Property Name="Source[44].itemID" Type="Ref">/My Computer/image</Property>
            <Property Name="Source[44].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[44].type" Type="Str">Container</Property>
            <Property Name="Source[45].destinationIndex" Type="Int">6</Property>
            <Property Name="Source[45].itemID" Type="Ref">/My Computer/image/LBCB.bmp</Property>
            <Property Name="Source[46].destinationIndex" Type="Int">6</Property>
            <Property Name="Source[46].itemID" Type="Ref">/My Computer/image/Thumbs.db</Property>
            <Property Name="Source[47].destinationIndex" Type="Int">6</Property>
            <Property Name="Source[47].itemID" Type="Ref">/My Computer/image/UILogoCL1c_mdf.bmp</Property>
            <Property Name="Source[48].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[48].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[48].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[48].itemID" Type="Ref">/My Computer/lib</Property>
            <Property Name="Source[48].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[48].type" Type="Str">Container</Property>
            <Property Name="Source[49].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[49].itemID" Type="Ref">/My Computer/lib/About LBCB Operation Manager.vi</Property>
            <Property Name="Source[49].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[49].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[49].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[49].type" Type="Str">VI</Property>
            <Property Name="Source[5].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[5].itemID" Type="Ref">/My Computer/Config/Config_Default_bak.xml</Property>
            <Property Name="Source[50].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[50].itemID" Type="Ref">/My Computer/lib/ActuatorArray2Cluster.vi</Property>
            <Property Name="Source[50].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[50].properties[0].value" Type="Bool">true</Property>
            <Property Name="Source[50].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[50].type" Type="Str">VI</Property>
            <Property Name="Source[51].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[51].itemID" Type="Ref">/My Computer/lib/ActuatorCluster2Array.vi</Property>
            <Property Name="Source[51].type" Type="Str">VI</Property>
            <Property Name="Source[52].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[52].itemID" Type="Ref">/My Computer/lib/Adaptive Middle Controller.vi</Property>
            <Property Name="Source[52].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[52].properties[0].value" Type="Bool">true</Property>
            <Property Name="Source[52].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[52].type" Type="Str">VI</Property>
            <Property Name="Source[53].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[53].itemID" Type="Ref">/My Computer/lib/Add New Events.vi</Property>
            <Property Name="Source[53].type" Type="Str">VI</Property>
            <Property Name="Source[54].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[54].itemID" Type="Ref">/My Computer/lib/Auto Balance Controller.vi</Property>
            <Property Name="Source[54].type" Type="Str">VI</Property>
            <Property Name="Source[55].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[55].itemID" Type="Ref">/My Computer/lib/Auto Balance Loop.vi</Property>
            <Property Name="Source[55].type" Type="Str">VI</Property>
            <Property Name="Source[56].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[56].itemID" Type="Ref">/My Computer/lib/CartesianArray2Cluster.vi</Property>
            <Property Name="Source[56].type" Type="Str">VI</Property>
            <Property Name="Source[57].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[57].itemID" Type="Ref">/My Computer/lib/CartesianCluster2Array.vi</Property>
            <Property Name="Source[57].type" Type="Str">VI</Property>
            <Property Name="Source[58].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[58].itemID" Type="Ref">/My Computer/lib/CartesianGlobal2Indiv.vi</Property>
            <Property Name="Source[58].type" Type="Str">VI</Property>
            <Property Name="Source[59].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[59].itemID" Type="Ref">/My Computer/lib/Channel List.vi</Property>
            <Property Name="Source[59].type" Type="Str">VI</Property>
            <Property Name="Source[6].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[6].itemID" Type="Ref">/My Computer/Config/Config_Default_large.xml</Property>
            <Property Name="Source[60].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[60].itemID" Type="Ref">/My Computer/lib/DAQ Property.vi</Property>
            <Property Name="Source[60].type" Type="Str">VI</Property>
            <Property Name="Source[61].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[61].itemID" Type="Ref">/My Computer/lib/Displacement Limit.vi</Property>
            <Property Name="Source[61].type" Type="Str">VI</Property>
            <Property Name="Source[62].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[62].itemID" Type="Ref">/My Computer/lib/Double2Wave.vi</Property>
            <Property Name="Source[62].type" Type="Str">VI</Property>
            <Property Name="Source[63].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[63].itemID" Type="Ref">/My Computer/lib/Double2WaveWithFlag.vi</Property>
            <Property Name="Source[63].type" Type="Str">VI</Property>
            <Property Name="Source[64].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[64].itemID" Type="Ref">/My Computer/lib/ExtractArray.vi</Property>
            <Property Name="Source[64].type" Type="Str">VI</Property>
            <Property Name="Source[65].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[65].itemID" Type="Ref">/My Computer/lib/ExtractCartesianArray.vi</Property>
            <Property Name="Source[65].type" Type="Str">VI</Property>
            <Property Name="Source[66].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[66].itemID" Type="Ref">/My Computer/lib/ExtractCartesianDAQArray.vi</Property>
            <Property Name="Source[66].type" Type="Str">VI</Property>
            <Property Name="Source[67].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[67].itemID" Type="Ref">/My Computer/lib/Force Limit.vi</Property>
            <Property Name="Source[67].type" Type="Str">VI</Property>
            <Property Name="Source[68].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[68].itemID" Type="Ref">/My Computer/lib/FunctionGenerator.vi</Property>
            <Property Name="Source[68].type" Type="Str">VI</Property>
            <Property Name="Source[69].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[69].itemID" Type="Ref">/My Computer/lib/GetChannelNameArray.vi</Property>
            <Property Name="Source[69].type" Type="Str">VI</Property>
            <Property Name="Source[7].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[7].itemID" Type="Ref">/My Computer/Config/Config_Default_small.xml.xml</Property>
            <Property Name="Source[70].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[70].itemID" Type="Ref">/My Computer/lib/GetSamplingRate.vi</Property>
            <Property Name="Source[70].type" Type="Str">VI</Property>
            <Property Name="Source[71].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[71].itemID" Type="Ref">/My Computer/lib/InputUpdate.vi</Property>
            <Property Name="Source[71].type" Type="Str">VI</Property>
            <Property Name="Source[72].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[72].itemID" Type="Ref">/My Computer/lib/InsertCartesianArray.vi</Property>
            <Property Name="Source[72].type" Type="Str">VI</Property>
            <Property Name="Source[73].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[73].itemID" Type="Ref">/My Computer/lib/Jacobian Setup.vi</Property>
            <Property Name="Source[73].type" Type="Str">VI</Property>
            <Property Name="Source[74].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[74].itemID" Type="Ref">/My Computer/lib/LBCB_Conversions.vi</Property>
            <Property Name="Source[74].type" Type="Str">VI</Property>
            <Property Name="Source[75].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[75].itemID" Type="Ref">/My Computer/lib/LBCB_Conversions2.vi</Property>
            <Property Name="Source[75].type" Type="Str">VI</Property>
            <Property Name="Source[76].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[76].itemID" Type="Ref">/My Computer/lib/Limit Check.vi</Property>
            <Property Name="Source[76].type" Type="Str">VI</Property>
            <Property Name="Source[77].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[77].itemID" Type="Ref">/My Computer/lib/Load Config Data.vi</Property>
            <Property Name="Source[77].type" Type="Str">VI</Property>
            <Property Name="Source[78].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[78].itemID" Type="Ref">/My Computer/lib/Load Digital Filter File.vi</Property>
            <Property Name="Source[78].type" Type="Str">VI</Property>
            <Property Name="Source[79].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[79].itemID" Type="Ref">/My Computer/lib/Middle Loop Property.vi</Property>
            <Property Name="Source[79].type" Type="Str">VI</Property>
            <Property Name="Source[8].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[8].itemID" Type="Ref">/My Computer/Config/Config_Default_small2.xml</Property>
            <Property Name="Source[80].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[80].itemID" Type="Ref">/My Computer/lib/Middle PID Controller.vi</Property>
            <Property Name="Source[80].type" Type="Str">VI</Property>
            <Property Name="Source[81].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[81].itemID" Type="Ref">/My Computer/lib/MilisecLogger.vi</Property>
            <Property Name="Source[81].type" Type="Str">VI</Property>
            <Property Name="Source[82].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[82].itemID" Type="Ref">/My Computer/lib/MilisecLoggerCoverter.vi</Property>
            <Property Name="Source[82].type" Type="Str">VI</Property>
            <Property Name="Source[83].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[83].itemID" Type="Ref">/My Computer/lib/MixedModeCommandControl.vi</Property>
            <Property Name="Source[83].type" Type="Str">VI</Property>
            <Property Name="Source[84].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[84].itemID" Type="Ref">/My Computer/lib/MixedModeControl.vi</Property>
            <Property Name="Source[84].type" Type="Str">VI</Property>
            <Property Name="Source[85].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[85].itemID" Type="Ref">/My Computer/lib/MixedModeDataTrigger.vi</Property>
            <Property Name="Source[85].type" Type="Str">VI</Property>
            <Property Name="Source[86].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[86].itemID" Type="Ref">/My Computer/lib/MixedModeInputType.vi</Property>
            <Property Name="Source[86].type" Type="Str">VI</Property>
            <Property Name="Source[87].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[87].itemID" Type="Ref">/My Computer/lib/MixedModeInputType_rev.vi</Property>
            <Property Name="Source[87].type" Type="Str">VI</Property>
            <Property Name="Source[88].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[88].itemID" Type="Ref">/My Computer/lib/MixedModeLoopProperty.vi</Property>
            <Property Name="Source[88].type" Type="Str">VI</Property>
            <Property Name="Source[89].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[89].itemID" Type="Ref">/My Computer/lib/MultiSignalDigitalFilter.vi</Property>
            <Property Name="Source[89].type" Type="Str">VI</Property>
            <Property Name="Source[9].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[9].itemID" Type="Ref">/My Computer/Config/NTCP Socket.ini</Property>
            <Property Name="Source[90].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[90].itemID" Type="Ref">/My Computer/lib/PlotInputData.vi</Property>
            <Property Name="Source[90].type" Type="Str">VI</Property>
            <Property Name="Source[91].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[91].itemID" Type="Ref">/My Computer/lib/RampHold.vi</Property>
            <Property Name="Source[91].type" Type="Str">VI</Property>
            <Property Name="Source[92].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[92].itemID" Type="Ref">/My Computer/lib/RampInputType.vi</Property>
            <Property Name="Source[92].type" Type="Str">VI</Property>
            <Property Name="Source[93].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[93].itemID" Type="Ref">/My Computer/lib/ReplaceArray.vi</Property>
            <Property Name="Source[93].type" Type="Str">VI</Property>
            <Property Name="Source[94].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[94].itemID" Type="Ref">/My Computer/lib/Save Config Data.vi</Property>
            <Property Name="Source[94].type" Type="Str">VI</Property>
            <Property Name="Source[95].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[95].itemID" Type="Ref">/My Computer/lib/Servo Limit.vi</Property>
            <Property Name="Source[95].type" Type="Str">VI</Property>
            <Property Name="Source[96].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[96].itemID" Type="Ref">/My Computer/lib/SetLocalCoordinates.vi</Property>
            <Property Name="Source[96].type" Type="Str">VI</Property>
            <Property Name="Source[97].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[97].itemID" Type="Ref">/My Computer/lib/Shift Cartesian Axes.vi</Property>
            <Property Name="Source[97].type" Type="Str">VI</Property>
            <Property Name="Source[98].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[98].itemID" Type="Ref">/My Computer/lib/StepRampInputTypeRev.vi</Property>
            <Property Name="Source[98].type" Type="Str">VI</Property>
            <Property Name="Source[99].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[99].itemID" Type="Ref">/My Computer/lib/StepwiseRamp.vi</Property>
            <Property Name="Source[99].type" Type="Str">VI</Property>
            <Property Name="SourceCount" Type="Int">108</Property>
         </Item>
         <Item Name="NTCP Socket" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{D44DC029-5577-46EC-B20E-36E00AF92BCF}</Property>
            <Property Name="App_applicationName" Type="Str">NTCP Socket.exe</Property>
            <Property Name="App_companyName" Type="Str">University of Illinois</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">1</Property>
            <Property Name="App_fileVersion.minor" Type="Int">5</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{3FDC05E5-85FC-41C8-AA93-E036D595BB9A}</Property>
            <Property Name="App_INI_GUID" Type="Str">{8EA92FC2-B237-4CF6-B612-F3835540162A}</Property>
            <Property Name="App_internalName" Type="Str">NTCP Socket</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright © 2008 University of Illinois</Property>
            <Property Name="App_productName" Type="Str">NTCP Socket</Property>
            <Property Name="Bld_buildSpecName" Type="Str">NTCP Socket</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_excludeTypedefs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Destination[0].destName" Type="Str">NTCP Socket.exe</Property>
            <Property Name="Destination[0].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 01 Apr 2008/internal.llb</Property>
            <Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
            <Property Name="Destination[1].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 01 Apr 2008/data</Property>
            <Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[2].destName" Type="Str">Destination Directory</Property>
            <Property Name="Destination[2].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 01 Apr 2008</Property>
            <Property Name="Destination[2].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[3].destName" Type="Str">NTCP Socket</Property>
            <Property Name="Destination[3].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 01 Apr 2008/NTCP Socket.llb</Property>
            <Property Name="Destination[3].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[3].type" Type="Str">LLB</Property>
            <Property Name="DestinationCount" Type="Int">4</Property>
            <Property Name="Exe_iconItemID" Type="Ref">/My Computer/IconFiles/NTCP socket.ico</Property>
            <Property Name="Source[0].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyProperties" Type="Bool">true</Property>
            <Property Name="Source[0].itemID" Type="Str">{7FE15022-DFF7-45A6-A100-156BF041C349}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[1].itemID" Type="Ref">/My Computer/Config</Property>
            <Property Name="Source[1].type" Type="Str">Container</Property>
            <Property Name="Source[10].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[10].itemID" Type="Ref">/My Computer/lib</Property>
            <Property Name="Source[10].type" Type="Str">Container</Property>
            <Property Name="Source[11].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[11].itemID" Type="Ref">/My Computer/NTCP library</Property>
            <Property Name="Source[11].type" Type="Str">Container</Property>
            <Property Name="Source[12].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[12].itemID" Type="Ref">/My Computer/NTCP library/.svn</Property>
            <Property Name="Source[12].type" Type="Str">Container</Property>
            <Property Name="Source[13].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[13].itemID" Type="Ref">/My Computer/NTCP library/.svn/prop-base</Property>
            <Property Name="Source[13].type" Type="Str">Container</Property>
            <Property Name="Source[14].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[14].itemID" Type="Ref">/My Computer/NTCP library/.svn/props</Property>
            <Property Name="Source[14].type" Type="Str">Container</Property>
            <Property Name="Source[15].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[15].itemID" Type="Ref">/My Computer/NTCP library/.svn/text-base</Property>
            <Property Name="Source[15].type" Type="Str">Container</Property>
            <Property Name="Source[16].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[16].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp</Property>
            <Property Name="Source[16].type" Type="Str">Container</Property>
            <Property Name="Source[17].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[17].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp/prop-base</Property>
            <Property Name="Source[17].type" Type="Str">Container</Property>
            <Property Name="Source[18].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[18].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp/props</Property>
            <Property Name="Source[18].type" Type="Str">Container</Property>
            <Property Name="Source[19].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[19].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp/text-base</Property>
            <Property Name="Source[19].type" Type="Str">Container</Property>
            <Property Name="Source[2].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[2].itemID" Type="Ref">/My Computer/Coordinate Alignment</Property>
            <Property Name="Source[2].type" Type="Str">Container</Property>
            <Property Name="Source[20].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[20].itemID" Type="Ref">/My Computer/NTCP library/About NTCP Socket.vi</Property>
            <Property Name="Source[20].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[20].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[20].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[20].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[20].type" Type="Str">VI</Property>
            <Property Name="Source[21].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[21].itemID" Type="Ref">/My Computer/NTCP library/ExternalSensorsDataString.vi</Property>
            <Property Name="Source[21].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[21].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[21].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[21].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[21].type" Type="Str">VI</Property>
            <Property Name="Source[22].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[22].itemID" Type="Ref">/My Computer/NTCP library/Generate 12-value control pt return value.vi</Property>
            <Property Name="Source[22].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[22].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[22].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[22].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[22].type" Type="Str">VI</Property>
            <Property Name="Source[23].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[23].itemID" Type="Ref">/My Computer/NTCP library/ntcp cmd - parse and enqueue.vi</Property>
            <Property Name="Source[23].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[23].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[23].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[23].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[23].type" Type="Str">VI</Property>
            <Property Name="Source[24].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[24].itemID" Type="Ref">/My Computer/NTCP library/ntcp command.vi</Property>
            <Property Name="Source[24].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[24].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[24].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[24].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[24].type" Type="Str">VI</Property>
            <Property Name="Source[25].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[25].itemID" Type="Ref">/My Computer/NTCP library/NTCP return.vi</Property>
            <Property Name="Source[25].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[25].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[25].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[25].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[25].type" Type="Str">VI</Property>
            <Property Name="Source[26].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[26].itemID" Type="Ref">/My Computer/NTCP library/NTCP Socket.vi</Property>
            <Property Name="Source[26].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[26].type" Type="Str">VI</Property>
            <Property Name="Source[27].itemID" Type="Ref">/My Computer/NTCP library/NTCPtestcommand.vi</Property>
            <Property Name="Source[27].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[27].properties[0].value" Type="Bool">true</Property>
            <Property Name="Source[27].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[27].type" Type="Str">VI</Property>
            <Property Name="Source[28].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[28].itemID" Type="Ref">/My Computer/NTCP library/OM reply - parse and enqueue.vi</Property>
            <Property Name="Source[28].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[28].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[28].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[28].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[28].type" Type="Str">VI</Property>
            <Property Name="Source[29].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[29].itemID" Type="Ref">/My Computer/NTCP library/Open ntcp command queue.vi</Property>
            <Property Name="Source[29].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[29].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[29].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[29].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[29].type" Type="Str">VI</Property>
            <Property Name="Source[3].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[3].itemID" Type="Ref">/My Computer/Data Transmission</Property>
            <Property Name="Source[3].type" Type="Str">Container</Property>
            <Property Name="Source[30].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[30].itemID" Type="Ref">/My Computer/NTCP library/Open OM reply queue.vi</Property>
            <Property Name="Source[30].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[30].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[30].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[30].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[30].type" Type="Str">VI</Property>
            <Property Name="Source[31].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[31].itemID" Type="Ref">/My Computer/NTCP library/ProposeCommand.vi</Property>
            <Property Name="Source[31].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[31].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[31].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[31].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[31].type" Type="Str">VI</Property>
            <Property Name="Source[32].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[32].itemID" Type="Ref">/My Computer/NTCP library/TCP read command.vi</Property>
            <Property Name="Source[32].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[32].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[32].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[32].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[32].type" Type="Str">VI</Property>
            <Property Name="Source[33].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[33].itemID" Type="Ref">/My Computer/NTCP library/WriteLogFile.vi</Property>
            <Property Name="Source[33].properties[0].type" Type="Str">Remove front panel</Property>
            <Property Name="Source[33].properties[0].value" Type="Bool">false</Property>
            <Property Name="Source[33].propertiesCount" Type="Int">1</Property>
            <Property Name="Source[33].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[33].type" Type="Str">VI</Property>
            <Property Name="Source[34].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[34].itemID" Type="Ref">/My Computer/TestData</Property>
            <Property Name="Source[34].type" Type="Str">Container</Property>
            <Property Name="Source[35].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[35].itemID" Type="Ref">/My Computer/TestData/.svn</Property>
            <Property Name="Source[35].type" Type="Str">Container</Property>
            <Property Name="Source[36].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[36].itemID" Type="Ref">/My Computer/TestData/.svn/prop-base</Property>
            <Property Name="Source[36].type" Type="Str">Container</Property>
            <Property Name="Source[37].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[37].itemID" Type="Ref">/My Computer/TestData/.svn/props</Property>
            <Property Name="Source[37].type" Type="Str">Container</Property>
            <Property Name="Source[38].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[38].itemID" Type="Ref">/My Computer/TestData/.svn/text-base</Property>
            <Property Name="Source[38].type" Type="Str">Container</Property>
            <Property Name="Source[39].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[39].itemID" Type="Ref">/My Computer/TestData/.svn/tmp</Property>
            <Property Name="Source[39].type" Type="Str">Container</Property>
            <Property Name="Source[4].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[4].itemID" Type="Ref">/My Computer/DigitalFilter</Property>
            <Property Name="Source[4].type" Type="Str">Container</Property>
            <Property Name="Source[40].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[40].itemID" Type="Ref">/My Computer/TestData/.svn/tmp/prop-base</Property>
            <Property Name="Source[40].type" Type="Str">Container</Property>
            <Property Name="Source[41].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[41].itemID" Type="Ref">/My Computer/TestData/.svn/tmp/props</Property>
            <Property Name="Source[41].type" Type="Str">Container</Property>
            <Property Name="Source[42].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[42].itemID" Type="Ref">/My Computer/TestData/.svn/tmp/text-base</Property>
            <Property Name="Source[42].type" Type="Str">Container</Property>
            <Property Name="Source[5].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[5].itemID" Type="Ref">/My Computer/DLL</Property>
            <Property Name="Source[5].type" Type="Str">Container</Property>
            <Property Name="Source[6].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[6].itemID" Type="Ref">/My Computer/External Actuators</Property>
            <Property Name="Source[6].type" Type="Str">Container</Property>
            <Property Name="Source[7].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[7].itemID" Type="Ref">/My Computer/IconFiles</Property>
            <Property Name="Source[7].type" Type="Str">Container</Property>
            <Property Name="Source[8].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[8].itemID" Type="Ref">/My Computer/image</Property>
            <Property Name="Source[8].type" Type="Str">Container</Property>
            <Property Name="Source[9].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[9].itemID" Type="Ref">/My Computer/InputData</Property>
            <Property Name="Source[9].type" Type="Str">Container</Property>
            <Property Name="SourceCount" Type="Int">43</Property>
         </Item>
         <Item Name="External Actuator Control" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{AAB88994-83AE-4547-B3D5-8A9E69E06247}</Property>
            <Property Name="App_applicationName" Type="Str">External Actuator Control.exe</Property>
            <Property Name="App_companyName" Type="Str">University of Illinois</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">1</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{4377C809-8E16-4E95-860A-689907F4672F}</Property>
            <Property Name="App_INI_GUID" Type="Str">{99A10263-0289-48EF-8EC1-B9DEBCB3EDF5}</Property>
            <Property Name="App_internalName" Type="Str">External Actuator Control</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright © 2008 University of Illinois</Property>
            <Property Name="App_productName" Type="Str">External Actuator Control</Property>
            <Property Name="Bld_buildSpecName" Type="Str">External Actuator Control</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_excludeTypedefs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Destination[0].destName" Type="Str">External Actuator Control.exe</Property>
            <Property Name="Destination[0].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 26 Feb 2008/internal.llb</Property>
            <Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
            <Property Name="Destination[1].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 26 Feb 2008/data</Property>
            <Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[2].destName" Type="Str">Destination Directory</Property>
            <Property Name="Destination[2].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 26 Feb 2008</Property>
            <Property Name="Destination[2].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="DestinationCount" Type="Int">3</Property>
            <Property Name="Source[0].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyProperties" Type="Bool">true</Property>
            <Property Name="Source[0].itemID" Type="Str">{7FE15022-DFF7-45A6-A100-156BF041C349}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[1].itemID" Type="Ref">/My Computer/Config</Property>
            <Property Name="Source[1].type" Type="Str">Container</Property>
            <Property Name="Source[10].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[10].itemID" Type="Ref">/My Computer/External Actuators/Actuator Feedback.ctl</Property>
            <Property Name="Source[10].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[10].type" Type="Str">VI</Property>
            <Property Name="Source[11].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[11].itemID" Type="Ref">/My Computer/External Actuators/Actuator Global Values.vi</Property>
            <Property Name="Source[11].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[11].type" Type="Str">VI</Property>
            <Property Name="Source[12].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[12].itemID" Type="Ref">/My Computer/External Actuators/External Actuator Control Test.vi</Property>
            <Property Name="Source[12].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[12].type" Type="Str">VI</Property>
            <Property Name="Source[13].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[13].itemID" Type="Ref">/My Computer/External Actuators/External Actuator Control.vi</Property>
            <Property Name="Source[13].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[13].type" Type="Str">VI</Property>
            <Property Name="Source[14].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[14].itemID" Type="Ref">/My Computer/External Actuators/External Control Test.vi</Property>
            <Property Name="Source[14].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[14].type" Type="Str">VI</Property>
            <Property Name="Source[15].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[15].itemID" Type="Ref">/My Computer/External Actuators/RampHold_Ext.vi</Property>
            <Property Name="Source[15].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[15].type" Type="Str">VI</Property>
            <Property Name="Source[16].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[16].itemID" Type="Ref">/My Computer/External Actuators/RampHold_Test.vi</Property>
            <Property Name="Source[16].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[16].type" Type="Str">VI</Property>
            <Property Name="Source[17].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[17].itemID" Type="Ref">/My Computer/IconFiles</Property>
            <Property Name="Source[17].type" Type="Str">Container</Property>
            <Property Name="Source[18].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[18].itemID" Type="Ref">/My Computer/image</Property>
            <Property Name="Source[18].type" Type="Str">Container</Property>
            <Property Name="Source[19].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[19].itemID" Type="Ref">/My Computer/InputData</Property>
            <Property Name="Source[19].type" Type="Str">Container</Property>
            <Property Name="Source[2].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[2].itemID" Type="Ref">/My Computer/Coordinate Alignment</Property>
            <Property Name="Source[2].type" Type="Str">Container</Property>
            <Property Name="Source[20].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[20].itemID" Type="Ref">/My Computer/lib</Property>
            <Property Name="Source[20].type" Type="Str">Container</Property>
            <Property Name="Source[21].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[21].itemID" Type="Ref">/My Computer/NTCP library</Property>
            <Property Name="Source[21].type" Type="Str">Container</Property>
            <Property Name="Source[22].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[22].itemID" Type="Ref">/My Computer/NTCP library/.svn</Property>
            <Property Name="Source[22].type" Type="Str">Container</Property>
            <Property Name="Source[23].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[23].itemID" Type="Ref">/My Computer/NTCP library/.svn/prop-base</Property>
            <Property Name="Source[23].type" Type="Str">Container</Property>
            <Property Name="Source[24].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[24].itemID" Type="Ref">/My Computer/NTCP library/.svn/props</Property>
            <Property Name="Source[24].type" Type="Str">Container</Property>
            <Property Name="Source[25].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[25].itemID" Type="Ref">/My Computer/NTCP library/.svn/text-base</Property>
            <Property Name="Source[25].type" Type="Str">Container</Property>
            <Property Name="Source[26].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[26].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp</Property>
            <Property Name="Source[26].type" Type="Str">Container</Property>
            <Property Name="Source[27].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[27].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp/prop-base</Property>
            <Property Name="Source[27].type" Type="Str">Container</Property>
            <Property Name="Source[28].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[28].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp/props</Property>
            <Property Name="Source[28].type" Type="Str">Container</Property>
            <Property Name="Source[29].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[29].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp/text-base</Property>
            <Property Name="Source[29].type" Type="Str">Container</Property>
            <Property Name="Source[3].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[3].itemID" Type="Ref">/My Computer/Data Transmission</Property>
            <Property Name="Source[3].type" Type="Str">Container</Property>
            <Property Name="Source[30].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[30].itemID" Type="Ref">/My Computer/TestData</Property>
            <Property Name="Source[30].type" Type="Str">Container</Property>
            <Property Name="Source[31].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[31].itemID" Type="Ref">/My Computer/TestData/.svn</Property>
            <Property Name="Source[31].type" Type="Str">Container</Property>
            <Property Name="Source[32].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[32].itemID" Type="Ref">/My Computer/TestData/.svn/prop-base</Property>
            <Property Name="Source[32].type" Type="Str">Container</Property>
            <Property Name="Source[33].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[33].itemID" Type="Ref">/My Computer/TestData/.svn/props</Property>
            <Property Name="Source[33].type" Type="Str">Container</Property>
            <Property Name="Source[34].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[34].itemID" Type="Ref">/My Computer/TestData/.svn/text-base</Property>
            <Property Name="Source[34].type" Type="Str">Container</Property>
            <Property Name="Source[35].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[35].itemID" Type="Ref">/My Computer/TestData/.svn/tmp</Property>
            <Property Name="Source[35].type" Type="Str">Container</Property>
            <Property Name="Source[36].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[36].itemID" Type="Ref">/My Computer/TestData/.svn/tmp/prop-base</Property>
            <Property Name="Source[36].type" Type="Str">Container</Property>
            <Property Name="Source[37].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[37].itemID" Type="Ref">/My Computer/TestData/.svn/tmp/props</Property>
            <Property Name="Source[37].type" Type="Str">Container</Property>
            <Property Name="Source[38].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[38].itemID" Type="Ref">/My Computer/TestData/.svn/tmp/text-base</Property>
            <Property Name="Source[38].type" Type="Str">Container</Property>
            <Property Name="Source[4].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[4].itemID" Type="Ref">/My Computer/DigitalFilter</Property>
            <Property Name="Source[4].type" Type="Str">Container</Property>
            <Property Name="Source[5].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[5].itemID" Type="Ref">/My Computer/DLL</Property>
            <Property Name="Source[5].type" Type="Str">Container</Property>
            <Property Name="Source[6].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[6].itemID" Type="Ref">/My Computer/External Actuators</Property>
            <Property Name="Source[6].type" Type="Str">Container</Property>
            <Property Name="Source[7].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[7].itemID" Type="Ref">/My Computer/External Actuators/Actuator Actions.ctl</Property>
            <Property Name="Source[7].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[7].type" Type="Str">VI</Property>
            <Property Name="Source[8].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[8].itemID" Type="Ref">/My Computer/External Actuators/Actuator Commands.ctl</Property>
            <Property Name="Source[8].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[8].type" Type="Str">VI</Property>
            <Property Name="Source[9].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[9].itemID" Type="Ref">/My Computer/External Actuators/Actuator Direct DAQ.vi</Property>
            <Property Name="Source[9].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[9].type" Type="Str">VI</Property>
            <Property Name="SourceCount" Type="Int">39</Property>
         </Item>
         <Item Name="External Actuator Control With Ramp" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{9664BDB8-2059-46B7-84C8-8AA7482A4019}</Property>
            <Property Name="App_applicationName" Type="Str">External Actuator Control With Ramp.exe</Property>
            <Property Name="App_companyName" Type="Str">University of Illinois</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">1</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{CE8F20E8-AA75-4773-ACCE-428A5066B4CB}</Property>
            <Property Name="App_INI_GUID" Type="Str">{28CC7297-9AD8-4470-9730-858D00CD2093}</Property>
            <Property Name="App_internalName" Type="Str">External Actuator Control With Ramp</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright © 2008 University of Illinois</Property>
            <Property Name="App_productName" Type="Str">External Actuator Control With Ramp</Property>
            <Property Name="Bld_buildSpecName" Type="Str">External Actuator Control With Ramp</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_excludeTypedefs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Destination[0].destName" Type="Str">External Actuator Control With Ramp.exe</Property>
            <Property Name="Destination[0].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 01 Apr 2008/internal.llb</Property>
            <Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
            <Property Name="Destination[1].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 01 Apr 2008/data</Property>
            <Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[2].destName" Type="Str">Destination Directory</Property>
            <Property Name="Destination[2].path" Type="Path">/C/Documents and Settings/All Users/Desktop/OM2 with External Actuators 01 Apr 2008</Property>
            <Property Name="Destination[2].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="DestinationCount" Type="Int">3</Property>
            <Property Name="Source[0].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyProperties" Type="Bool">true</Property>
            <Property Name="Source[0].itemID" Type="Str">{7FE15022-DFF7-45A6-A100-156BF041C349}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[1].itemID" Type="Ref">/My Computer/Config</Property>
            <Property Name="Source[1].type" Type="Str">Container</Property>
            <Property Name="Source[10].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[10].itemID" Type="Ref">/My Computer/External Actuators/Actuator Feedback.ctl</Property>
            <Property Name="Source[10].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[10].type" Type="Str">VI</Property>
            <Property Name="Source[11].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[11].itemID" Type="Ref">/My Computer/External Actuators/Actuator Global Values.vi</Property>
            <Property Name="Source[11].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[11].type" Type="Str">VI</Property>
            <Property Name="Source[12].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[12].itemID" Type="Ref">/My Computer/External Actuators/External Actuator Control.vi</Property>
            <Property Name="Source[12].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[12].type" Type="Str">VI</Property>
            <Property Name="Source[13].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[13].itemID" Type="Ref">/My Computer/External Actuators/External Control Test.vi</Property>
            <Property Name="Source[13].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[13].type" Type="Str">VI</Property>
            <Property Name="Source[14].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[14].itemID" Type="Ref">/My Computer/External Actuators/RampHold_Ext.vi</Property>
            <Property Name="Source[14].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[14].type" Type="Str">VI</Property>
            <Property Name="Source[15].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[15].itemID" Type="Ref">/My Computer/External Actuators/RampHold_Test.vi</Property>
            <Property Name="Source[15].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[15].type" Type="Str">VI</Property>
            <Property Name="Source[16].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[16].itemID" Type="Ref">/My Computer/IconFiles</Property>
            <Property Name="Source[16].type" Type="Str">Container</Property>
            <Property Name="Source[17].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[17].itemID" Type="Ref">/My Computer/image</Property>
            <Property Name="Source[17].type" Type="Str">Container</Property>
            <Property Name="Source[18].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[18].itemID" Type="Ref">/My Computer/InputData</Property>
            <Property Name="Source[18].type" Type="Str">Container</Property>
            <Property Name="Source[19].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[19].itemID" Type="Ref">/My Computer/lib</Property>
            <Property Name="Source[19].type" Type="Str">Container</Property>
            <Property Name="Source[2].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[2].itemID" Type="Ref">/My Computer/Coordinate Alignment</Property>
            <Property Name="Source[2].type" Type="Str">Container</Property>
            <Property Name="Source[20].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[20].itemID" Type="Ref">/My Computer/NTCP library</Property>
            <Property Name="Source[20].type" Type="Str">Container</Property>
            <Property Name="Source[21].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[21].itemID" Type="Ref">/My Computer/NTCP library/.svn</Property>
            <Property Name="Source[21].type" Type="Str">Container</Property>
            <Property Name="Source[22].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[22].itemID" Type="Ref">/My Computer/NTCP library/.svn/prop-base</Property>
            <Property Name="Source[22].type" Type="Str">Container</Property>
            <Property Name="Source[23].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[23].itemID" Type="Ref">/My Computer/NTCP library/.svn/props</Property>
            <Property Name="Source[23].type" Type="Str">Container</Property>
            <Property Name="Source[24].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[24].itemID" Type="Ref">/My Computer/NTCP library/.svn/text-base</Property>
            <Property Name="Source[24].type" Type="Str">Container</Property>
            <Property Name="Source[25].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[25].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp</Property>
            <Property Name="Source[25].type" Type="Str">Container</Property>
            <Property Name="Source[26].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[26].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp/prop-base</Property>
            <Property Name="Source[26].type" Type="Str">Container</Property>
            <Property Name="Source[27].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[27].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp/props</Property>
            <Property Name="Source[27].type" Type="Str">Container</Property>
            <Property Name="Source[28].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[28].itemID" Type="Ref">/My Computer/NTCP library/.svn/tmp/text-base</Property>
            <Property Name="Source[28].type" Type="Str">Container</Property>
            <Property Name="Source[29].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[29].itemID" Type="Ref">/My Computer/TestData</Property>
            <Property Name="Source[29].type" Type="Str">Container</Property>
            <Property Name="Source[3].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[3].itemID" Type="Ref">/My Computer/Data Transmission</Property>
            <Property Name="Source[3].type" Type="Str">Container</Property>
            <Property Name="Source[30].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[30].itemID" Type="Ref">/My Computer/TestData/.svn</Property>
            <Property Name="Source[30].type" Type="Str">Container</Property>
            <Property Name="Source[31].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[31].itemID" Type="Ref">/My Computer/TestData/.svn/prop-base</Property>
            <Property Name="Source[31].type" Type="Str">Container</Property>
            <Property Name="Source[32].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[32].itemID" Type="Ref">/My Computer/TestData/.svn/props</Property>
            <Property Name="Source[32].type" Type="Str">Container</Property>
            <Property Name="Source[33].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[33].itemID" Type="Ref">/My Computer/TestData/.svn/text-base</Property>
            <Property Name="Source[33].type" Type="Str">Container</Property>
            <Property Name="Source[34].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[34].itemID" Type="Ref">/My Computer/TestData/.svn/tmp</Property>
            <Property Name="Source[34].type" Type="Str">Container</Property>
            <Property Name="Source[35].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[35].itemID" Type="Ref">/My Computer/TestData/.svn/tmp/prop-base</Property>
            <Property Name="Source[35].type" Type="Str">Container</Property>
            <Property Name="Source[36].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[36].itemID" Type="Ref">/My Computer/TestData/.svn/tmp/props</Property>
            <Property Name="Source[36].type" Type="Str">Container</Property>
            <Property Name="Source[37].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[37].itemID" Type="Ref">/My Computer/TestData/.svn/tmp/text-base</Property>
            <Property Name="Source[37].type" Type="Str">Container</Property>
            <Property Name="Source[4].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[4].itemID" Type="Ref">/My Computer/DigitalFilter</Property>
            <Property Name="Source[4].type" Type="Str">Container</Property>
            <Property Name="Source[5].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[5].itemID" Type="Ref">/My Computer/DLL</Property>
            <Property Name="Source[5].type" Type="Str">Container</Property>
            <Property Name="Source[6].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[6].itemID" Type="Ref">/My Computer/External Actuators</Property>
            <Property Name="Source[6].type" Type="Str">Container</Property>
            <Property Name="Source[7].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[7].itemID" Type="Ref">/My Computer/External Actuators/Actuator Actions.ctl</Property>
            <Property Name="Source[7].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[7].type" Type="Str">VI</Property>
            <Property Name="Source[8].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[8].itemID" Type="Ref">/My Computer/External Actuators/Actuator Commands.ctl</Property>
            <Property Name="Source[8].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[8].type" Type="Str">VI</Property>
            <Property Name="Source[9].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[9].itemID" Type="Ref">/My Computer/External Actuators/Actuator Direct DAQ.vi</Property>
            <Property Name="Source[9].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[9].type" Type="Str">VI</Property>
            <Property Name="SourceCount" Type="Int">38</Property>
         </Item>
      </Item>
   </Item>
</Project>
