function Invoke-MyFile
{
    param
    (
        [Parameter(ValueFromPipelineByPropertyName)]
        [Mode]
        $Mode,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Ensure]
        $Ensure = 'Present',

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Path
    )
}