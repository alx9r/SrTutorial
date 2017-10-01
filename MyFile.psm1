[DscResource()]
class MyFile
{
    [DscProperty()]
    [Ensure]
    $Ensure

    [DscProperty(Key)]
    [string]
    $Path

    [DscProperty()]
    [NullsafeString]
    $Content

    [DscProperty()]
    [Nullable[bool]]
    $Archive

    [DscProperty()]
    [Nullable[bool]]
    $Hidden

    [DscProperty()]
    [Nullable[bool]]
    $NoScrubData

    [DscProperty()]
    [Nullable[bool]]
    $NotContentIndexed

    [DscProperty()]
    [Nullable[bool]]
    $ReadOnly

    [DscProperty()]
    [Nullable[bool]]
    $System

    [DscProperty()]
    [Nullable[bool]]
    $Temporary

    Set(){}
    [bool] Test(){ return $true }
    [MyFile] Get(){ return $this }
}