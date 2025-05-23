$zoxideInitFile = "$PSScriptRoot\zoxide_init.ps1"
if (-not (Test-Path $zoxideInitFile)) {
	zoxide init powershell | Out-File -FilePath $zoxideInitFile -Encoding UTF8
}
. $zoxideInitFile

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

Set-Alias lg Lazygit

Set-Alias vim nvim
