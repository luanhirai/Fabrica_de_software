# Fluxo de demonstração no Codex

Atue como Orquestrador da Fábrica, seguindo `AGENTS.md`. Trabalhe apenas neste clone do GitHub. OpenCode não deve ser usado.

## Primeira demanda — Feature 001

Solicitação: mostrar no frontend a data e a hora do servidor em formato pt-BR, em vermelho, usando o fuso `America/Sao_Paulo`. Não atualizar continuamente no navegador; renderizar o horário atual quando a página for carregada.

1. Confirme a branch-base atualizada e crie `feat/001-horario-servidor-pt-br`.
2. Delegue ao Analista de Requisitos e use `$speckit-specify` para criar a especificação em `.specify/specs/001-horario-servidor-pt-br/`.
3. Use `$speckit-clarify` para resolver ambiguidades. Apresente a especificação ao responsável e pare até receber aprovação explícita.
4. Após aprovação, registre a aprovação e siga, em sequência: Arquiteto, Planejador, Desenvolvedor, Revisor de Código e QA. Use `$speckit-plan`, `$speckit-tasks`, `$speckit-analyze`, `$speckit-implement` e `$speckit-converge` conforme apropriado.
5. Não delegue a Feature 002 durante esta execução. Abra um Pull Request da Feature 001 e aguarde aprovação.

## Segunda demanda opcional — Feature 002

Depois que a Feature 001 estiver integrada, crie uma nova branch a partir da branch atualizada. Solicitação: abaixo da data e hora, mostrar “bom dia”, “boa tarde” ou “boa noite” de acordo com o horário de `America/Sao_Paulo`.

Repita o fluxo de especificação, esclarecimento e aprovação. Execute uma etapa por vez; se uma tarefa falhar, pare e não inicie a seguinte. Ao concluir, abra um Pull Request e aguarde a aprovação responsável.

## Registro

Cada agente retorna status, resumo, arquivos, verificações e pendências. Registre a execução em `artifacts/task-log.md` e prepare a mensagem de cada agente em `artifacts/slack-pending/<perfil>.md`. Não afirme envio ao Slack sem integração e confirmação real.
