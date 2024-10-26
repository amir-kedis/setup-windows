# Install Visual Studio Code
Write-Host "Downloading Visual Studio Code..."
Invoke-WebRequest -Uri "https://aka.ms/win32-x64-user-stable" -OutFile "$env:TEMP\vscode-installer.exe"

Write-Host "Installing Visual Studio Code..."
Start-Process -FilePath "$env:TEMP\vscode-installer.exe" -ArgumentList "/silent /mergetasks=!runcode" -NoNewWindow -Wait

Write-Host "Visual Studio Code installed successfully!"

Write-Host "Setting default browser to Microsoft Edge..."
'http', 'https' | ForEach-Object {
  $regPath = "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\$_\UserChoice"
  Set-ItemProperty $regPath ProgId MSEdgeHTM
}
