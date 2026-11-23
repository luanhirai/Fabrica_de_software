$ErrorActionPreference = 'Stop'

$env:CODEX_HOME = Join-Path $env:USERPROFILE '.codex'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$promptPath = Join-Path $repoRoot 'prompts/demo-agentes.md'
$prompt = Get-Content -Raw -Encoding UTF8 $promptPath
$prompt = ($prompt -split '```text\r?\n', 2)[1] -split '\r?\n```', 2 | Select-Object -First 1

Set-Location $repoRoot
& codex.cmd --model gpt-5.6-terra --sandbox read-only $prompt
