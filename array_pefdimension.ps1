workflow array_pefdimension {
    $metric = Get-AutomationVariable -Name 'aws_dimensionperf'
$final_array = inlineScript {
		
        $myString = $using:metric
$final_array = @($myString.Split(","))
Write-Output $final_array
}
return $final_array

}