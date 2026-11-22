param(
    [switch]$Diagnostico
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $projectRoot

if (-not $env:CODEX_HOME -and $env:USERPROFILE) {
    $env:CODEX_HOME = Join-Path $env:USERPROFILE '.codex'
}

$codexCommand = Get-Command codex.cmd -ErrorAction SilentlyContinue
if (-not $codexCommand) {
    $codexCommand = Get-Command codex -ErrorAction SilentlyContinue
}
if (-not $codexCommand) {
    throw 'Codex CLI não encontrado no PATH. Instale ou abra o Codex Desktop e repita.'
}

if (-not (Test-Path -LiteralPath 'AGENTS.md')) {
    throw 'AGENTS.md não encontrado na raiz do projeto.'
}

$profiles = Get-ChildItem -LiteralPath (Join-Path $projectRoot '.codex/agents') -Filter '*.toml' -File
if ($profiles.Count -lt 1) {
    throw 'Nenhum perfil TOML encontrado em .codex/agents.'
}

Write-Host "Codex factory: $projectRoot"
Write-Host "Profiles found: $($profiles.Count)"
Write-Host 'Project instructions: AGENTS.md and prompts/orquestrador.md'

if ($Diagnostico) {
    & $codexCommand.Source --version
    $previousErrorActionPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $featureOutput = & $codexCommand.Source features list 2>&1
        $featureExitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }
    $featureOutput | Select-String 'multi_agent'
    exit $featureExitCode
}

Write-Host 'Opening Codex. Trust this project folder if prompted to load .codex/config.toml.'
& $codexCommand.Source --cd $projectRoot
exit $LASTEXITCODE

