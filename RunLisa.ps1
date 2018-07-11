
#######################################################################
# 
# Examples:
#	.\RunLisa.ps1 -vmName "FreebsdStable11" -hvServer "localhost" -testSuite "debug" -DebugCases "BuildKernel" -kernelGitBranch "master" -kernelCommitID "123456789"
#	.\RunLisa.ps1 -vmName "FreebsdStable11" -hvServer "localhost" -testSuite "debug" -DebugCases "Heartbeat" 
#
#######################################################################

param([string] $vmName, 
	[string] $hvServer, 
	[string] $testSuite,
	[string] $DebugCases,
	[string] $kernelGitBranch,
	[string] $kernelCommitID )

	
Copy-Item .\CI\UpdateXmlConfig.ps1 .\BIS\WS2012R2\lisa
Copy-Item .\CI\UtilsOfUpdateXmlConfig.ps1 .\BIS\WS2012R2\lisa

cd .\BIS\WS2012R2\lisa

# Update the xml file firstly

if( $kernelGitBranch -and  $kernelCommitID )
{
	.\UpdateXmlConfig.ps1   -vmName $vmName  -hvServer $hvServer -testSuite $testSuite -DebugCases $DebugCases  -kernelGitBranch $kernelGitBranch -kernelCommitID $kernelCommitID
}
else
{
	.\UpdateXmlConfig.ps1   -vmName $vmName  -hvServer $hvServer -testSuite $testSuite -DebugCases $DebugCases
}

#Now, run lisa test

.\lisa.ps1 run run.xml

cd ..\..\..


