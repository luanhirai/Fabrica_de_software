# Fábrica de Software Agêntica — OpenAI Codex

Este repositório combina a aplicação Express/EJS `appdemo1` com a adaptação da Fábrica para o Codex. O fluxo deve acontecer em branches do repositório GitHub clonado e ser integrado por Pull Request.

## Agentes e responsabilidades

- O agente principal é o Orquestrador: coordena aprovações, ordem das tarefas, agentes e integração.
- Os perfis em `.codex/agents/` adaptam os papéis identificados na Fábrica: Analista de Requisitos, Arquiteto, Planejador, Desenvolvedor, Revisor de Código e QA.
- A documentação é um papel auxiliar da adaptação, não substitui nenhum dos agentes acima.
- Preserve as especialidades e limites. Não delegue trabalho concorrente sobre os mesmos arquivos.

## Processo obrigatório

1. Inspecione o estado do clone e atualize a branch-base.
2. Crie uma branch específica por feature.
3. Use Spec Kit para produzir a especificação. Peça esclarecimentos quando necessário e aguarde aprovação explícita antes de planejar ou implementar.
4. Depois da aprovação, siga a ordem: Arquiteto, Planejador, Desenvolvedor, Revisor de Código e QA. Espere cada etapa concluir; não execute features em paralelo.
5. Revise o diff e registre resultados reais, limitações e pendências em `artifacts/task-log.md`.
6. Abra um Pull Request e aguarde aprovação antes de integrar. A segunda feature só começa a partir da branch atualizada após a primeira implementação.

## Critérios das features demonstrativas

- Feature 001: mostrar data/hora do servidor em português do Brasil, no fuso `America/Sao_Paulo`, destacada em vermelho. O valor é renderizado ao carregar a página e não deve ser atualizado continuamente no navegador.
- Feature 002: mostrar “bom dia”, “boa tarde” ou “boa noite” conforme o horário atual em `America/Sao_Paulo`, abaixo da data/hora.
- A Feature 002 é opcional na demonstração. Se executada, deve vir depois da Feature 001 e partir do resultado integrado dela.

## Slack e evidências

- Cada agente retorna status, resumo, arquivos, verificações e pendências, além de preparar uma mensagem em seu arquivo individual sob `artifacts/slack-pending/`.
- Rascunho local não comprova publicação no Slack. Sem conector configurado, identifique o envio como pendente.
- Não afirme execução, testes, capturas, PR ou deploy que não ocorreram.
- Não grave tokens, webhooks ou credenciais no repositório.
