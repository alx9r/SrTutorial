[DscResource()]
class MyFile
{
    Set(){}
    [bool] Test(){ return $true }
    [MyFile] Get(){ return $this }
}