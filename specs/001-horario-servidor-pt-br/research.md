# Research: Data e hora do servidor em pt-BR

## Formatting and time zone

- Decision: usar `Intl.DateTimeFormat` com `pt-BR`, fuso `America/Sao_Paulo` e campos numéricos de ano, mês, dia, hora, minuto e segundo; compor a string final no formato acordado `dd/MM/yyyy HH:mm:ss`.
- Rationale: API padrão de Node.js e suporte explícito ao fuso IANA, sem depender do timezone do host ou instalar biblioteca adicional.
- Alternatives considered: formato local do processo (rejeitado porque varia por host); biblioteca externa (não necessária para o escopo).

## Rendering cadence

- Decision: gerar uma vez no atendimento de cada requisição e incluir como dado do template.
- Rationale: o HTML permanece estático até nova requisição/recarga, como exigido.
- Alternatives considered: JavaScript no navegador com intervalo (rejeitado porque atualizaria continuamente).

## Failure behavior

- Decision: renderizar uma indicação explícita de indisponibilidade se não houver valor formatado.
- Rationale: não mostrar um valor falso ou antigo como atual.
- Alternatives considered: falhar a rota inteira (piora a disponibilidade da página); reutilizar valor anterior (enganoso).
