Function Set-SMSAPI {
    <#
        .SYNOPSIS
            Set and/or update configuration for the SMSAPI API.

        .PARAMETER Bearer
            The authentication token to use.

        .EXAMPLE
            PS /Users/bart> Set-SMSAPI -Bearer AbCdEf123456
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$Bearer
    )

    Set-Variable -Name SMSAPIBearer -Value $Bearer -Scope Global
}