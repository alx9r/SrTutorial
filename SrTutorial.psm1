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

        [Parameter(ValueFromPipelineByPropertyName)]
        [StructuredResource('Key')]
        [string]
        $Path
    )
}