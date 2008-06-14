<?xml version='1.0'?>
<Project Type="Project" LVVersion="8208000">
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
      <Item Name="LBCB Operation Manager_Master.vi" Type="VI" URL="LBCB Operation Manager_Master.vi"/>
      <Item Name="LBCB Operation Manager_Slave.vi" Type="VI" URL="LBCB Operation Manager_Slave.vi"/>
      <Item Name="Dependencies" Type="Dependencies"/>
      <Item Name="Build Specifications" Type="Build">
         <Item Name="LBCB OM 1n1" Type="EXE">
            <Property Name="Absolute[0]" Type="Bool">false</Property>
            <Property Name="Absolute[1]" Type="Bool">false</Property>
            <Property Name="Absolute[2]" Type="Bool">false</Property>
            <Property Name="ActiveXInfoEnumCLSIDsItemCount" Type="Int">0</Property>
            <Property Name="ActiveXInfoMajorVersion" Type="Int">0</Property>
            <Property Name="ActiveXInfoMinorVersion" Type="Int">0</Property>
            <Property Name="ActiveXInfoObjCLSIDsItemCount" Type="Int">0</Property>
            <Property Name="ActiveXInfoProgIDPrefix" Type="Str"></Property>
            <Property Name="ActiveXServerName" Type="Str"></Property>
            <Property Name="AliasID" Type="Str">{201DC45C-ACF9-4DCF-A7A1-706292F005AE}</Property>
            <Property Name="AliasName" Type="Str">Project.aliases</Property>
            <Property Name="ApplicationID" Type="Str">{57C3770E-1E04-49DB-9AC6-3F2971020B88}</Property>
            <Property Name="ApplicationName" Type="Str">LBCB OM 1n1.exe</Property>
            <Property Name="AutoIncrement" Type="Bool">false</Property>
            <Property Name="BuildName" Type="Str">LBCB OM 1n1</Property>
            <Property Name="CommandLineArguments" Type="Bool">false</Property>
            <Property Name="CopyErrors" Type="Bool">false</Property>
            <Property Name="DebuggingEXE" Type="Bool">false</Property>
            <Property Name="DebugServerWaitOnLaunch" Type="Bool">false</Property>
            <Property Name="DefaultLanguage" Type="Str">English</Property>
            <Property Name="DependencyApplyDestination" Type="Bool">true</Property>
            <Property Name="DependencyApplyInclusion" Type="Bool">true</Property>
            <Property Name="DependencyApplyProperties" Type="Bool">true</Property>
            <Property Name="DependencyFolderDestination" Type="Int">0</Property>
            <Property Name="DependencyFolderInclusion" Type="Str">As needed</Property>
            <Property Name="DependencyFolderPropertiesItemCount" Type="Int">0</Property>
            <Property Name="DestinationID[0]" Type="Str">{286B40B0-F8AE-4728-9134-B1A78C28BB19}</Property>
            <Property Name="DestinationID[1]" Type="Str">{286B40B0-F8AE-4728-9134-B1A78C28BB19}</Property>
            <Property Name="DestinationID[2]" Type="Str">{EF35066B-C065-44A4-9C14-92206BC047EA}</Property>
            <Property Name="DestinationItemCount" Type="Int">3</Property>
            <Property Name="DestinationName[0]" Type="Str">LBCB OM 1n1.exe</Property>
            <Property Name="DestinationName[1]" Type="Str">Destination Directory</Property>
            <Property Name="DestinationName[2]" Type="Str">Support Directory</Property>
            <Property Name="Disconnect" Type="Bool">true</Property>
            <Property Name="IncludeHWConfig" Type="Bool">false</Property>
            <Property Name="IncludeSCC" Type="Bool">true</Property>
            <Property Name="INIID" Type="Str">{2C4F13AB-15A9-450C-9083-C3C7C0D1641F}</Property>
            <Property Name="ININame" Type="Str">LabVIEW.ini</Property>
            <Property Name="LOGID" Type="Str">{C29D5986-76D7-499A-BE44-D1B9583A9663}</Property>
            <Property Name="MathScript" Type="Bool">false</Property>
            <Property Name="Path[0]" Type="Path">../../builds/LBCB Operation Manager_Master/LBCB OM 1n1/internal.llb</Property>
            <Property Name="Path[1]" Type="Path">../../builds/LBCB Operation Manager_Master/LBCB OM 1n1</Property>
            <Property Name="Path[2]" Type="Path">../../builds/LBCB Operation Manager_Master/LBCB OM 1n1/data</Property>
            <Property Name="ShowHWConfig" Type="Bool">false</Property>
            <Property Name="SourceInfoItemCount" Type="Int">2</Property>
            <Property Name="SourceItem[0].Inclusion" Type="Str">Startup VI</Property>
            <Property Name="SourceItem[0].ItemID" Type="Ref">/My Computer/LBCB Operation Manager_Master.vi</Property>
            <Property Name="SourceItem[0].VIPropertiesItemCount" Type="Int">2</Property>
            <Property Name="SourceItem[0].VIPropertiesSettingOption[0]" Type="Str">Remove panel</Property>
            <Property Name="SourceItem[0].VIPropertiesSettingOption[1]" Type="Str">Run when opened</Property>
            <Property Name="SourceItem[0].VIPropertiesVISetting[0]" Type="Bool">false</Property>
            <Property Name="SourceItem[0].VIPropertiesVISetting[1]" Type="Bool">true</Property>
            <Property Name="SourceItem[1].Inclusion" Type="Str">Startup VI</Property>
            <Property Name="SourceItem[1].ItemID" Type="Ref">/My Computer/LBCB Operation Manager_Slave.vi</Property>
            <Property Name="SourceItem[1].VIPropertiesItemCount" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIPropertiesSettingOption[0]" Type="Str">Remove panel</Property>
            <Property Name="SourceItem[1].VIPropertiesVISetting[0]" Type="Bool">false</Property>
            <Property Name="StripLib" Type="Bool">true</Property>
            <Property Name="SupportedLanguage[0]." Type="Str">ChineseS</Property>
            <Property Name="SupportedLanguage[1]." Type="Str">English</Property>
            <Property Name="SupportedLanguage[2]." Type="Str">French</Property>
            <Property Name="SupportedLanguage[3]." Type="Str">German</Property>
            <Property Name="SupportedLanguage[4]." Type="Str">Japanese</Property>
            <Property Name="SupportedLanguage[5]." Type="Str">Korean</Property>
            <Property Name="SupportedLanguageCount" Type="Int">6</Property>
            <Property Name="TLBID" Type="Str">{86475A0C-944E-44C5-847A-C93A3713FE8D}</Property>
            <Property Name="UseFFRTE" Type="Bool">false</Property>
            <Property Name="VersionInfoCompanyName" Type="Str">University of Illinois</Property>
            <Property Name="VersionInfoFileDescription" Type="Str"></Property>
            <Property Name="VersionInfoFileType" Type="Int">1</Property>
            <Property Name="VersionInfoFileVersionBuild" Type="Int">0</Property>
            <Property Name="VersionInfoFileVersionMajor" Type="Int">1</Property>
            <Property Name="VersionInfoFileVersionMinor" Type="Int">0</Property>
            <Property Name="VersionInfoFileVersionPatch" Type="Int">0</Property>
            <Property Name="VersionInfoInternalName" Type="Str">My Application</Property>
            <Property Name="VersionInfoLegalCopyright" Type="Str">Copyright © 2008 University of Illinois</Property>
            <Property Name="VersionInfoProductName" Type="Str">My Application</Property>
         </Item>
      </Item>
   </Item>
</Project>
