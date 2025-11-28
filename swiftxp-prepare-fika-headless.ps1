# Little script to prepare a fresh SPT install for becoming a fika headless client

# ================================
# List of files and folders to delete
# ================================
$filesToDelete = @(
    'BattlEye',
    'Logs',
    'SPT',
    'Patcher.log',
    'SPT.Launcher.lnk',
    'SPT.Server.lnk',
    'SPTInstaller.exe'
)

# ================================
# Get current execution directory
# ================================
$ExecutionDir = Get-Location

Write-Host ('Searching in: ' + $ExecutionDir) -ForegroundColor Cyan

foreach ($item in $filesToDelete) {

    $Path = Join-Path $ExecutionDir $item

    if (Test-Path $Path) {
        try {
            Remove-Item -Path $Path -Recurse -Force -ErrorAction Stop
            Write-Host ('Deleted: ' + $item) -ForegroundColor Green
        }
        catch {
            Write-Host ('Failed to delete: ' + $item + ' — ' + $_.Exception.Message) -ForegroundColor Red
        }
    }
    else {
        Write-Host ('Not found (ignored): ' + $item) -ForegroundColor Yellow
    }
}
