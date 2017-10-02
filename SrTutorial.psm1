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
                Remover = 'Remove-Item'
            } |
            Assert-StructuredResourceArgs |
            Invoke-StructuredResource
    }
}