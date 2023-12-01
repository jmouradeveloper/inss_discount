## Interface de monitoramento de Atualização de Proponente em segundo plano

Acessar http://localhost:3000/sidekiq

As seguintes abas serão apresentadas:

- Processed: Processos finalizados com sucesso.
- Failed: Processos que falharam ao executar.
- Busy: Processos em andamento.
- Enqueued: Processos na fila para serem executados.
- Retries: Processos que falharam ao executar e enfileirados para outra tentativa.
- Schedule: Processos com execuções agendadas.
- Dead: Processos cujos as execuções foram desabilitadas.
