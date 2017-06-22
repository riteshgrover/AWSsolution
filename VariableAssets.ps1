New-AzureRmAutomationVariable -ResourceGroupName "AutomationAccountRG1" 
–AutomationAccountName "AutomationAccount1" –Name 'MyStringVariable' `
–Encrypted $false –Value 'My String'
