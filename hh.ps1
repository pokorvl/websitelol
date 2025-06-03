# Create a target folder
$downloadFolder = "C:\Users\$env:USERNAME\Downloads\VrataHosek"
New-Item -ItemType Directory -Force -Path $downloadFolder | Out-Null

# List of relative file paths
$paths = @(
    "01 - Vrata Hosek - Sudety.m4a",
    "02 - Vrata Hosek - Tři Kříže (hákový).m4a",
    "03 - Vrata Hosek - Dáda.m4a",
    "04 - Vrata Hosek - Když mě zvali na panáka.m4a",
    "05 - Vrata Hosek - Liebensraum.m4a",
    "06 - Vrata Hosek - Balada o Hermannu Göringovi.m4a",
    "07 - Vrata Hosek - Valašská.m4a",
    "08 - Vrata Hosek - Hess.m4a",
    "09 - Vrata Hosek - Atom.m4a",
    "10 - Vrata Hosek - Kleště a letlampa.m4a",
    "11 - Vrata Hosek - Sebereflexivní.m4a"
)

# Folder on remote site (URL-encoded where necessary)
$baseUrl = "https://justleader.eu/Music/Vrata%20Hosek/P%C3%ADsni%C4%8Dky%20pln%C3%A9%20n%C4%9Bhy"

# Download loop
foreach ($filename in $paths) {
    $encodedFilename = [System.Uri]::EscapeDataString($filename)
    $url = "$baseUrl/$encodedFilename"
    $outputPath = Join-Path $downloadFolder $filename

    Write-Host "Downloading: $filename"
    Invoke-WebRequest -Uri $url -OutFile $outputPath -UseBasicParsing
}

Write-Host "✅ Download complete. Files saved to $downloadFolder"