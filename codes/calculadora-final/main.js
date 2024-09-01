function calcularROI() {
    const capacidade = Number(input_capacidade.value); // Capacidade do reservatório do cliente (em m³)
    var investimento = Number(input_valor_investimento.value); // Valor que o cliente deseja investir
    const custoManutencao = Number(input_custo_manutencao.value); // Custo com a manutenção do reservatório (em R$)
    const valorAgua = Number(input_valor_agua.value); // Valor da água (em R$/m³)
    const anos = Number(input_investimento_anos.value); // Número de anos

    let reducaoPercentual;

    // Definindo a redução percentual com base no valor do investimento
    if (investimento <= 10000) {
        reducaoPercentual = 0.20; // 20% de redução
    } else if (investimento <= 20000) {
        reducaoPercentual = 0.25; // 25% de redução
    } else if (investimento <= 30000) {
        reducaoPercentual = 0.35; // 35% de redução
    } else if (investimento <= 50000) {
        reducaoPercentual = 0.40; // 40% de redução
    } else {
        reducaoPercentual = 0.50; // 50% de redução
    }

    // Calcular o volume de água economizado (supondo que o cliente usa a capacidade total)
    const volumeAguaEconomizadoAnualmente = capacidade * reducaoPercentual; // m³
    var ganhoObtidoAnual = volumeAguaEconomizadoAnualmente * valorAgua; // Ganho obtido por ano (R$)

    ganhoObtidoAnual = ganhoObtidoAnual - investimento;
    // Calcular o ganho acumulado ao longo dos anos e desconta o valor do investimento
    var ganhoAcumulado = (ganhoObtidoAnual * anos);
    
    // Calcular o custo acumulado ao longo dos anos
    const custoAcumulado = custoManutencao * anos;

    // Calcular o ROI acumulado
    const roiAcumulado = ((ganhoAcumulado - custoAcumulado) / custoAcumulado) * 100;

    // Exibir os resultados
    div_exibir.innerHTML = `
        <h2>Resultados da Simulação</h2>
        <p>O volume de água economizado por ano é: ${volumeAguaEconomizadoAnualmente.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })} m³</p>
        <p>O ganho obtido com a economia de água por ano é: R$ ${ganhoObtidoAnual.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</p>
        <p>O ganho acumulado em ${anos} anos é: R$ ${ganhoAcumulado.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</p>
        <p>O custo acumulado em ${anos} anos é: R$ ${custoAcumulado.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</p>
        <p>O ROI acumulado após ${anos} anos é: ${roiAcumulado.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}%</p>
    `;
}
                           