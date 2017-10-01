[DscResource()]
class MyFile
{
    [DscProperty()]
    [Ensure]
    $Ensure

    [DscProperty(Key)]
    [string]
    $Path

    $Content
    $Archive
    $Hidden
    $NoScrubData
    $NotContentIndexed
    $ReadOnly
    $System
    $Temporary

    Set(){}
    [bool] Test(){ return $true }
    [MyFile] Get(){ return $this }
}