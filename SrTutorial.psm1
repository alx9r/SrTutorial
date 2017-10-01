function Invoke-MyFile
{
    param
    (
        $Ensure,

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Path
    )
}