function Deploy-VSAX {

  param(
    [Parameter(Mandatory)]
    [string]$VSAXURL
  )

  if (-Not(Test-Path "C:\S12")) {
    New-Item -Path "C:\S12" -ItemType "Directory"
  }

  Invoke-WebRequest $VSAXURL -OutFile "C:\S12\agent.msi"
}
