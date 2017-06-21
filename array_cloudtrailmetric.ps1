workflow array_cloudtrailmetric {
    $metric = Get-AutomationVariable -Name 'aws_metricscloudtrail'
$final_array = inlineScript {
		
        $myString = $using:metric
$final_array = @($myString.Split(","))
Write-Output $final_array
}
return $final_array

}