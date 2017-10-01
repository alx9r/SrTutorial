[DscResource()]
class MyFile
{
    [DscProperty(Key)]
    [string]
    $Path

    Set(){}
    [bool] Test(){ return $true }
    [MyFile] Get(){ return $this }
}