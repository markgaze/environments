#---- TEMPORARY ---
Disable-UAC

Set-Culture en-GB
Set-WinSystemLocale en-GB
Set-WinHomeLocation -GeoId 242
Set-WinUserLanguageList en-GB
Set-TimeZone "GMT Standard Time"
 
#--- Fonts ---
choco install FiraCode -y
   
#--- Windows Settings ---
Disable-BingSearch
Disable-GameBarTips
 
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions
Set-TaskbarOptions -Size Small -Dock Bottom -Combine Always -Lock
Set-TaskbarOptions -Size Small -Dock Bottom -Combine Always -AlwaysShowIconsOn
 
#--- Windows Subsystems/Features ---
choco install Microsoft-Hyper-V-All -source windowsFeatures
Enable-WindowsOptionalFeature -Online -FeatureName containers -All
choco install Microsoft-Windows-Subsystem-Linux -source windowsfeatures
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu.appx
 
#--- Tools ---
choco install git -params '"/GitAndUnixToolsOnPath /WindowsTerminal"' -y
choco install sysinternals -y
 
#--- Apps ---
choco install 7zip -y
choco install googlechrome -y
choco install docker-for-windows -y
choco install sharex -y
choco install vscode -y
choco install hyper -y
choco install paint.net -y
choco install mremoteng -y
choco install notepadplusplus -y

#--- VS Code ---
code --install-extension Shan.code-settings-sync
 
#--- Uninstall unecessary applications that come with Windows out of the box ---
 
# 3D Builder
Get-AppxPackage Microsoft.3DBuilder | Remove-AppxPackage
 
# Alarms
Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage
 
# Autodesk
Get-AppxPackage *Autodesk* | Remove-AppxPackage
 
# Bing Weather, News, Sports, and Finance (Money):
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
 
# BubbleWitch
Get-AppxPackage *BubbleWitch* | Remove-AppxPackage
 
# Candy Crush
Get-AppxPackage king.com.CandyCrush* | Remove-AppxPackage
 
# Comms Phone
Get-AppxPackage Microsoft.CommsPhone | Remove-AppxPackage
 
# Dell
Get-AppxPackage *Dell* | Remove-AppxPackage
 
# Dropbox
Get-AppxPackage *Dropbox* | Remove-AppxPackage
 
# Facebook
Get-AppxPackage *Facebook* | Remove-AppxPackage
 
# Feedback Hub
Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage
 
# Get Started
Get-AppxPackage Microsoft.Getstarted | Remove-AppxPackage
 
# Keeper
Get-AppxPackage *Keeper* | Remove-AppxPackage
 
# Mail & Calendar
Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage
 
# Maps
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
 
# March of Empires
Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage
 
# McAfee Security
Get-AppxPackage *McAfee* | Remove-AppxPackage
 
# Uninstall McAfee Security App
$mcafee = gci "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | foreach { gp $_.PSPath } | ? { $_ -match "McAfee Security" } | select UninstallString
if ($mcafee) {
  $mcafee = $mcafee.UninstallString -Replace "C:\Program Files\McAfee\MSC\mcuihost.exe", ""
  Write "Uninstalling McAfee..."
  start-process "C:\Program Files\McAfee\MSC\mcuihost.exe" -arg "$mcafee" -Wait
}
 
# Messaging
Get-AppxPackage Microsoft.Messaging | Remove-AppxPackage
 
# Minecraft
Get-AppxPackage *Minecraft* | Remove-AppxPackage
 
# Netflix
Get-AppxPackage *Netflix* | Remove-AppxPackage
 
# Office Hub
Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
 
# One Connect
Get-AppxPackage Microsoft.OneConnect | Remove-AppxPackage
 
# OneNote
Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
 
# People
Get-AppxPackage Microsoft.People | Remove-AppxPackage
 
# Phone
Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage
 
# Photos
Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage
 
# Plex
Get-AppxPackage *Plex* | Remove-AppxPackage
 
# Skype (Metro version)
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage
 
# Sound Recorder
Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage
 
# Solitaire
Get-AppxPackage *Solitaire* | Remove-AppxPackage
 
# Sticky Notes
Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage
 
# Sway
Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage
 
# Twitter
Get-AppxPackage *Twitter* | Remove-AppxPackage
 
# Xbox
Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage
 
# Zune Music, Movies & TV
Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage
 
#--- Windows Settings ---
# Privacy: Let apps use my advertising ID: Disable
If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
  New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0
 
# WiFi Sense: HotSpot Sharing: Disable
If (-Not (Test-Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
  New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting | Out-Null
}
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Name value -Type DWord -Value 0
 
# WiFi Sense: Shared HotSpot Auto-Connect: Disable
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots -Name value -Type DWord -Value 0
 
# Start Menu: Disable Bing Search Results
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0
 
# Change Explorer home screen back to "This PC"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1
 
# Better File Explorer
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1        
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1       
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2
 
# Disable Xbox Gamebar
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name AppCaptureEnabled -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name GameDVR_Enabled -Type DWord -Value 0
 
# Turn off People in Taskbar
If (-Not (Test-Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
  New-Item -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People | Out-Null
}
Set-ItemProperty -Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name PeopleBand -Type DWord -Value 0
 
#--- Restore Temporary Settings ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula