function Invoke-MyFile
{
    param
    (
        [Parameter(ValueFromPipelineByPropertyName,
                   Position=1,
                   Mandatory)]
        [Mode]
        $Mode,

        [Parameter(ValueFromPipelineByPropertyName,
                   Position=2)]
        [Ensure]
        $Ensure = 'Present',

        [Parameter(ValueFromPipelineByPropertyName,
                   Mandatory)]
        [StructuredResource('Key')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName)]
        [NullsafeString]
        $Content,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Nullable[bool]]
        $Archive,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Nullable[bool]]
        $Hidden,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Nullable[bool]]
        $NoScrubData,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Nullable[bool]]
        $NotContentIndexed,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Nullable[bool]]
        $ReadOnly,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Nullable[bool]]
        $System,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Nullable[bool]]
        $Temporary
    )
    process
    {
        $MyInvocation |
            New-StructuredResourceArgs @{
                Tester = 'Test-Path'
                Curer = 'New-Item'
                Remover = 'Remove-File'
                PropertyTester = 'Test-MyFileProperty'
                PropertyCurer = 'Set-MyFileProperty'
            } |
            Assert-StructuredResourceArgs |
            Invoke-StructuredResource
    }
}

function Remove-File
{
    param($Path)
    Remove-Item $Path -Force
}

function Test-MyFileProperty
{
    param
    (
        $Path,
        $PropertyName,
        $Value                
    )
    if ( $PropertyName -eq 'Content' )
    {
        return $Value -eq (Get-Content $Path -Raw | Remove-TrailingNewlines)
    }
    Test-FileAttribute @PSBoundParameters
}

Function Remove-TrailingNewlines
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory,
                   position = 1,
                   ValueFromPipeline,
                   ValueFromPipelineByPropertyName)]
        [AllowEmptyString()]
        [string]
        $InputObject
    )
    process
    {
        $acc = $InputObject
        while
        (
            $acc[-1] -eq "`n" -or
            $acc[-1] -eq "`r"
        )
        {
            $acc = $acc.Substring(0,$acc.Length-1)
        }
        return $acc
    }
}

function Set-MyFileProperty
{
    param
    (
        $Path,
        $PropertyName,
        $Value                
    )
    if ( $PropertyName -eq 'Content' )
    {
        [string]$Value | Out-File $Path -Encoding ascii | Out-Null
        return
    }
    Set-FileAttribute @PSBoundParameters
}

function Set-FileAttribute
{
    param
    (
        $Path,
        $PropertyName,
        $Value                
    )
    # Value is boolean, so we are either setting or clearing the flag

    if ( $Value )
    {
        # set the flag
        [System.IO.File]::SetAttributes($Path,$PropertyName)
        return
    }

    # clear the flag
    [System.IO.File]::SetAttributes($Path,
        (
            [System.IO.File]::GetAttributes($Path) -band 
            (-bnot ([System.IO.FileAttributes]$PropertyName))
        )
    )
}

function Test-FileAttribute
{
    param
    (
        $Path,
        $PropertyName,
        $Value                
    )
    # value is boolean, so we are confirming that the flag is either set or cleared
    (-not $Value) -xor
    ( 
        [System.IO.File]::GetAttributes($Path) -band 
        ([System.IO.FileAttributes]$PropertyName)
    )
}
