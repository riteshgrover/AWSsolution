workflow aws_export {
   Param($metricnameinput,$dimension1input,$dimension2input,$namespaceinput)
	$json_object =  inlineScript {
        $metricname = $using:metricnameinput
        $dimension1 = $using:dimension1input
        $dimension2 = $using:dimension2input
        $namespace = $using:namespaceinput
        $accesskey = Get-AutomationVariable -Name 'aws_accesskey'
    		$secretkey = Get-AutomationVariable -Name 'aws_secretkey'
    		$OMSWorkspacename = Get-AutomationVariable -Name 'OMSwkspname'
    		$resourcegroupname = Get-AutomationVariable -Name 'OMSrgname'
    		$customerId = Get-AutomationVariable -Name 'aws_customerid'
    		$sharedKey = Get-AutomationVariable -Name 'aws_sharedkey'
    		$profile_name = Get-AutomationVariable -Name 'aws_profilename'
    		$region = Get-AutomationVariable -Name 'aws_region'
        		Import-Module AWSPowerShell
 				Set-AWSCredentials -AccessKey $accesskey -SecretKey $secretkey -StoreAs $profile_name
 				Initialize-AWSDefaults -ProfileName $profile_name -Region $region
		$json10 = Get-CWMetricStatistics -MetricName $metricname -Dimension @{Name = $dimension1; Value = $dimension2} -StartTime (Get-Date).AddHours(-1) -EndTime (Get-Date) -Namespace $namespace -Period 1200 -Statistic Average | Select-Object -ExpandProperty Datapoints | ConvertTo-Json
        		$json = $json10 | ConvertFrom-Json | ForEach-Object { 
    		$_ | Add-Member -MemberType NoteProperty -Name 'ObjectName' -Value $metricname -PassThru
        
	} | ConvertTo-Json
    Write-Output $json
      } 
      return $json_object
}
