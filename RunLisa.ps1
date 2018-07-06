
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

cd .\WS2012R2\lisa

# Update the xml file firstly

if( $kernelGitBranch -and  $kernelCommitID )
{
	.\UpdateXmlConfig.ps1   -vmName $vmName  -hvServer $hvServer -testSuite $hvServer -DebugCases $DebugCases  -kernelGitBranch $kernelGitBranch -kernelCommitID $kernelCommitID
}
else
{
	.\UpdateXmlConfig.ps1   -vmName $vmName  -hvServer $hvServer -testSuite $hvServer -DebugCases $DebugCases
}

#Now, run lisa test
.\lisa run run.xml

cd ..\..


