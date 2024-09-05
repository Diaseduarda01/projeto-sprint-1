function calcularRetorno() {
    const capacidade = Number(input_capacidade.value); // Capacidade do reservatório do cliente (em m³)
    var investimento = Number(input_valor_investimento.value); // Valor que o cliente deseja investir
    const custoManutencao = Number(input_custo_manutencao.value); // Custo com a manutenção do reservatório (em R$)
    const valorAgua = Number(input_valor_agua.value); // Valor da água (em R$/m³)
    const anos = Number(input_investimento_anos.value); // Número de anos
    const tipo = input_tipo.value

    var reducaoPercentual = 0;

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

   
    var altura = 0;

    if (tipo == "cilindro") {
        altura = capacidade / (Math.PI * Math.pow(raio, 2)); // Fórmula do cilindro
    } else if (tipo == "quadrado") {
        altura = capacidade / (comprimento * largura); // Fórmula do quadrado
    } else if (tipo == 'metal circular') {
        altura = capacidade / (Math.PI * Math.pow(raio, 2)); // Mesmo cálculo de cilindro
    } else if (tipo == 'taça') {
        altura = (3 * capacidade) / (Math.PI * Math.pow(raio, 2)); // Fórmula da taça (cone)
    } else if (tipo == 'retangular') {
        altura = capacidade / (comprimento * largura); // Fórmula do retângulo
    } else {
       alert("Tipo de reservatório desconhecido. Atendemos os tipos de reservatórios: Reservatório tipo taça ou cilindro, metal circular, de alvenaria, ferro-cimento, escavado no solo, mpermeabilizado com lona no formato retangular. ");
        return;
    }

    // Condicional para determinar a quantidade de sensores
    if (altura <= 4) {
        numeroSensores = 3; // Um sensor para até 4 metros
    } else if ( altura <= 8) {
        numeroSensores = 6; // Dois sensores para entre 4 e 8 metros
    } else if (altura <= 12) {
        numeroSensores = 12; // Três sensores para entre 8 e 12 metros
    } else if (altura <= 16) {
        numeroSensores = ; // Quatro sensores para entre 12 e 16 metros
    } else if (altura <= 20) {
        numeroSensores = 5; // Cinco sensores para entre 16 e 20 metros
    } else {
        alert("Altura do reservatório excede o limite máximo de 20 metros.");
        return;
    }
    // Calcular o volume de água economizado (supondo que o cliente usa a capacidade total)
    const volumeAguaEconomizadoAnualmente = capacidade * reducaoPercentual; // m³
    var ganhoObtidoAnual = volumeAguaEconomizadoAnualmente * valorAgua; // Ganho obtido por ano (R$)

    ganhoObtidoAnual = ganhoObtidoAnual - investimento;
    // Calcular o ganho acumulado ao longo dos anos e desconta o valor do investimento
    var ganhoAcumulado = (ganhoObtidoAnual * anos);
    
    // Calcular o custo acumulado ao longo dos anos
    const custoAcumulado = custoManutencao * anos;

    // Calcular o retorno esperado durante os anos
    const RetornoAcumulado = ((ganhoAcumulado - custoAcumulado) / custoAcumulado) * 100;

    // Exibir os resultados
    div_exibir.innerHTML = `
        <h2>Resultados da Simulação</h2>
        <p>O volume de água economizado por ano é: ${volumeAguaEconomizadoAnualmente.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })} m³</p>
        <p>O ganho obtido com a economia de água por ano é: R$ ${ganhoObtidoAnual.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</p>
        <p>O ganho acumulado em ${anos} anos é: R$ ${ganhoAcumulado.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</p>
        <p>O custo acumulado em ${anos} anos é: R$ ${custoAcumulado.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</p>
        <p>O ROI acumulado após ${anos} anos é: ${RetornoAcumulado.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}%</p>
    `;
}
                           