[DscResource()]
class MyFile
{
    [DscProperty(Key)]
    $Path

    Set(){}
    [bool] Test(){ return $true }
    [MyFile] Get(){ return $this }
}