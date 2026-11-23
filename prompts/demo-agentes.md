# Demonstração ao vivo — transferência entre agentes

Use este prompt no Codex CLI dentro do clone:

```text
Atue como Orquestrador da Fábrica e faça uma demonstração real, sequencial e somente de leitura da Feature 001 já aprovada. Use os perfis customizados do repositório, chamando um de cada vez e aguardando cada resposta: analista-requisitos, arquiteto, planejador, desenvolvedor, revisor-codigo e qa. O Analista deve resumir critérios de specs/001-horario-servidor-pt-br/spec.md; Arquiteto e Planejador explicam os artefatos; Desenvolvedor explica o diff existente; Revisor avalia app.js e views/index.ejs; QA relata as evidências reais em artifacts/task-log.md. Não altere nenhum arquivo, não execute comandos de escrita e não publique no Slack. Mostre claramente cada transferência e o resultado de cada perfil. Não invente invocações ou resultados: se não conseguir chamar um perfil, informe a limitação.
```

O modo `read-only` torna a demonstração segura para repetir sobre a branch já implementada. Cada sessão Codex precisa estar autenticada e com acesso ao endpoint do modelo.
