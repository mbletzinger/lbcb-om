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
      <Item Name="Config" Type="Folder" URL="Config">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="DigitalFilter" Type="Folder" URL="DigitalFilter">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="IconFiles" Type="Folder" URL="IconFiles">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="image" Type="Folder" URL="image">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="InputFiles" Type="Folder" URL="InputFiles">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="lib" Type="Folder" URL="lib">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="NTCP library" Type="Folder" URL="NTCP library">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="DLL" Type="Folder" URL="DLL">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="Data Transmission" Type="Folder" URL="Data Transmission">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="Exec" Type="Folder" URL="Exec">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="Logs" Type="Folder" URL="Logs">
         <Property Name="NI.DISK" Type="Bool">true</Property>
      </Item>
      <Item Name="LBCB Operation Manager.vi" Type="VI" URL="LBCB Operation Manager.vi"/>
      <Item Name="Calibration Factor.xls" Type="Document" URL="Calibration Factor.xls"/>
      <Item Name="Menu.rtm" Type="Document" URL="Menu.rtm"/>
      <Item Name="OperationManagerGlobal.vi" Type="VI" URL="OperationManagerGlobal.vi"/>
      <Item Name="Calibration Factors.xls" Type="Document" URL="Calibration Factors.xls"/>
      <Item Name="RampHoldTest.vi" Type="VI" URL="Test Utilities/RampHoldTest.vi"/>
      <Item Name="Sample Averaging Test.vi" Type="VI" URL="Test Utilities/Sample Averaging Test.vi"/>
      <Item Name="Time stamp test.vi" Type="VI" URL="Test Utilities/Time stamp test.vi"/>
      <Item Name="Dependencies" Type="Dependencies">
         <Item Name="vi.lib" Type="Folder">
            <Item Name="Read BMP File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File.vi"/>
            <Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
            <Item Name="Read BMP File Data.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File Data.vi"/>
            <Item Name="Read BMP Header Info.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP Header Info.vi"/>
            <Item Name="Calc Long Word Padded Width.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Calc Long Word Padded Width.vi"/>
            <Item Name="Flip and Pad for Picture Control.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Flip and Pad for Picture Control.vi"/>
            <Item Name="Draw Flattened Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Flattened Pixmap.vi"/>
            <Item Name="FixBadRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/FixBadRect.vi"/>
            <Item Name="Open_Create_Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/Open_Create_Replace File.vi"/>
            <Item Name="compatFileDialog.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatFileDialog.vi"/>
            <Item Name="compatOpenFileOperation.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOpenFileOperation.vi"/>
            <Item Name="compatCalcOffset.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatCalcOffset.vi"/>
            <Item Name="Read From XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File.vi"/>
            <Item Name="Read From XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(array).vi"/>
            <Item Name="ParseXMLFragments.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/ParseXMLFragments.vi"/>
            <Item Name="FindFirstTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindFirstTag.vi"/>
            <Item Name="FindEmptyElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindEmptyElement.vi"/>
            <Item Name="FindElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElement.vi"/>
            <Item Name="FindMatchingCloseTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindMatchingCloseTag.vi"/>
            <Item Name="FindCloseTagByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindCloseTagByName.vi"/>
            <Item Name="FindElementStartByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElementStartByName.vi"/>
            <Item Name="Read From XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(string).vi"/>
            <Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
            <Item Name="Write to XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File.vi"/>
            <Item Name="Write to XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(string).vi"/>
            <Item Name="Write to XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(array).vi"/>
            <Item Name="DAQmx Write.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write.vi"/>
            <Item Name="DAQmx Write (Analog 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D DBL 1Chan NSamp).vi"/>
            <Item Name="DAQmx Fill In Error Info.vi" Type="VI" URL="/&lt;vilib&gt;/daqmx/miscellaneous.llb/DAQmx Fill In Error Info.vi"/>
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
            <Item Name="Waveform Array To Dynamic.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Waveform Array To Dynamic.vi"/>
            <Item Name="Dynamic To Waveform Array.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Dynamic To Waveform Array.vi"/>
            <Item Name="ex_Modify Signal Name.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_Modify Signal Name.vi"/>
            <Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
            <Item Name="NI_Matrix.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/Matrix/NI_Matrix.lvlib"/>
            <Item Name="Write Characters To File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Characters To File.vi"/>
            <Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
            <Item Name="Write File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write File+ (string).vi"/>
            <Item Name="compatWriteText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatWriteText.vi"/>
            <Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
            <Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
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
            <Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
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
            <Item Name="DAQmx Read.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read.vi"/>
            <Item Name="DAQmx Read (Analog 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D Wfm NChan NSamp).vi"/>
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
            <Item Name="Read Characters From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Characters From File.vi"/>
            <Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
            <Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
            <Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
            <Item Name="Merge Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Merge Errors.vi"/>
            <Item Name="Open/Create/Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open/Create/Replace File.vi"/>
            <Item Name="Error to Warning.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error to Warning.vi"/>
            <Item Name="TCP Listen.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen.vi"/>
            <Item Name="Internecine Avoider.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/Internecine Avoider.vi"/>
            <Item Name="TCP Listen List Operations.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen List Operations.ctl"/>
            <Item Name="TCP Listen Internal List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen Internal List.vi"/>
            <Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
            <Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
            <Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
            <Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
            <Item Name="Open Config Data.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Open Config Data.vi"/>
            <Item Name="Config Data Open Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Open Reference.vi"/>
            <Item Name="Config Data Registry Functions.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Registry Functions.ctl"/>
            <Item Name="Config Data Registry.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Registry.vi"/>
            <Item Name="Config Data.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data.ctl"/>
            <Item Name="Config Data Section.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Section.ctl"/>
            <Item Name="Config Data Set File Path.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Set File Path.vi"/>
            <Item Name="Config Data Modify Functions.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Modify Functions.ctl"/>
            <Item Name="Config Data Modify.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Modify.vi"/>
            <Item Name="Add Quotes.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Add Quotes.vi"/>
            <Item Name="Info From Config Data.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Info From Config Data.vi"/>
            <Item Name="Config Data Read From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Read From File.vi"/>
            <Item Name="Config Data Get File Path.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Get File Path.vi"/>
            <Item Name="String to Config Data.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/String to Config Data.vi"/>
            <Item Name="Invalid Config Data Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Invalid Config Data Reference.vi"/>
            <Item Name="Config Data Close Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data Close Reference.vi"/>
            <Item Name="NI_MABase.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MABase.lvlib"/>
            <Item Name="Config Data RefNum" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/Config Data RefNum"/>
            <Item Name="DAQmx Stop Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Stop Task.vi"/>
         </Item>
         <Item Name="RampHold.dll" Type="Document" URL="lib/DLL/RampHold.dll"/>
         <Item Name="OperationManagerGlobal_Slave.vi" Type="VI" URL="OperationManagerGlobal_Slave.vi"/>
         <Item Name="MixedModeControl.vi" Type="VI" URL="lib/MixedMode/MixedModeControl.vi"/>
         <Item Name="StiffnessJacobian.ctl" Type="VI" URL="lib/MixedMode/StiffnessJacobian.ctl"/>
         <Item Name="lvanlys.dll" Type="Document" URL="../../../../../Program Files/National Instruments/LabVIEW 8.5/resource/lvanlys.dll"/>
         <Item Name="nilvaiu.dll" Type="Document" URL="nilvaiu.dll"/>
         <Item Name="systemexec" Type="VI" URL="systemexec"/>
      </Item>
      <Item Name="Build Specifications" Type="Build">
         <Item Name="LBCB OM 2.00" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{57C3770E-1E04-49DB-9AC6-3F2971020B88}</Property>
            <Property Name="App_applicationName" Type="Str">LBCB Operation Manager.exe</Property>
            <Property Name="App_companyName" Type="Str">University of Illinois</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">2</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{201DC45C-ACF9-4DCF-A7A1-706292F005AE}</Property>
            <Property Name="App_INI_GUID" Type="Str">{2C4F13AB-15A9-450C-9083-C3C7C0D1641F}</Property>
            <Property Name="App_internalName" Type="Str">Master Slave</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright © 2008 University of Illinois</Property>
            <Property Name="App_productName" Type="Str">LBCB Operation Manager</Property>
            <Property Name="Bld_buildSpecName" Type="Str">LBCB OM 2.00</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_excludeTypedefs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Bld_supportedLanguage[0]" Type="Str">English</Property>
            <Property Name="Bld_supportedLanguageCount" Type="Int">1</Property>
            <Property Name="Destination[0].destName" Type="Str">LBCB Operation Manager.exe</Property>
            <Property Name="Destination[0].path" Type="Path">/C/Documents and Settings/All Users/Desktop/MEBs Latest Build/internal.llb</Property>
            <Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
            <Property Name="Destination[1].path" Type="Path">/C/Documents and Settings/All Users/Desktop/MEBs Latest Build/data</Property>
            <Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[2].destName" Type="Str">Destination Directory</Property>
            <Property Name="Destination[2].path" Type="Path">/C/Documents and Settings/All Users/Desktop/MEBs Latest Build</Property>
            <Property Name="Destination[2].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[3].destName" Type="Str">Config</Property>
            <Property Name="Destination[3].path" Type="Path">/C/Documents and Settings/All Users/Desktop/MEBs Latest Build/Config</Property>
            <Property Name="Destination[3].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[4].destName" Type="Str">DigitalFilter</Property>
            <Property Name="Destination[4].path" Type="Path">/C/Documents and Settings/All Users/Desktop/MEBs Latest Build/DigitalFilter</Property>
            <Property Name="Destination[4].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[5].destName" Type="Str">InputFiles</Property>
            <Property Name="Destination[5].path" Type="Path">/C/Documents and Settings/All Users/Desktop/MEBs Latest Build/InputFiles</Property>
            <Property Name="Destination[5].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[6].destName" Type="Str">image</Property>
            <Property Name="Destination[6].path" Type="Path">/C/Documents and Settings/All Users/Desktop/MEBs Latest Build/image</Property>
            <Property Name="Destination[6].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[7].destName" Type="Str">Exec</Property>
            <Property Name="Destination[7].path" Type="Path">/C/Documents and Settings/All Users/Desktop/MEBs Latest Build/Exec</Property>
            <Property Name="Destination[7].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[8].destName" Type="Str">Logs</Property>
            <Property Name="Destination[8].path" Type="Path">/C/Documents and Settings/All Users/Desktop/MEBs Latest Build/Logs</Property>
            <Property Name="Destination[8].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="DestinationCount" Type="Int">9</Property>
            <Property Name="Exe_iconItemID" Type="Ref">/My Computer/IconFiles/LBCB Operation Manager.ico</Property>
            <Property Name="Source[0].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[0].Container.applyProperties" Type="Bool">true</Property>
            <Property Name="Source[0].itemID" Type="Str">{556DC50E-F517-4B05-B154-4CCE2F6309FC}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[1].itemID" Type="Ref">/My Computer/LBCB Operation Manager.vi</Property>
            <Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[1].type" Type="Str">VI</Property>
            <Property Name="Source[10].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[10].itemID" Type="Ref">/My Computer/Exec/Continuous Logging.vi</Property>
            <Property Name="Source[10].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[10].type" Type="Str">VI</Property>
            <Property Name="Source[11].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[11].itemID" Type="Ref">/My Computer/Exec/Mixed Mode Widget.vi</Property>
            <Property Name="Source[11].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[11].type" Type="Str">VI</Property>
            <Property Name="Source[12].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[12].itemID" Type="Ref">/My Computer/Exec/MixedModeStateMachine.vi</Property>
            <Property Name="Source[12].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[12].type" Type="Str">VI</Property>
            <Property Name="Source[13].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[13].itemID" Type="Ref">/My Computer/Exec/NTCP Socket.vi</Property>
            <Property Name="Source[13].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[13].type" Type="Str">VI</Property>
            <Property Name="Source[14].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[14].itemID" Type="Ref">/My Computer/Exec/Slave OM.vi</Property>
            <Property Name="Source[14].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[14].type" Type="Str">VI</Property>
            <Property Name="Source[15].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[15].itemID" Type="Ref">/My Computer/Exec/Step Logging.vi</Property>
            <Property Name="Source[15].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[15].type" Type="Str">VI</Property>
            <Property Name="Source[16].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[16].itemID" Type="Ref">/My Computer/Data Transmission/Data Transmission Test.vi</Property>
            <Property Name="Source[16].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[16].type" Type="Str">VI</Property>
            <Property Name="Source[17].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[17].itemID" Type="Ref">/My Computer/Data Transmission/DataTransmissionActions.vi</Property>
            <Property Name="Source[17].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[17].type" Type="Str">VI</Property>
            <Property Name="Source[18].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[18].itemID" Type="Ref">/My Computer/Data Transmission/DataTransmissionGlobals.vi</Property>
            <Property Name="Source[18].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[18].type" Type="Str">VI</Property>
            <Property Name="Source[19].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[19].itemID" Type="Ref">/My Computer/Data Transmission/DataTransmissionTcpWriter.vi</Property>
            <Property Name="Source[19].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[19].type" Type="Str">VI</Property>
            <Property Name="Source[2].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[2].destinationIndex" Type="Int">6</Property>
            <Property Name="Source[2].itemID" Type="Ref">/My Computer/IconFiles</Property>
            <Property Name="Source[2].type" Type="Str">Container</Property>
            <Property Name="Source[20].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[20].itemID" Type="Ref">/My Computer/Data Transmission/LaunchDataTransmissionTcpWriterVi.vi</Property>
            <Property Name="Source[20].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[20].type" Type="Str">VI</Property>
            <Property Name="Source[21].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[21].itemID" Type="Ref">/My Computer/Data Transmission/TransmitData.vi</Property>
            <Property Name="Source[21].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[21].type" Type="Str">VI</Property>
            <Property Name="Source[22].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[22].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[22].destinationIndex" Type="Int">4</Property>
            <Property Name="Source[22].itemID" Type="Ref">/My Computer/DigitalFilter</Property>
            <Property Name="Source[22].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[22].type" Type="Str">Container</Property>
            <Property Name="Source[23].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[23].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[23].destinationIndex" Type="Int">3</Property>
            <Property Name="Source[23].itemID" Type="Ref">/My Computer/Config</Property>
            <Property Name="Source[23].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[23].type" Type="Str">Container</Property>
            <Property Name="Source[24].destinationIndex" Type="Int">8</Property>
            <Property Name="Source[24].itemID" Type="Ref">/My Computer/Logs/fake log.txt</Property>
            <Property Name="Source[24].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[25].destinationIndex" Type="Int">2</Property>
            <Property Name="Source[25].itemID" Type="Ref">/My Computer/OperationManagerGlobal.vi</Property>
            <Property Name="Source[25].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[25].type" Type="Str">VI</Property>
            <Property Name="Source[26].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[26].destinationIndex" Type="Int">7</Property>
            <Property Name="Source[26].itemID" Type="Ref">/My Computer/Exec</Property>
            <Property Name="Source[26].type" Type="Str">Container</Property>
            <Property Name="Source[3].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[3].itemID" Type="Ref">/My Computer/IconFiles/LBCB Operation Manager.ico</Property>
            <Property Name="Source[3].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[4].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[4].itemID" Type="Ref">/My Computer/IconFiles/NTCP socket.ico</Property>
            <Property Name="Source[4].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[5].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[5].itemID" Type="Ref">/My Computer/image/LBCB.bmp</Property>
            <Property Name="Source[5].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[6].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[6].itemID" Type="Ref">/My Computer/image/UILogoCL1c_mdf.bmp</Property>
            <Property Name="Source[6].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[7].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[7].destinationIndex" Type="Int">6</Property>
            <Property Name="Source[7].itemID" Type="Ref">/My Computer/image</Property>
            <Property Name="Source[7].type" Type="Str">Container</Property>
            <Property Name="Source[8].Container.applyDestination" Type="Bool">true</Property>
            <Property Name="Source[8].Container.applyInclusion" Type="Bool">true</Property>
            <Property Name="Source[8].destinationIndex" Type="Int">5</Property>
            <Property Name="Source[8].itemID" Type="Ref">/My Computer/InputFiles</Property>
            <Property Name="Source[8].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[8].type" Type="Str">Container</Property>
            <Property Name="Source[9].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[9].itemID" Type="Ref">/My Computer/Data Transmission/Data Transmission Launcher.vi</Property>
            <Property Name="Source[9].sourceInclusion" Type="Str">Include</Property>
            <Property Name="Source[9].type" Type="Str">VI</Property>
            <Property Name="SourceCount" Type="Int">27</Property>
         </Item>
      </Item>
   </Item>
</Project>
