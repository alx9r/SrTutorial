Import-Module SrTutorial -Force

Describe 'MyFile' {
    foreach ( $test in (New-StructuredResourceTest MyFile SrTutorial -Kind Unit ) )
    {
        It $test.FullMessage {
            $test | Invoke-StructuredResourceTest
        }
    }
}