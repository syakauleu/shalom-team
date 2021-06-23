# Install AD 

# show roles and features
Get-WindowsFeature

# Install AD

install-windowsfeature AD-Domain-Services

# Install AD succes

# Install first cotroller 

Import-Module ADDSDeployment

Install-ADDSForest -DatabasePath "C:\Windows\NTDS" -DomainMode "Win2012" -DomainName "testdomain.local" -DomainNetbiosName "TESTDOMAIN" -ForestMode "Win2012" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootONCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -force:$true

# Get domain information of the current local computer domain

Get-ADDomain -Current LocalComputer

# Get domain information from Active Directory

Get-ADDomain -Identity testdomain.local

# check connection domain

if ((Test-Connection -ComputerName testdomain.local -Quiet) -eq $true)

{Write-Host "Connection established"}

else {Write-Host "Connection failed"}