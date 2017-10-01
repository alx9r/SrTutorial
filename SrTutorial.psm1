function Invoke-MyFile
{
    param
    (
        $Mode,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Ensure]
        $Ensure = 'Present',

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Path
    )
}