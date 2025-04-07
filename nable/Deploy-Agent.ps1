function Deploy-Agent {
	param(
		[Parameter(Mandatory)]
		[string]$SiteID
	)
 
	if (-Not(Test-Path C:\ITadmin)) { 
		New-Item "C:\ITadmin" -ItemType Directory | Out-Null
	}
 
 	irm "https://github.com/Sphere-12-Limited/Public/raw/refs/heads/main/nable/$SiteID.EXE" -OutFile "C:\ITadmin\$SiteID.exe"
  
	$CheckInstalled = Get-WmiObject -Class Win32_Product | Where {$_.Name -like "*MSP Core Agent*"}
	if ($CheckInstalled) {
		Write-Output "N-Able already installed."
	} else {
		Write-Output "Installing N-Able."
		Start-Process -FilePath "C:\ITadmin\$SiteID.exe"
	}
}
