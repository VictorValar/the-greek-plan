# Define the source and destination directories
$sourceDir = "C:\Users\lcsan\codes\empire-of-the-romans\src"
$destDir = "C:\Users\lcsan\OneDrive\Documents\Paradox Interactive\Victoria 3\mod\Empire of the Romans"

# Check if the source directory exists
if (-Not (Test-Path -Path $sourceDir)) {
    Write-Error "Source directory does not exist: $sourceDir"
    exit
}

# Check if the destination directory exists
if (-Not (Test-Path -Path $destDir)) {
    Write-Error "Destination directory does not exist: $destDir"
    exit
}

# Copy files from source to destination, overwriting existing files
try {
    Copy-Item -Path "$sourceDir\*" -Destination $destDir -Recurse -Force
    Write-Output "Files copied successfully"
} catch {
    Write-Error "An error occurred while copying files: $_"
}