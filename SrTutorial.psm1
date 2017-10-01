function Invoke-MyFile
{
    param
    (
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