workflow control_module
{ 
$final_array = array_formation
$final_array_dim = array_pefdimension
    Foreach ($metric in $final_array)
        {
        Foreach ($metric3 in $final_array_dim)
            { 
            $oms_input = aws_export -metricnameinput $metric -dimension1input "InstanceId" -dimension2input $metric3 -namespaceinput "AWS/EC2"
            omsinput -oms_input $oms_input
            }
        }
$final_array_cloudtrail = array_cloudtrailmetric
    Foreach ($metric_1 in $final_array_cloudtrail)
        {
        $oms_input_cloudtrail = aws_export -metricnameinput $metric_1 -dimension1input "LogGroupName" -dimension2input "CloudTrail/DefaultLogGroup" -namespaceinput "AWS/Logs"
        omsinput -oms_input $oms_input_cloudtrail
        }
$final_array_rds = array_rdsmetrics
    Foreach ($metric_2 in $final_array_rds)
    {
    $oms_input_rds = aws_export -metricnameinput $metric_2 -dimension1input "DBInstanceIdentifier" -dimension2input "arnavdbinstance" -namespaceinput "AWS/RDS"
    omsinput -oms_input $oms_input_rds
    }
}