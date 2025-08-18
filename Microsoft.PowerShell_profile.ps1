# Initialize Oh My Posh with custom theme
oh-my-posh init pwsh --config 'C:\Users\Zulu\AppData\Local\Programs\oh-my-posh\themes\json.omp.json' | Invoke-Expression

# Import modules
Import-Module -Name Terminal-Icons

# Configure PSReadLine based on version
$PSReadLineVersion = (Get-Module PSReadLine).Version
if ($PSReadLineVersion -ge [Version]"2.2.0") {
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
} else {
    # Fallback settings for older versions
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
}

# Chocolatey profile configuration
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# Useful aliases and alternative commands
# Only set aliases that aren't built-in to PowerShell
Set-Alias -Name touch -Value New-Item
Set-Alias -Name less -Value more
Set-Alias -Name time -Value Measure-Command
Set-Alias -Name find -Value Get-ChildItem

# Helper functions
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}


# Linux-like functions
function df { Get-Volume }
function du ([string]$path = ".") { Get-ChildItem $path -Recurse | Measure-Object -Property Length -Sum }
function tail ([string]$path) { Get-Content -Path $path -Tail 10 -Wait }
function mkdir ([string]$path) { New-Item -ItemType Directory -Path $path }

# System information functions
function sysinfo {
    Get-ComputerInfo | Select-Object WindowsProductName, OsVersion, OsArchitecture,
    CsProcessors, CsPhyicallyInstalledMemory
}

# Network commands
function iptables { Get-NetFirewallRule }
function netstat { Get-NetTCPConnection }
function ifconfig { Get-NetAdapter }

# Set better history experience
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Custom prompt styling (optional when using oh-my-posh)
$Host.UI.RawUI.WindowTitle = "PowerShell Core"