# PowerShell-SMS
Send SMS messages using SMS APIs with PowerShell.

This module currently supports the following SMS API providers:

- [Twilio](https://www.twilio.com)
- [Nexmo](https://www.nexmo.com)
- [SMSAPI](https://www.smsapi.com)

## How do I install this module?
You can manually instaal this module by yourself by cloning this repository if you want to, but for your convenience I have made this automatic installation script:

```powershell
If ([Environment]::OSVersion.Platform -eq "Unix") {
    $ModulePath = [Environment]::GetEnvironmentVariable("PSModulePath").split(":")[0]
    If (Test-Path "$ModulePath/PowerShell-SMS.zip"){Remove-Item "$ModulePath/PowerShell-SMS.zip"}
    If (Test-Path "$ModulePath/PowerShell-SMS"){Remove-Item "$ModulePath/PowerShell-SMS" -Confirm:$false -Recurse -Force}
    Invoke-WebRequest https://github.com/bmsimons/PowerShell-SMS/zipball/master -OutFile "$ModulePath/PowerShell-SMS.zip"
    Expand-Archive "$ModulePath/PowerShell-SMS.zip" -DestinationPath "$ModulePath"
    Remove-Item "$ModulePath/PowerShell-SMS.zip"
    Get-ChildItem "$ModulePath" | where { $_.Name -like "bmsimons-PowerShell-SMS*" } | % { Move-Item -Path ("$ModulePath/"+$_.Name) -Destination "$ModulePath/PowerShell-SMS" }
} Else {
    $ModulePath = [Environment]::GetEnvironmentVariable("PSModulePath").split(";")[0]
    If (Test-Path "$ModulePath\PowerShell-SMS.zip"){Remove-Item "$ModulePath\PowerShell-SMS.zip"}
    If (Test-Path "$ModulePath\PowerShell-SMS"){Remove-Item "$ModulePath\PowerShell-SMS" -Confirm:$false -Recurse -Force}
    Invoke-WebRequest https://github.com/bmsimons/PowerShell-SMS/zipball/master -OutFile "$ModulePath\PowerShell-SMS.zip"
    Expand-Archive "$ModulePath\PowerShell-SMS.zip" -DestinationPath "$ModulePath"
    Remove-Item "$ModulePath/PowerShell-SMS.zip"
    Get-ChildItem "$ModulePath" | where { $_.Name -like "bmsimons-PowerShell-SMS*" } | % { Move-Item -Path ("$ModulePath\"+$_.Name) -Destination "$ModulePath\PowerShell-SMS" }
}
```

Just copy-paste the above code in your PowerShell interpreter and you should be good to go!
(Please note that the automatic installer is only confirmed to work in the open-source version of PowerShell)

---------------------------------------------------------------------------

### Configure PowerShell-SMS for use with Twilio
```powershell
Import-Module PowerShell-SMS

Set-Twilio -AccountSid YOURACCOUNTSIDGOESHERE -AuthToken YOURAUTHTOKENGOESHERE
```

### Configure PowerShell-SMS for use with Nexmo
```powershell
Import-Module PowerShell-SMS

Set-Nexmo -APIKey YOURAPIKEYGOESHERE -APISecret YOURAPISECRETGOESHERE
```

### Configure PowerShell-SMS for use with SMSAPI
```powershell
Import-Module PowerShell-SMS

Set-SMSAPI -Bearer YOURBEARERGOESHERE
```

---------------------------------------------------------------------------

### Send an SMS with Twilio
```powershell
Send-SMS -To +3161234123412 -From +3161234123411 -Message "Hello, Twilio!" -Provider Twilio
```

### Send an SMS with Nexmo
```powershell
Send-SMS -To +3161234123412 -From +3161234123411 -Message "Hello, Nexmo!" -Provider Nexmo
```

### Send an SMS with Twilio
```powershell
Send-SMS -To +3161234123412 -From +3161234123411 -Message "Hello, SMSAPI!" -Provider SMSAPI
```

---------------------------------------------------------------------------

### PowerShell-SMS in action:

![Nexmo Send SMS](https://bartsimons.me/content/images/2018/02/nexmo-send-sms.png)
![Nexmo Receive SMS](https://bartsimons.me/content/images/2018/02/sms-received.jpg)