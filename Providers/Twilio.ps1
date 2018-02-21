Function Set-Twilio {
    <#
        .SYNOPSIS
            Set and/or update configuration for the Twilio API.

        .PARAMETER AccountSid
            The account SID to use.

        .PARAMETER AuthToken
            The authentication token to use.

        .EXAMPLE
            PS /Users/bart> Set-Twilio -AccountSid AbCdEf123456AbCdEf123456 -AuthToken 123456789123456789
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$AccountSid,

        [Parameter(Mandatory=$true)]
        [String]$AuthToken
    )

    Set-Variable -Name TwilioAccountSid -Value $AccountSid -Scope Global
    Set-Variable -Name TwilioAuthToken  -Value $AuthToken  -Scope Global
}