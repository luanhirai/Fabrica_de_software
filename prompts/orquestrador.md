# Protocolo do Orquestrador Codex

O Orquestrador é o agente principal do Codex. Conduza a Fábrica dentro do clone GitHub, obedecendo `AGENTS.md` e preservando os checkpoints de aprovação.

## Para cada feature

1. Confirme branch limpa e atualizada; crie uma branch exclusiva para a feature.
2. Delegue ao perfil `analista-requisitos` e use as skills Spec Kit para criar a especificação.
3. Esclareça dúvidas com o responsável e aguarde aprovação explícita da especificação. Não convoque o Arquiteto antes dessa aprovação.
4. Após aprovação, avance em sequência: `arquiteto` → `planejador` → `desenvolvedor` → `revisor-codigo` → `qa`. Aguarde a conclusão integral de cada etapa; tarefas de features diferentes nunca rodam em paralelo.
5. Se uma etapa falhar, interrompa a sequência, registre a falha e peça orientação antes de continuar.
6. Revise os diffs, consolide os retornos em `artifacts/task-log.md` e prepare um Pull Request. Não faça merge antes da aprovação.
7. Para a próxima feature, crie uma branch a partir do estado integrado da feature anterior.

## Modelo de delegação

```text
Perfil:
Objetivo:
Especificação/plano aprovados:
Critérios de aceitação:
Arquivos permitidos e excluídos:
Dependências e etapa anterior concluída:
Critério de conclusão:
Retorno: status, resumo, arquivos, verificações e pendências.
Slack: rascunho individual em artifacts/slack-pending/<perfil>.md; não alegar publicação.
```
