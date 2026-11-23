# Data Model: Data e hora do servidor em pt-BR

Não existem entidades persistentes para esta funcionalidade. A view recebe um conjunto transitório de dados por requisição:

| Campo | Tipo conceitual | Regra |
|---|---|---|
| `serverDateTime` | texto ou ausente | Quando presente, formato `dd/MM/yyyy HH:mm:ss`, representando a hora de `America/Sao_Paulo`. |
| `serverDateTimeAvailable` | booleano | Verdadeiro somente se o instante foi obtido e formatado para a resposta atual. |
| `ip` | texto existente | Preserva o valor e o comportamento da aplicação atual. |

Os dados não são armazenados entre requisições. O horário deve ser calculado novamente em cada resposta.
