function calcularRetorno() {
    const capacidade = Number(input_capacidade.value); // Capacidade do reservatório do cliente (em m³)
    var investimento = Number(input_valor_investimento.value); // Valor que o cliente deseja investir
    const custoManutencao = Number(input_custo_manutencao.value); // Custo com a manutenção do reservatório (em R$)
    const valorAgua = Number(input_valor_agua.value); // Valor da água (em R$/m³)
    const anos = Number(input_investimento_anos.value); // Número de anos
    var tipo = input_tipo.value

    // Inicializa a variável para a redução percentual de perdas de água
    var reducaoPercentual = 0;

    // Define a redução percentual com base no valor do investimento
    if (investimento <= 10000) {
        reducaoPercentual = 0.80; // 20% de redução
    } else if (investimento <= 20000) {
        reducaoPercentual = 0.75; // 25% de redução
    } else if (investimento <= 30000) {
        reducaoPercentual = 0.65; // 35% de redução
    } else if (investimento <= 50000) {
        reducaoPercentual = 0.60; // 40% de redução
    } else {
        reducaoPercentual = 0.50; // 50% de redução
    }

    // Inicializa as variáveis para altura, comprimento, largura e número de sensores
    var altura = 0;
    var comprimento = 0;
    var raio = 1; // Raio padrão para cilindros e metálicos (em metros)
    var comprimento = 2; // Comprimento padrão para retangulares (em metros)
    var largura = 2; // Largura padrão para retangulares (em metros)

    // Calcula a altura do reservatório com base no tipo selecionado
    if (tipo == "cilindro") {
        altura = capacidade / (Math.PI * Math.pow(raio, 2)); // Fórmula para cilindro
    } else if (tipo == "quadrado") {
        altura = capacidade / (comprimento * largura); // Fórmula para quadrado
    } else if (tipo == 'metal circular') {
        altura = capacidade / (Math.PI * Math.pow(raio, 2)); // Mesmo cálculo que cilindro
    } else if (tipo == 'taça') {
        altura = (3 * capacidade) / (Math.PI * Math.pow(raio, 2)); // Fórmula para taça (cone)
    } else if (tipo == 'retangular') {
        altura = capacidade / (comprimento * largura); // Fórmula para retângulo
    } else {
        // Exibe um alerta se o tipo de reservatório não for reconhecido
        alert("Tipo de reservatório desconhecido. Atendemos os tipos de reservatórios: Reservatório tipo taça ou cilindro, metal circular, de alvenaria, ferro-cimento, escavado no solo, impermeabilizado com lona no formato retangular.");
        return; // Sai da função se o tipo for desconhecido
    }

    // Determina a quantidade de sensores com base na altura do reservatório
    if (altura <= 4) {
        numeroSensores = 1; // Um sensor para até 4 metros
    } else if (altura <= 8) {
        numeroSensores = 2; // Dois sensores para entre 4 e 8 metros
    } else if (altura <= 12) {
        numeroSensores = 3; // Três sensores para entre 8 e 12 metros
    } else if (altura <= 16) {
        numeroSensores = 4; // Quatro sensores para entre 12 e 16 metros
    } else if (altura <= 20) {
        numeroSensores = 5; // Cinco sensores para entre 16 e 20 metros
    } else if (altura <= 24) {
        numeroSensores = 6; // Seis sensores para entre 20 e 24 metros
    } else if (altura <= 28) {
        numeroSensores = 7; // Sete sensores para entre 24 e 28 metros
    } else if (altura <= 32) {
        numeroSensores = 8; // Oito sensores para entre 28 e 32 metros
    } else if (altura <= 36) {
        numeroSensores = 9; // Nove sensores para entre 32 e 36 metros
    } else if (altura <= 40) {
        numeroSensores = 10; // Dez sensores para entre 36 e 40 metros
    } else if (altura <= 44) {
        numeroSensores = 11; // Onze sensores para entre 40 e 44 metros
    } else if (altura <= 48) {
        numeroSensores = 12; // Doze sensores para entre 44 e 48 metros
    } else if (altura <= 52) {
        numeroSensores = 13; // Treze sensores para entre 48 e 52 metros
    } else if (altura <= 56) {
        numeroSensores = 14; // Quatorze sensores para entre 52 e 56 metros
    } else if (altura <= 60) {
        numeroSensores = 15; // Quinze sensores para entre 56 e 60 metros
    } else if (altura <= 64) {
        numeroSensores = 16; // Dezesseis sensores para entre 60 e 64 metros
    } else if (altura <= 68) {
        numeroSensores = 17; // Dezessete sensores para entre 64 e 68 metros
    } else if (altura <= 72) {
        numeroSensores = 18; // Dezoito sensores para entre 68 e 72 metros
    } else if (altura <= 76) {
        numeroSensores = 19; // Dezenove sensores para entre 72 e 76 metros
    } else if (altura <= 80) {
        numeroSensores = 20; // Vinte sensores para entre 76 e 80 metros
    } else if (altura <= 84) {
        numeroSensores = 21; // Vinte e um sensores para entre 80 e 84 metros
    } else if (altura <= 88) {
        numeroSensores = 22; // Vinte e dois sensores para entre 84 e 88 metros
    } else if (altura <= 92) {
        numeroSensores = 23; // Vinte e três sensores para entre 88 e 92 metros
    } else if (altura <= 96) {
        numeroSensores = 24; // Vinte e quatro sensores para entre 92 e 96 metros
    } else if (altura <= 100) {
        numeroSensores = 25; // Vinte e cinco sensores para entre 96 e 100 metros
    } else {
        // Exibe um alerta se a altura do reservatório exceder 100 metros
        alert("Altura do reservatório excede o limite máximo de 100 metros.");
        return; // Sai da função se a altura for excessiva
    }
    
    // Calcular o volume de água economizado anualmente
    var volumeAguaEconomizadoAnualmente = capacidade * reducaoPercentual;
    var ganhoObtidoAnual = volumeAguaEconomizadoAnualmente * valorAgua; // Ganho anual com a economia de água

    // Calcular o ganho acumulado ao longo dos anos
    var ganhoAcumulado = (ganhoObtidoAnual * anos);

    // Calcular o custo acumulado de manutenção ao longo dos anos
    var custoAcumulado = (custoManutencao * anos) * reducaoPercentual;

    // Calcular o retorno esperado durante os anos, levando em consideração o investimento
    var RetornoAcumulado = (investimento - ganhoAcumulado - custoAcumulado) / investimento * 100;

    // Exibir os resultados
    div_exibir.innerHTML = `
    <center>
        <h2>Resultados da Simulação</h2>

        <ul style="list-style-type: none; padding-left: 0;">
            <li>
                <p>O volume de água economizado por ano é: 
                    <b>${volumeAguaEconomizadoAnualmente.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })} m³</b>.
                    <br>Com base em estudos sobre gestão eficiente de água, a economia pode alcançar até 50% ao evitar desperdícios. <br>
                    Dito isso, com seu investimento de <b>R$ ${investimento.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</b> 
                    e o porcentual de redução será de: <b>${(reducaoPercentual * 100)}%</b>.
                </p>
            </li>

            <li>
                <p>O ganho obtido com a economia de água por ano é: 
                    <b>R$ ${ganhoObtidoAnual.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</b>.
                    <br>Esse valor reflete a redução do consumo de água, resultando em economia significativa nos custos anuais.
                </p>
            </li>

            <li>
                <p>O ganho acumulado em ${anos} anos é: 
                    <b>R$ ${ganhoAcumulado.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</b>.
                    <br>Ao longo dos anos, a economia gerada aumenta consideravelmente, maximizando os benefícios para o seu negócio.
                </p>
            </li>

            <li>
                <p>O custo acumulado em ${anos} anos é: 
                    <b>R$ ${custoAcumulado.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</b>.
                    <br>Esses custos incluem as manutenções necessárias para manter o sistema funcionando corretamente.
                </p>
            </li>

            <li>
                <p>O retorno acumulado após ${anos} anos é: 
                    <b>${RetornoAcumulado.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}%</b>.
                    <br>O retorno financeiro proporcionado pela economia de água ao longo do tempo é significativo, reforçando a importância de uma gestão eficiente.
                </p>
            </li>

            <li>
                <p>
                    O projeto <b>Daryo</b> utilizará <b>${numeroSensores}</b> sensores ultrassônicos no seu reservatório de altura <b>${altura.toFixed(0)}</b>, 
                    para monitorar com precisão os níveis de água. <br>
                    Os dados coletados permitem que você tome decisões rápidas e eficazes para reduzir desperdícios e otimizar o uso da água.
                </p>
            </li>
        </ul>

        <p><i>"Gestão Resiliente e Sustentável do Armazenamento de Água na Agricultura"</i> - Pravat Kumar Shit</p> <br>
        <button onclick="window.location.reload();"><a>Realizar outra simulação</a></button>  
    </center>
`;



}
