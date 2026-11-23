# Fábrica de Software Agêntica — Codex

Projeto demonstrativo da Fábrica em OpenAI Codex e da aplicação Express/EJS `appdemo1`.

## Features da demonstração

1. Exibir data e hora do servidor em pt-BR, no fuso `America/Sao_Paulo`, em vermelho. O horário fica estático até uma nova requisição à página.
2. Opcionalmente, exibir uma saudação (“bom dia”, “boa tarde” ou “boa noite”) baseada no horário de São Paulo.

As features devem ser trabalhadas em sequência, cada uma em uma branch, começando por uma especificação aprovada e terminando em Pull Request revisado.

## Rodar a aplicação

```powershell
npm install
npm start
```

Abra `http://localhost:3000`. O projeto de origem não define testes automatizados (`npm test` é apenas um placeholder).

## Ver a Fábrica trocando de agentes

`localhost:3000` mostra somente a aplicação demonstrativa. Para acompanhar o Orquestrador chamando os perfis especializados, execute `tools/demo-fabrica.ps1` em uma janela PowerShell dentro do clone. O lançador abre o Codex CLI em modo somente leitura e segue o roteiro em `prompts/demo-agentes.md`; requer login do Codex e conexão ao serviço do modelo. Os agentes são chamados na interface do Codex, não dentro da página Express.

## Fábrica no Codex

- `AGENTS.md` descreve regras do projeto e o processo aprovado.
- `.codex/config.toml` habilita subagentes.
- `.codex/agents/*.toml` contém perfis do Analista de Requisitos, Arquiteto, Planejador, Desenvolvedor, Revisor de Código e QA.
- `.agents/skills/` contém as skills instaladas do GitHub Spec Kit.
- `prompts/orquestrador.md` orienta o trabalho do agente principal.
- `artifacts/task-log.md` registra a execução; `artifacts/slack-pending/` guarda rascunhos individuais para Slack.

No Codex, use a sintaxe de skills `$speckit-*` na conversa do agente. Para iniciar uma feature, crie uma branch, rode `$speckit-specify`, resolva dúvidas e aguarde aprovação explícita. Só então avance para plano, tarefas, implementação e revisão.

## GitHub

O desenvolvimento ocorre neste clone. Não faça commits diretos na branch principal. Abra Pull Request para cada feature e aguarde aprovação antes do merge. O deploy por GitHub Actions depende de um destino e de secrets configurados no repositório.
