const express = require('express');
const os = require('os');

const app = express();
const port = 3000;

// Configurar EJS como a engine de visualização
app.set('view engine', 'ejs');

app.get('/', (req, res) => {
  // Obter o endereço IP do servidor
  const ip = getIpAddress();

  // Capturar e formatar uma única vez para esta resposta, sem depender do fuso do host.
  let horaAtual = null;
  try {
    const serverDateTimeFormatter = new Intl.DateTimeFormat('pt-BR', {
      timeZone: 'America/Sao_Paulo',
      day: '2-digit',
      month: '2-digit',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hourCycle: 'h23',
    });
    const partes = serverDateTimeFormatter.formatToParts(new Date());
    const valores = Object.fromEntries(partes.map(({ type, value }) => [type, value]));
    horaAtual = `${valores.day}/${valores.month}/${valores.year} ${valores.hour}:${valores.minute}:${valores.second}`;
  } catch (error) {
    console.error('Não foi possível formatar a data e hora do servidor:', error);
  }

  // Renderizar a página ejs com as informações
  res.render('index', { ip, horaAtual, horaAtualDisponivel: Boolean(horaAtual) });
});

// Função para obter o endereço IP do servidor
function getIpAddress() {
  const interfaces = os.networkInterfaces();
  for (const iface in interfaces) {
    const ifaceInfo = interfaces[iface];
    for (const alias of ifaceInfo) {
      if (alias.family === 'IPv4' && !alias.internal) {
        return alias.address;
      }
    }
  }
  return 'Endereço IP não encontrado';
}

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
