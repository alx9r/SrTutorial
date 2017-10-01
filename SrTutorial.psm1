function Invoke-MyFile
{
    param
    (
        [Parameter(ValueFromPipelineByPropertyName)]
        [Ensure]
        $Ensure,

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Path
    )
}