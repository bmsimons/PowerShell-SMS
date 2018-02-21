Function Send-SMS {
    <#
        .SYNOPSIS
            Send an SMS from PowerShell.

        .PARAMETER To
            The phone number to send the SMS to.

        .PARAMETER From
            The phone number or name to send the SMS from.

        .PARAMETER Message
            The message to send to the recipient.

        .PARAMETER Provider
            The SMS API provider to use.

        .EXAMPLE
            PS /Users/bart> Send-SMS -To 31612345678 -From 15059387754 -Message "Test SMS from PowerShell!" -Provider Twilio
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$To,

        [Parameter(Mandatory=$true)]
        [String]$From,

        [Parameter(Mandatory=$true)]
        [String]$Message,

        [Parameter(Mandatory=$true)]
        [ValidateSet('Twilio','SMSAPI','Nexmo')]
        [String]$Provider
    )

    Switch ($Provider)
    {
        Twilio {
            If ($TwilioAuthToken -and $TwilioAccountSid)
            {
                Invoke-RestMethod -Uri "https://api.twilio.com/2010-04-01/Accounts/$TwilioAccountSid/Messages.json" -ErrorAction Stop -Credential (New-Object System.Management.Automation.PSCredential($TwilioAccountSid,$TwilioAuthToken)) -Method POST -ContentType "application/x-www-form-urlencoded" -Body @{From=$From;To=$To;Body=$Message}
            }
            Else
            {
                Write-Error "You need to use Set-Twilio first to setup your connection to the Twilio API. Use Get-Help Set-Twilio to learn more."
            }
        }

        SMSAPI {
            If ($SMSAPIBearer)
            {
                $Message = [System.Web.HttpUtility]::UrlEncode($Message)
                Invoke-RestMethod -Uri "https://api.smsapi.com/sms.do?from=$From&to=$To&message=$Message&format=json" -ErrorAction Stop -Method GET -Headers @{Authorization="Bearer $SMSAPIBearer"}
            }
            Else
            {
                Write-Error "You need to use Set-SMSAPI first to setup your connection to the SMSAPI API. Use Get-Help Set-SMSAPI to learn more."
            }
        }

        Nexmo {
            If ($NexmoAPIKey -and $NexmoAPISecret)
            {
                Invoke-RestMethod -Uri "https://rest.nexmo.com/sms/json" -ErrorAction Stop -Method POST -Body @{from=$From;to=$To;text=$Message;api_key=$NexmoAPIKey;api_secret=$NexmoAPISecret}
            }
            Else
            {
                Write-Error "You need to use Set-Nexmo first to setup your connection to the Nexmo API. Use Get-Help Set-Nexmo to learn more."
            }
        }
    }
}