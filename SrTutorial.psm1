function Invoke-MyFile
{
    param
    (
        [Ensure]
        $Ensure,

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Path
    )
}