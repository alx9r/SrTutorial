Import-Module SrTutorial -Force

Describe 'MyFile' {
    foreach ( $test in (New-StructuredResourceTest MyFile SrTutorial  @{
        Path = [System.IO.Path]::GetTempFileName()
        Content = @"
            some
            multiline
            content
"@
        Archive = $true
        Hidden = $true
        NoScrubData = $true
        NotContentIndexed = $true
        ReadOnly = $true
        System = $true
        Temporary = $true
    }))
    {
        It $test.FullMessage {
            $test | Invoke-StructuredResourceTest
        }
    }
}