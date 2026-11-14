param(
    [string]$Caminho = ""
)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "==============================================="
Write-Host " Terraforming Mars PT-BR Runtime - Windows"
Write-Host "==============================================="
Write-Host ""

function Add-Candidate {
    param(
        [System.Collections.Generic.List[string]]$List,
        [string]$Path
    )

    if ([string]::IsNullOrWhiteSpace($Path)) {
        return
    }

    if (-not $List.Contains($Path)) {
        $List.Add($Path)
    }
}

function Get-SteamInstallPath {
    $paths = @()

    try {
        $steam = Get-ItemProperty -Path "HKCU:\Software\Valve\Steam" -ErrorAction SilentlyContinue
        if ($steam.InstallPath) {
            $paths += $steam.InstallPath
        }
    } catch {}

    try {
        $steam = Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Valve\Steam" -ErrorAction SilentlyContinue
        if ($steam.InstallPath) {
            $paths += $steam.InstallPath
        }
    } catch {}

    if ($env:ProgramFiles) {
        $paths += Join-Path $env:ProgramFiles "Steam"
    }

    if (${env:ProgramFiles(x86)}) {
        $paths += Join-Path ${env:ProgramFiles(x86)} "Steam"
    }

    return $paths | Select-Object -Unique
}

function Get-SteamLibraries {
    $libraries = New-Object System.Collections.Generic.List[string]

    foreach ($steamPath in Get-SteamInstallPath) {
        if (-not (Test-Path $steamPath)) {
            continue
        }

        Add-Candidate $libraries $steamPath

        $libraryFile = Join-Path $steamPath "steamapps\libraryfolders.vdf"

        if (Test-Path $libraryFile) {
            $content = Get-Content $libraryFile -Raw

            $matches = [regex]::Matches($content, '"path"\s+"([^"]+)"')

            foreach ($match in $matches) {
                $path = $match.Groups[1].Value.Replace("\\", "\")
                Add-Candidate $libraries $path
            }
        }
    }

    return $libraries
}

function Get-EpicInstallPaths {
    $paths = New-Object System.Collections.Generic.List[string]
    $manifestDir = Join-Path $env:ProgramData "Epic\EpicGamesLauncher\Data\Manifests"

    if (-not (Test-Path $manifestDir)) {
        return $paths
    }

    foreach ($manifestFile in Get-ChildItem -LiteralPath $manifestDir -Filter "*.item" -File) {
        try {
            $manifest = Get-Content -LiteralPath $manifestFile.FullName -Raw | ConvertFrom-Json
        } catch {
            Write-Warning "Não foi possível ler o manifest da Epic '$($manifestFile.Name)': $($_.Exception.Message)"
            continue
        }

        if ($manifest.InstallLocation) {
            Add-Candidate $paths ([string]$manifest.InstallLocation)
        }
    }

    return $paths
}

function Find-GameDir {
    if (-not [string]::IsNullOrWhiteSpace($Caminho)) {
        return $Caminho
    }

    $candidates = New-Object System.Collections.Generic.List[string]

    foreach ($library in Get-SteamLibraries) {
        Add-Candidate $candidates (Join-Path $library "steamapps\common\Terraforming Mars")
    }

    foreach ($installPath in Get-EpicInstallPaths) {
        Add-Candidate $candidates $installPath
    }

    Add-Candidate $candidates "C:\Program Files (x86)\Steam\steamapps\common\Terraforming Mars"
    Add-Candidate $candidates "C:\Program Files\Steam\steamapps\common\Terraforming Mars"
    Add-Candidate $candidates "D:\SteamLibrary\steamapps\common\Terraforming Mars"
    Add-Candidate $candidates "E:\SteamLibrary\steamapps\common\Terraforming Mars"

    foreach ($candidate in $candidates) {
        if (Test-Path (Join-Path $candidate "TerraformingMars.exe")) {
            return $candidate
        }
    }

    return ""
}

function Copy-RequiredFile {
    param(
        [string]$Source,
        [string]$Destination
    )

    if (-not (Test-Path $Source)) {
        throw "Arquivo obrigatório não encontrado: $Source"
    }

    Copy-Item -LiteralPath $Source -Destination $Destination -Force
}

function Copy-RequiredFolder {
    param(
        [string]$Source,
        [string]$DestinationParent
    )

    if (-not (Test-Path $Source)) {
        throw "Pasta obrigatória não encontrada: $Source"
    }

    Copy-Item -LiteralPath $Source -Destination $DestinationParent -Recurse -Force
}

$GameDir = Find-GameDir

if ([string]::IsNullOrWhiteSpace($GameDir)) {
    Write-Host "Não encontrei automaticamente a pasta do jogo."
    Write-Host ""
    Write-Host "Você pode rodar assim:"
    Write-Host 'powershell -ExecutionPolicy Bypass -File instalar_windows.ps1 -Caminho "C:\caminho\para\Terraforming Mars"'
    Write-Host ""
    exit 1
}

if (-not (Test-Path (Join-Path $GameDir "TerraformingMars.exe"))) {
    Write-Host "Erro: TerraformingMars.exe não encontrado em:"
    Write-Host $GameDir
    Write-Host ""
    Write-Host "Informe a pasta correta do jogo."
    exit 1
}

Write-Host "Jogo encontrado:"
Write-Host $GameDir
Write-Host ""

Write-Host "Instalando arquivos da tradução..."

$GameBepInEx = Join-Path $GameDir "BepInEx"
$GamePlugins = Join-Path $GameBepInEx "plugins"
$GameConfig = Join-Path $GameBepInEx "config\TMPTBR"

New-Item -ItemType Directory -Force -Path $GamePlugins | Out-Null
New-Item -ItemType Directory -Force -Path $GameConfig | Out-Null

Copy-RequiredFolder (Join-Path $ScriptDir "BepInEx\core") $GameBepInEx
Copy-RequiredFolder (Join-Path $ScriptDir "BepInEx\patchers") $GameBepInEx

Copy-RequiredFile (Join-Path $ScriptDir "BepInEx\plugins\TMPTBR.Plugin.dll") $GamePlugins

Copy-RequiredFile (Join-Path $ScriptDir "BepInEx\config\TMPTBR\ptbr_i2_master.tsv") $GameConfig
Copy-RequiredFile (Join-Path $ScriptDir "BepInEx\config\TMPTBR\ptbr_asmodee_master.tsv") $GameConfig

Copy-RequiredFile (Join-Path $ScriptDir "winhttp.dll") $GameDir
Copy-RequiredFile (Join-Path $ScriptDir "doorstop_config.ini") $GameDir
Copy-RequiredFile (Join-Path $ScriptDir ".doorstop_version") $GameDir

Write-Host ""
Write-Host "==============================================="
Write-Host " Tradução instalada com sucesso!"
Write-Host "==============================================="
Write-Host ""
Write-Host "Agora abra o Terraforming Mars normalmente pelo launcher em que ele está instalado."
Write-Host ""
Write-Host "O arquivo data.unity3d não foi modificado."