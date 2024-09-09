function calcularROI() {

    const CustoInvestimento = Number(input_investimento.value);

    const Tamanho = Number(input_tamanho_reservatório.value); 

    const CustoManutencao = Number(input_custo_manutencao.value);  

    const valorAgua = Number(input_valor_litro.value); 

    const anos = Number(input_investimento_anos.value); 



    const EconomiaAnualAgua = Tamanho * valorAgua; 


    const GanhoInvestimento = (EconomiaAnualAgua - CustoManutencao) * anos;  


    const ROI = ((GanhoInvestimento - CustoInvestimento)/CustoInvestimento)  * 100;   

   
    

    div_exibir.innerHTML = `
            <p> Em ${anos} anos o seu ganho vai ser de: R$${GanhoInvestimento}
            <p>gerando um ROI acumulado de: ${ROI.toFixed(2)}%</p>

            <style>
                button {
                    width: 100%;
                    margin-top: 2.5rem;
                    border: none;
                    background-color: #53a7f5;
                    padding: 0.62rem;
                    border-radius: 5px;
                    cursor: pointer;
                    }
                button:hover{
                background-color: #4389ca;
                }
                p{
                    font-size: 0.95rem;
                    font-weight: 600;
                    color: #000000c0
                }
                button a {
                    text-decoration: none;
                    font-size: 0.93rem;
                    font-weight: 500;
                    color:#ffff;

            </style>

            <button onclick="window.location.reload();"><a>Realizar outra simulação</a></button>
            </div>`;

}