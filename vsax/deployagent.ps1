function Deploy-VSAX {
  param(
    [Parameter(Mandatory)]
    [string]$VSAXURL
  )

  if (-Not(Test-Path "C:\S12")) {
    New-Item -Path "C:\S12" -ItemType "Directory"
  }

  $Agent = "C:\S12\agent.msi"
  Invoke-WebRequest $VSAXURL -OutFile $Agent

  msiexec /i $Agent /qn

  Start-Sleep -Seconds 15
  Remove-Item $Agent
}
