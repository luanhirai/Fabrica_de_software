# Tasks: Data e hora do servidor em pt-BR

**Input**: Design documents from `specs/001-horario-servidor-pt-br/`
**Prerequisites**: `plan.md`, `spec.md`, `research.md`, `data-model.md`, `quickstart.md`

## Dependencies

```text
T001 -> T002 -> T003 -> T004
```

## Phase 1: Setup and preparation

- [X] T001 Confirm the approved feature branch and inspect current route/view contracts in `app.js` and `views/index.ejs`.
- [X] T002 Record architecture and planning completion messages as local Slack drafts in `artifacts/slack-pending/arquiteto.md` and `artifacts/slack-pending/planejador.md`.

## Phase 2: User Story 1 — Consultar a data e hora do servidor (P1)

**Independent validation**: Start the app, load the home page, verify São Paulo date/time and red styling, wait without refreshing to confirm the value stays fixed, reload to confirm it changes, and verify the IP remains visible.

- [X] T003 [US1] Format the current instant for `pt-BR` and `America/Sao_Paulo` once per home-page request and pass explicit availability state to the view in `app.js`.
- [X] T004 [US1] Render the formatted value in a dark red readable style, provide a clear unavailable state, and preserve the existing IP in `views/index.ejs`.

## Phase 3: Review and verification

- [X] T005 Review the complete diff against FR-001–FR-007 and SC-001–SC-005, record findings and the QA Slack draft in `artifacts/slack-pending/revisor-codigo.md` and `artifacts/slack-pending/qa.md`.
- [X] T006 Run the local application and perform the manual validation described in `specs/001-horario-servidor-pt-br/quickstart.md`; record commands and actual results in `artifacts/task-log.md`.

## Execution Notes

- Tasks are sequential because implementation and verification depend on the same route and template.
- No automated test tasks are included; they were not requested. The local run and browser/HTTP checks are part of the requested working demonstration.
- Do not merge directly to `main`; integration requires a reviewed GitHub Pull Request.
