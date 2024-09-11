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
    if (investimento <= 1000) {
        reducaoPercentual = 0.20; // 20% de redução
    } else if (investimento <= 2000) {
        reducaoPercentual = 0.25; // 25% de redução
    } else if (investimento <= 3000) {
        reducaoPercentual = 0.30; // 35% de redução
    } else if (investimento <= 5000) {
        reducaoPercentual = 0.35; // 40% de redução
    } else {
        reducaoPercentual = 0.50; // 50% de redução
    }

    // Inicializa as variáveis para altura, comprimento, largura e número de sensores
    var altura = 0;
    var raio = 1; // Raio padrão para cilindros e metálicos (em metros)
    var comprimento = 2; // Comprimento padrão para retangulares (em metros)
    var largura = 2; // Largura padrão para retangulares (em metros)

    // Definição de π (aproximado)
    const pi = 3.14159;

    // Função para calcular a potência manualmente para expoente 2 (quadrado)
    function quadrado(valor) {
        return valor * valor;
    }

    // Calcula a altura do reservatório com base no tipo selecionado
    if (tipo == "cilindro") {
        altura = capacidade / (pi * quadrado(raio)); // Fórmula para cilindro
    } else if (tipo == "quadrado") {
        altura = capacidade / (comprimento * largura); // Fórmula para quadrado
    } else if (tipo == 'metal circular') {
        altura = capacidade / (pi * quadrado(raio)); // Mesmo cálculo que cilindro
    } else if (tipo == 'taça') {
        altura = (3 * capacidade) / (pi * quadrado(raio)); // Fórmula para taça (cone)
    } else if (tipo == 'retangular') {
        altura = capacidade / (comprimento * largura); // Fórmula para retângulo
    } else {
        // Exibe um alerta se o tipo de reservatório não for reconhecido
        alert("Tipo de reservatório desconhecido. Atendemos os tipos de reservatórios: Reservatório tipo taça ou cilindro, metal circular, de alvenaria, ferro-cimento, escavado no solo, impermeabilizado com lona no formato retangular.");
        return; // Sai da função se o tipo for desconhecido
    }


    if (altura <= 1000) {
        // Divide a altura por 4 e arredonda para cima manualmente
        var divisao = altura / 4;
        var numeroSensores = parseInt(divisao); // Parte inteira da divisão

        // Se a divisão não for exata, adiciona 1 para arredondar para cima
        if (altura % 4 !== 0) {
            numeroSensores += 1;
        }

        // Adiciona 1 para garantir o mínimo de 2 sensores
        numeroSensores += 1;
    } else {
        alert("Altura do reservatório excede o limite máximo de 1000 metros.");
        return;
    }

    // Calcular o volume de água economizado anualmente
    var volumeAguaEconomizadoAnualmente = capacidade * reducaoPercentual;

    
    // Calcular o volume de água economizado anualmente
    var volumeAguaEconomizadoAnualmente = capacidade * reducaoPercentual


    var ganhoObtidoAnual = volumeAguaEconomizadoAnualmente * valorAgua; // Ganho anual com a economia de água

    // Calcular o ganho acumulado ao longo dos anos
    var ganhoAcumulado = ganhoObtidoAnual * anos;

    // Calcular o custo acumulado de manutenção ao longo dos anos
    var custoEvitado = (custoManutencao * anos) * reducaoPercentual;

    // Calcular o retorno esperado durante os anos, levando em consideração o investimento
    var RetornoAcumulado = ((ganhoAcumulado - custoEvitado) / investimento) * 100;

    // Exibir os resultados
    div_exibir.innerHTML = `
    <center>
        <h2>Resultados da Simulação</h2>

        <ul style="list-style-type: none; padding-left: 0;">
            <li>
                <p><b>O volume de água economizado por ano é:</b> 
                    <b>${volumeAguaEconomizadoAnualmente.toLocaleString('pt-BR', { slyte: 'currency', currency: 'BRL' })} m³</b>.
                    <br>Estudos realizados por Pravat Kumar Shit indicam que sistemas de controle de água <br>
                    como o proposto podem reduzir até 50% de perdas em áreas agrícolas, resultando em economia significativa. <br>
                    Dito isso, com seu investimento de <b>R$ ${investimento.toLocaleString('pt-BR', { slyte: 'currency', currency: 'BRL' })}</b>,
                    seu porcentual de redução chegará até: <b>${(reducaoPercentual * 100)}%</b>.
                </p>
            </li>

            <li>
                <p>
                    <b>O custo evitado em</b> <b>${anos} anos</b>, considerando o valor atual da água que é de <b>R$ ${valorAgua.toLocaleString('pt-BR', { slyte: 'currency', currency: 'BRL' })} por m³</b> e a redução projetada que é de <b>${(reducaoPercentual * 100)}%</b>, <br>
                    seria de <b>R$ ${custoEvitado.toLocaleString('pt-BR', { slyte: 'currency', currency: 'BRL' })}</b>,
                    garantindo maior sustentabilidade financeira.
                </p>
            </li>

            <li>
                <p><b>O ganho obtido com a economia de água por ano é:</b> 
                    <b>R$ ${ganhoObtidoAnual.toLocaleString('pt-BR', { slyte: 'currency', currency: 'BRL' })}</b>.
                    <br>Essa economia reflete uma gestão eficiente dos recursos hídricos.
                </p>
            </li>

         

            <li>
                <p><b>O ganho acumulado em ${anos} anos é:</b> 
                    <b>R$ ${ganhoAcumulado.toLocaleString('pt-BR', { slyte: 'currency', currency: 'BRL' })}</b>.
                    <br>Ao longo dos anos, a economia gerada aumenta consideravelmente, maximizando os benefícios para o seu negócio.
                </p>
            </li>

     
             
            <li>
                <p><b>O retorno acumulado após ${anos} anos é:</b> 
                    <b>${RetornoAcumulado.toLocaleString('pt-BR', { slyte: 'currency', currency: 'BRL' })}%</b>.
                    <br>O retorno financeiro proporcionado pela economia de água ao longo do tempo é significativo, reforçando a importância de uma gestão eficiente.
                </p>
            </li>

            <li>
                <p><b>Impacto ambiental:</b> 
                    A economia de água obtida equivale a <b>${(volumeAguaEconomizadoAnualmente / 2500).toFixed(2)}</b> piscinas olímpicas por ano.
                </p>
            </li>

            <li>
                <p>
                    O projeto <b>Daryo</b> utilizará <b>${numeroSensores}</b> sensores ultrassônicos no seu reservatório de altura <b>${altura.toFixed(0)} metros</b> 
                    sendo do tipo <b>${tipo}</b>, para monitorar com precisão os níveis de água. <br>
                    Os dados coletados permitem que você tome decisões rápidas e eficazes para reduzir desperdícios e otimizar o uso da água.
                </p>
            </li>
            
        </ul>

        <p><b><i>"Gestão Resiliente e Sustentável do Armazenamento de Água na Agricultura"</i> - Pravat Kumar Shit</b></p> <br>
        <button onclick="window.location.reload();"><a>Realizar outra simulação</a></button>  
    </center>
`;
}
