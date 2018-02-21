Function Set-Nexmo {
    <#
        .SYNOPSIS
            Set and/or update configuration for the Nexmo API.

        .PARAMETER APIKey
            The API key to use.

        .PARAMETER APISecret
            The API secret to use.

        .EXAMPLE
            PS /Users/bart> Set-Nexmo -APIKey AbCdEf123456AbCdEf123456 -APISecret 123456789123456789
    #>

    [CmdLetBinding(DefaultParameterSetName)]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$APIKey,

        [Parameter(Mandatory=$true)]
        [String]$APISecret
    )

    Set-Variable -Name NexmoAPIKey -Value $APIKey -Scope Global
    Set-Variable -Name NexmoAPISecret  -Value $APISecret  -Scope Global
}