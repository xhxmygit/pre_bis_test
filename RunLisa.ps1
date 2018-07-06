
cd .\WS2012R2\lisa

# Update the xml file firstly
.\UpdateXmlConfig.ps1 -vmName "FreebsdStable11" -hvServer "localhost" -testSuite "debug" -DebugCases "Heartbeat" 

#Now, run lisa test
.\lisa run run.xml

cd ..\..


