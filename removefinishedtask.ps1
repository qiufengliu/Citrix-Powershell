$controllers = Get-BrokerController | %{$_.DNSName}
foreach ($controller in $controllers){
$Tasks = Get-ProvTask -MaxRecordCount 1000 |?{$_.status -eq "finished"} |%{$_.taskid}
foreach ($task in $tasks)
{write-host "delete finished provtask..."
remove-provtask -taskid $task -adminaddress $controller
}
}