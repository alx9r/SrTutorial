function Invoke-MyFile
{
    param
    (
        [Parameter(ValueFromPipelineByPropertyName,
                   Position=1)]
        [Mode]
        $Mode,

        [Parameter(ValueFromPipelineByPropertyName,
                   Position=2)]
        [Ensure]
        $Ensure = 'Present',

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Path
    )
}