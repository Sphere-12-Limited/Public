function Deploy-Agent {
	param(
		[Parameter(Mandatory)]
		[string]$CompanyID
  )
  if (-Not(Test-Path C:\ITadmin)) { 
    New-Item "C:\ITadmin" -ItemType Directory | Out-Null
  }
  $CheckInstalled = Get-WmiObject -Class Win32_Product | Where {$_.Name -like "*MSP Core Agent*"}
  if ($CheckInstalled) {
    Write-Output "N-Able already installed."
  } else {
    Write-Output "Installing N-Able."
    "C:\ITadmin\$CompanyID.exe"
  }
}
