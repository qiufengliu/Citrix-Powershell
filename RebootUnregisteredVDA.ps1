asnp citrix.broker.admin.v2

$machines = Get-BrokerMachine -MaxRecordCount 3000

foreach ($machine in $machines) {
$vm = $machine.MachineName
$powerstatus = $machine.PowerState
$registerstatus = $machine.RegistrationState
$sessionstatus = $machine.SessionCount
$LastDeregistrationTime = $machine.LastDeregistrationTime
$time = Get-Date


If (($powerstatus -eq "On") -and ($registerstatus -eq "Unregistered") -and ($sessionstatus -eq 0) )
{
   If ($LastDeregistrationTime)
   {
     $diff = $time-$LastDeregistrationTime
      
     If([int] $diff.TotalMinutes -gt 15)
     {  
        New-BrokerHostingPowerAction -MachineName $vm -Action Reset
        write-host "restart problematic machines.."
        echo "Date:$time machine:$vm" >> C:\restartlog.txt
     }
   } 

} 
} 