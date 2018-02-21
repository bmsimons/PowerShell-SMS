$global:SMSAPIBearer     = $false
$global:TwilioAccountSid = $false
$global:TwilioAuthToken  = $false
$global:NexmoAPIKey      = $false
$global:NexmoAPISecret   = $false

. $PSScriptRoot\Providers\SMSAPI.ps1
. $PSScriptRoot\Providers\Twilio.ps1
. $PSScriptRoot\Providers\Nexmo.ps1
. $PSScriptRoot\Actions\Send-SMS.ps1