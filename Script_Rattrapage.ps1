$compt = 0

if($args.Length -eq 4)
{
    $source = $args[0] 
    $r = $args[1] 
    $extension = $args[2] 
    $destination = $args[3] 

}

elseif($args.Length -eq 3){

    $source = $args[0] 
    $r = "" 
    $extension = $args[1] 
    $destination = $args[2]
    
}
else
{
    Write-Host "Pas assez d'arguments"
    break
}

if(Test-Path $destination)
{
    Remove-Item $destination -Recurse
}

New-Item $destination -ItemType Directory

switch ($r)
{
    "-r" {$files = Get-ChildItem $source -Recurse

    $files.foreach(
    {

        if($_.extension -eq $extension)
        {
            Copy-Item -Path $_.FullName -Destination $destination
            Remove-Item -Path $_.FullName
            $compt = $compt + 1
        }

    })}

    "" {$files = Get-ChildItem $source

    $files.foreach(
    {

        if($_.extension -eq $extension)
        {
            Copy-Item -Path $_.FullName -Destination $destination
            Remove-Item -Path $_.FullName
            $compt = $compt + 1
        }

    })}

    default{Write-Host "Mauvaise entrée concernant la récursivité"}
}

$output = [string]$compt + " fichiers déplacés."
Write-Host $output
