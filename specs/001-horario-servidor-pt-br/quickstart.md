# Quickstart: Data e hora do servidor em pt-BR

## Pré-requisitos

- Node.js e npm instalados.
- Dependências do projeto instaladas com `npm install`.

## Executar

1. Na raiz do repositório, execute `npm start`.
2. Abra `http://localhost:3000`.
3. Confira que a página mostra o IP e uma data/hora no formato `dd/MM/yyyy HH:mm:ss`, em vermelho escuro.
4. Aguarde alguns segundos sem recarregar. O valor deve permanecer igual.
5. Recarregue a página. O valor deve refletir o novo instante.

## Verificações adicionais

- O valor de hora deve corresponder a `America/Sao_Paulo` mesmo quando o timezone do processo é diferente.
- A resposta HTML deve conter um único horário já renderizado e não depender de script/temporizador para alterá-lo.
- O IP deve continuar presente na página.
- Se o formatter não produzir um valor, a interface deve exibir indisponibilidade explícita, nunca um horário anterior.
