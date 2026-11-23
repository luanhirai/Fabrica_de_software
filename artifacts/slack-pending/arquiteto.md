# Rascunho de conclusão — Arquiteto

- Status: concluído; especificação aprovada pelo responsável.
- Resumo: a alteração deve calcular a data/hora uma vez ao atender a rota existente e enviar a representação pronta à view. A página deve renderizar o texto destacado em vermelho escuro e não deve usar atualização contínua no navegador.
- Arquivos previstos: `app.js` para obter e formatar o instante de São Paulo; `views/index.ejs` para apresentação. `package.json` permanece inalterado salvo necessidade demonstrada.
- Decisão: preferir a API de internacionalização/formatting nativa de Node.js com fuso IANA `America/Sao_Paulo`, se compatível com a versão/runtime existente; não adicionar dependência sem necessidade.
- Risco: versão do Node instalada precisa suportar `Intl.DateTimeFormat` para `pt-BR` e fuso IANA. O requisito de fallback em caso de falha deve evitar exibir um valor falso.
- Slack: envio pendente; este arquivo é apenas rascunho local.
