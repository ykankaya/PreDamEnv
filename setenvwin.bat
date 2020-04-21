@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install jdk8 -y 
choco install python -y 
choco install googlechrome -y 
choco install vscode -y 
choco install qbittorrent -y 
choco install etcher -y 
choco install sharex -y 
choco install windirstat -y 
choco install 7zip -y 
choco install mpv -y 
choco install cmdermini -y 
choco install unchecky -y
choco install ngrok -y
choco install git --params "/NoShellIntegration" -y
