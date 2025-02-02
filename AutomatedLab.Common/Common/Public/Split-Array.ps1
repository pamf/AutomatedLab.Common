function Split-Array
{
    param(
        [Parameter(Mandatory = $true)]
        [System.Collections.IEnumerable]$List,

        [Parameter(Mandatory = $true, ParameterSetName = 'ChunkSize')]
        [int]$ChunkSize,
        
        [Parameter(Mandatory = $true, ParameterSetName = 'ChunkCount')]
        [int]$ChunkCount
    )
    $aggregateList = @()
    
    if ($ChunkCount)
    {
        $ChunkSize = [Math]::Ceiling($List.Count / $ChunkCount)
    }

    $blocks = [Math]::Floor($List.Count / $ChunkSize)
    $leftOver = $List.Count % $ChunkSize
    for ($i = 0; $i -lt $blocks; $i++)
    {
        $end = $ChunkSize * ($i + 1) - 1

        $aggregateList += @(, $List[$start..$end])
        $start = $end + 1
    }    
    if ($leftOver -gt 0)
    {
        $aggregateList += @(, $List[$start..($end + $leftOver)])
    }

    , $aggregateList    
}