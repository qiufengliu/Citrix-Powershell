#Delete registry on DDC for 7.15
#Cleanup connection string

Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\DesktopServer\DataStore\Connections\Controller ConnectionString  $null
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\ADIdentitySchema\DataStore\Connections ConnectionString  $null
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\Analytics\DataStore\Connections ConnectionString  $null
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\AppLibrarySchema\DataStore\Connections ConnectionString  $null 
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\ConfigLoggingSiteSchema\DataStore\Connections ConnectionString  $null 
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\ConfigurationSchema\DataStore\Connections ConnectionString  $null 
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\DAS\DataStore\Connections ConnectionString  $null 
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\DesktopUpdateManagerSchema\DataStore\Connections ConnectionString  $null 
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\EnvTestServiceSchema\DataStore\Connections ConnectionString  $null
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\HostingUnitServiceSchema\DataStore\Connections ConnectionString  $null
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\Monitor\DataStore\Connections ConnectionString  $null 
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\OrchestrationSchema\DataStore\Connections ConnectionString  $null
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\StorefrontSchema\DataStore\Connections ConnectionString  $null 
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\TrustSchema\DataStore\Connections ConnectionString  $null



#Reset Connection string

Asnp citrix*
$cs="Server=DB.ctx.com;Failover Partner=DB2.ctx.com;Initial Catalog=Citrixsite;Integrated Security=True"
$cslog="Server=DB.ctx.com;Failover Partner=DB2.ctx.com;Initial Catalog=CitrixLogging;Integrated Security=True"
$csmonitor="Server=DB.ctx.com;Failover Partner=DB2.ctx.com;Initial Catalog=CitrixMonitoring;Integrated Security=True"

Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\DesktopServer\DataStore\Connections\Controller ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\ADIdentitySchema\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\Analytics\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\AppLibrarySchema\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\ConfigLoggingSiteSchema\DataStore\Connections ConnectionString  $cs 
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\ConfigurationSchema\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\DAS\DataStore\Connections ConnectionString  $cs 
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\DesktopUpdateManagerSchema\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\EnvTestServiceSchema\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\HostingUnitServiceSchema\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\Monitor\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\OrchestrationSchema\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\StorefrontSchema\DataStore\Connections ConnectionString  $cs
Set-ItemProperty -Path HKLM:\SOFTWARE\Citrix\XDservices\TrustSchema\DataStore\Connections ConnectionString  $cs

Set-MonitorDBConnection -datastore Monitor -DBConnection $null
Set-MonitorDBConnection -datastore Monitor -DBConnection $csmonitor
Set-LogDBConnection -datastore Logging  -DBConnection $null
Set-LogDBConnection -datastore Logging  -DBConnection $cslog
