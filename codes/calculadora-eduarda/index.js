function calcularROI() {
    const capacidade = Number(input_capacidade.value); // Capacidade do reservatório do cliente (em m³)

    const perdaAgua = Number(input_perda_agua.value); // Percentual de perda de água dentro do reservatório

    const custoManutencao = Number(input_custo_manutencao.value);  // Custo com a manutenção do reservatório (em R$)

    const valorAgua = Number(input_valor_agua.value); // Valor da água (em R$/m³)

    const anos = Number(input_investimento_anos.value); // Número de anos

    const percentualReducao = 0.30; // Percentual de redução de perda com nosso sistema


    const volumeAguaPerdido = (capacidade * perdaAgua) / 100; // Calcular o volume de água perdido (em m³)


    const volumeAguaEconomizado = volumeAguaPerdido * percentualReducao;  // Calcular o volume de água economizado (em m³) por ano


    const ganhoObtidoAnual = volumeAguaEconomizado * valorAgua;   // Calcular o ganho obtido com a redução de perdas por ano (em R$)

    // Calcular o ROI acumulado ao longo dos anos
    let ganhoAcumulado = 0;
    let custoAcumulado = 0;
    let roiAcumulado = 0;   

    for (let i = 1; i <= anos; i++) {
        ganhoAcumulado += ganhoObtidoAnual; // Somar o ganho anual ao ganho acumulado
        custoAcumulado += custoManutencao; // Somar o custo anual ao custo acumulado

        // Calcular o ROI acumulado até o ano atual
        roiAcumulado += ((ganhoAcumulado - custoAcumulado) / custoAcumulado) * 100;

    }

    div_exibir.innerHTML = `
            <p>O volume de água economizado por ano é: ${volumeAguaEconomizado.toFixed(2)} m³
            <p>O ganho obtido com a economia de água por ano é: R$ ${ganhoObtidoAnual.toFixed(2)}
            <p>O ganho acumulado em ${anos} anos é: R$ ${ganhoAcumulado.toFixed(2)}
            <p>O ROI acumulado após ${anos} anos é: ${roiAcumulado.toFixed(2)}%</p>
            `;

    
}

