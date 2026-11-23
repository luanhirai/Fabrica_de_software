# Implementation Plan: Data e hora do servidor em pt-BR

**Branch**: `feat/001-horario-servidor-pt-br` | **Date**: 2026-11-22 | **Spec**: [spec.md](spec.md)

## Summary

Formatar no servidor o instante de cada requisição da página inicial como data e hora de São Paulo em português do Brasil, passar esse valor à view e destacá-lo em vermelho escuro. A página continuará estática após o carregamento e manterá a informação de IP existente.

## Technical Context

**Language/Version**: JavaScript, versão de Node.js definida pelo ambiente do projeto
**Primary Dependencies**: Express e EJS existentes; API nativa `Intl.DateTimeFormat`
**Storage**: N/A
**Testing**: Verificação manual reproduzível via servidor local e inspeção HTML; não foi solicitado adicionar testes automatizados
**Target Platform**: Servidor Node.js que executa a aplicação existente
**Project Type**: Aplicação web server-rendered
**Performance Goals**: A formatação não deve causar atraso perceptível na resposta da página
**Constraints**: Usar fuso IANA `America/Sao_Paulo`; sem atualização contínua no cliente; preservar IP; sem nova dependência salvo necessidade comprovada
**Scale/Scope**: Uma rota e uma view da aplicação de demonstração

## Constitution Check

- GitHub e PR: PASS — trabalho permanece na branch de feature do clone publicado; integração requer PR revisado.
- Papéis e limites: PASS — arquitetura e planejamento concluídos sequencialmente; implementação, revisão e QA permanecem etapas distintas.
- Especificação aprovada: PASS — aprovação explícita do responsável recebida nesta conversa antes deste plano.
- Evidências: PASS — validações serão relatadas somente após execução real.
- Comunicação: PASS WITH PENDING — rascunho do Arquiteto preparado em `artifacts/slack-pending/arquiteto.md`; Slack não está conectado, logo o envio permanece pendente.

## Project Structure

### Documentation (this feature)

```text
specs/001-horario-servidor-pt-br/
├── spec.md
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── checklists/requirements.md
└── tasks.md
```

### Source Code

```text
app.js          # handler da rota e criação do valor formatado
views/index.ejs # exibição da data/hora e do IP
```

**Structure Decision**: preservar a estrutura Express/EJS existente. A rota já prepara dados usados pelo template e a view já mostra o horário e o IP; limitar as alterações a esses arquivos.

## Phase 0: Research

### Decisions

- **Formatting and time zone**: usar `Intl.DateTimeFormat` com locale `pt-BR` e `timeZone: America/Sao_Paulo`, extraindo partes numéricas para compor o formato presumido `dd/MM/yyyy HH:mm:ss`.
  - Rationale: API nativa, dependência zero, locale e fuso explícitos independente do timezone do host.
  - Alternatives: confiar no timezone local do servidor (não atende a independência); adicionar biblioteca de datas (desnecessário para este escopo).
- **Rendering cadence**: calcular o texto na requisição e renderizá-lo pelo EJS; nenhum temporizador ou script de atualização no cliente.
  - Rationale: mantém o valor estático por carregamento e atualiza na próxima requisição.
- **Failure behavior**: se a preparação do instante falhar, fornecer estado de indisponibilidade claro para a view, sem reutilizar valor anterior.
  - Rationale: evita apresentar horário vencido como atual.
- **Visual style**: usar tom vermelho escuro com contraste legível e sem alterar o layout fora do elemento do horário.
  - Rationale: cumpre o requisito visual reduzindo risco de contraste insuficiente.

## Phase 1: Design

### Data Model

Não há persistência nem entidade de domínio. A resposta da página usa estes valores transitórios:

- `serverDateTime`: string `dd/MM/yyyy HH:mm:ss` para o instante da requisição no fuso de São Paulo.
- `serverDateTimeAvailable`: estado que permite exibir uma mensagem de indisponibilidade se não for possível formatar o instante.
- `ip`: valor existente que continua sendo apresentado sem mudança de contrato.

### UI Contract

- A página inicial mostra um rótulo e o valor de data/hora em vermelho escuro quando disponível.
- Em indisponibilidade, mostra texto explícito de que a data/hora não está disponível.
- Não contém lógica ou timer cliente para modificar o valor após o carregamento.
- Mantém a exibição do IP atual.

### Validation Guide

Ver [quickstart.md](quickstart.md) para iniciar a aplicação e inspecionar as respostas e o comportamento visual.

## Constitution Check (post-design)

- Menor mudança na estrutura existente: PASS.
- Sem concorrência em etapas dependentes: PASS.
- Sem novas dependências desnecessárias: PASS.
- Evidências manuais documentadas em comandos/resultados reais: PENDING até execução.
- PR antes de integração à branch principal: PASS, permanece obrigatório.

## Complexity Tracking

Sem violações à constituição. Nenhuma complexidade adicional é justificada.
