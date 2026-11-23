# Rascunho de conclusão — QA

- Status: verificação manual concluída nos critérios observáveis.
- Evidência: servidor local retornou HTTP 200; página exibiu IP e horário `dd/MM/yyyy HH:mm:ss` com classe `server-time` e cor `#b42318`; duas requisições com intervalo de 2 segundos renderizaram instantes distintos; não há timer no HTML; timezone São Paulo foi calculado corretamente com o processo em UTC.
- Comandos: `node --check app.js`, `git diff --check`, `npm.cmd start`, `Invoke-WebRequest http://localhost:3000` e verificação do formatter Node sob `TZ=UTC`.
- Limitação: validação por HTTP e inspeção do HTML; nenhum teste automatizado foi criado ou executado.
- Slack: envio pendente; este arquivo é apenas rascunho local.
