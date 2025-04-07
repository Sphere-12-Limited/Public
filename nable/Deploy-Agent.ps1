function Deploy-Agent {
	param(
		[Parameter(Mandatory)]
		[string]$CompanyID
	)
 
	if (-Not(Test-Path C:\ITadmin)) { 
		New-Item "C:\ITadmin" -ItemType Directory | Out-Null
	}
 
 	irm "https://raw.githubusercontent.com/Sphere-12-Limited/Public/refs/heads/main/nable/$CompanyID.exe" -OutFile "C:\ITadmin\$CompanyID.exe"
  
	$CheckInstalled = Get-WmiObject -Class Win32_Product | Where {$_.Name -like "*MSP Core Agent*"}
	if ($CheckInstalled) {
		Write-Output "N-Able already installed."
	} else {
		Write-Output "Installing N-Able."
		Start-Process -FilePath "C:\ITadmin\$CompanyID.exe"
	}
}
