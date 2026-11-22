# Fábrica de Software Agêntica — Constituição do Projeto

## Core Principles

### I. GitHub e Pull Requests são obrigatórios

O repositório oficial do projeto MUST estar publicado no GitHub. O desenvolvimento regular MUST
começar a partir de um clone desse repositório. Cada mudança MUST ser feita em uma branch própria;
commits diretos na branch principal são proibidos. Toda mudança MUST ser integrada por Pull Request
revisado antes do merge. A criação inicial do repositório é a única etapa anterior ao clone.

### II. Agentes preservam papéis e limites

Cada agente MUST trabalhar dentro da especialidade, responsabilidade e escopo recebidos. O
orquestrador MUST dividir o pedido em tarefas com entregas, critérios e dependências claros,
delegar trabalho independente e integrar as respostas. Agentes que alterem arquivos MUST receber
escopos sem sobreposição quando executados em paralelo. A adaptação ao Codex MUST preservar os
papéis da Fábrica acordados pela equipe.

### III. Especificação orienta mudanças de software

Mudanças de software MUST ter objetivo e critérios de aceitação observáveis antes da implementação.
Para novas funcionalidades, a equipe MUST usar o fluxo Spec Kit: especificar, planejar, decompor
tarefas, implementar e avaliar a convergência, revisando cada artefato entre as etapas. Planos MUST
considerar o repositório existente e preservar comportamentos e contratos fora do escopo. Correções
pontuais podem usar o fluxo de correção de bugs do Spec Kit, mantendo revisão e verificação.

### IV. Revisão e verificação precisam de evidências

Toda mudança MUST passar por revisão do diff e verificação pertinente ao seu escopo antes do merge.
O agente de qualidade MUST reportar achados concretos e evidências; o orquestrador MUST resolver os
achados ou registrar riscos pendentes no Pull Request. Relatórios MUST identificar comandos
executados e resultados reais. Testes, capturas ou publicações que não ocorreram MUST NOT ser
apresentados como concluídos.

### V. Conclusões são rastreáveis e comunicadas

Cada agente MUST devolver status, resumo, arquivos alterados, verificações e pendências. O
orquestrador MUST consolidar essas informações em `artifacts/task-log.md`. Cada subagente MUST
comunicar sua conclusão no Slack definido pela equipe. Se a integração Slack não estiver disponível,
a conclusão MUST ficar identificada como pendente de publicação e acompanhada de uma mensagem pronta
para envio; um rascunho local não conta como mensagem publicada.

## Additional Constraints

- O ambiente de execução desta adaptação é o OpenAI Codex. Os perfis especializados ficam em
  `.codex/agents/`; as skills Spec Kit ficam em `.agents/skills/`.
- As skills Spec Kit MUST ser invocadas pela sintaxe da integração, por exemplo
  `$speckit-constitution`, dentro da conversa do agente; comandos de instalação e inicialização são
  executados no terminal.
- Mudanças MUST permanecer focadas no objetivo. Refatorações não relacionadas são proibidas sem
  escopo aprovado.
- Segredos, tokens e webhooks MUST NOT ser incluídos no repositório. Credenciais devem usar os
  mecanismos locais apropriados.
- Quando repositório remoto, permissões, integração Slack ou critérios de aceitação estiverem
  indisponíveis, o agente MUST registrar o bloqueio em vez de simular a operação.

## Development Workflow

1. Atualizar a branch local a partir do GitHub e criar uma branch de trabalho específica.
2. Inspecionar instruções, código e artefatos existentes; confirmar os papéis de agente e o objetivo
   da mudança.
3. Para uma funcionalidade, produzir e revisar os artefatos Spec Kit na ordem:
   `$speckit-specify`, `$speckit-plan`, `$speckit-tasks`, `$speckit-analyze` e
   `$speckit-implement`; executar `$speckit-converge` até que não restem lacunas. Para correções,
   usar a avaliação e o fluxo de correção de bugs apropriados.
4. Delegar tarefas independentes com limites de arquivo claros; integrar e revisar o diff completo.
5. Executar verificações adequadas, registrar saídas reais e obter a conclusão Slack de cada
   subagente.
6. Abrir Pull Request com objetivo, critérios atendidos, arquivos alterados, verificações,
   evidências e riscos restantes.
7. Fazer merge somente depois da revisão e dos checks exigidos pelo repositório.

## Governance

Esta constituição rege os agentes, os fluxos e as mudanças do projeto. Toda alteração nela MUST ser
proposta em branch e aprovada por Pull Request. A equipe MUST verificar sua conformidade em cada
revisão. Alterações de princípio, processo ou responsabilidade dos agentes MUST incluir justificativa
e impacto nos artefatos relacionados.

A versão segue SemVer: MAJOR para remover ou tornar incompatíveis princípios; MINOR para adicionar
ou alterar materialmente princípios ou processos; PATCH para esclarecimentos sem mudança de
obrigação. A ratificação permanece pendente até aprovação explícita do responsável pelo projeto.

**Version**: 1.0.0 | **Ratified**: TODO(RATIFICATION_DATE): aguarda aprovação explícita do responsável pelo projeto | **Last Amended**: 2026-11-22
