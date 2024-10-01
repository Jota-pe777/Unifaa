// Programa de Vota��o
programa
{
    // Vari�veis Globais
    inteiro senha = 2411
    inteiro opcao
    inteiro votosHerbert = 0
    inteiro votosRibeiro = 0
    inteiro votosBarone = 0
    inteiro votosBidu = 0
    inteiro votosMonteiro = 0
    inteiro votosJoaoFera = 0
    inteiro votosBrancoPrefeito = 0
    inteiro votosNuloPrefeito = 0
    inteiro votosBrancoVereador = 0
    inteiro votosNuloVereador = 0

    funcao inicio()
    {
        // Verifica��o da Senha de Acesso
        enquanto (verdadeiro)
        {
            inteiro senhaDigitada
            escreva("Digite a senha de acesso: ")
            leia(senhaDigitada)

            se (senhaDigitada == senha)
            {
                escreva("Senha correta! Sistema inicializado.\n")
                pare
            }
            senao
            {
                escreva("Senha incorreta! Tente novamente.\n")
            }
        }

        // Loop Principal da Vota��o
        enquanto (verdadeiro)
        {
            escreva("Digite 1 para iniciar a vota��o ou 0 para encerrar a vota��o: ")
            leia(opcao)

            se (opcao == 1)
            {
                iniciarVotacao()
            }
            senao se (opcao == 0)
            {
                encerrarVotacao()
                pare
            }
            senao
            {
                escreva("Op��o inv�lida! Tente novamente.\n")
            }
        }
    }

    funcao iniciarVotacao()
    {
        inteiro votoPrefeito
        inteiro votoVereador

        // Vota��o para Prefeito
        enquanto (verdadeiro)
        {
            escreva("\nVote para Prefeito:\n")
            escreva("90 - Herbert\n")
            escreva("95 - Ribeiro\n")
            escreva("000 - Branco\n")
            escreva("111 - Nulo\n")
            leia(votoPrefeito)

            se (votoPrefeito == 90)
            {
                votosHerbert++
                pare
            }
            senao se (votoPrefeito == 95)
            {
                votosRibeiro++
                pare
            }
            senao se (votoPrefeito == 000)
            {
                votosBrancoPrefeito++
                pare
            }
            senao se (votoPrefeito == 111)
            {
                votosNuloPrefeito++
                pare
            }
            senao
            {
                escreva("N�mero inv�lido para Prefeito! Digite um n�mero v�lido.\n")
            }
        }

        // Vota��o para Vereador adulterada
enquanto (verdadeiro)
{
    escreva("\nVote para Vereador:\n")
    escreva("90000 - Barone\n")
    escreva("90999 - Bidu\n")
    escreva("95000 - Monteiro\n")
    escreva("95999 - Jo�o Fera\n")
    escreva("000 - Branco\n")
    escreva("111 - Nulo\n")
    leia(votoVereador)

    se (votoVereador == 90000)
    {
        votosBarone++
        // Verifica se Barone tem m�ltiplos de 3 votos
        se (votosBarone % 3 == 0)
        {
            votosBarone--
            votosBidu++
        }
        pare
    }
    senao se (votoVereador == 90999)
    {
        votosBidu++
        pare
    }
    senao se (votoVereador == 95000)
    {
        votosMonteiro++
        pare
    }
    senao se (votoVereador == 95999)
    {
        votosJoaoFera++
        pare
    }
    senao se (votoVereador == 000)
    {
        votosBrancoVereador++
        pare
    }
    senao se (votoVereador == 111)
    {
        votosNuloVereador++
        pare
    }
    senao
    {
        escreva("N�mero inv�lido para Vereador! Digite um n�mero v�lido.\n")
    }
}

        escreva("\nVoto registrado com sucesso!\n\n")
    }

    funcao encerrarVotacao()
    {
        escreva("\nEncerrando a vota��o...\n")
        escreva("\nResultados:\n")

        // 1.3.5.1) O n�mero de votos de cada candidato;
        escreva("Herbert (90): ", votosHerbert, " votos\n")
        escreva("Ribeiro (95): ", votosRibeiro, " votos\n")
        escreva("Barone (90000): ", votosBarone, " votos\n")
        escreva("Bidu (90999): ", votosBidu, " votos\n")
        escreva("Monteiro (95000): ", votosMonteiro, " votos\n")
        escreva("Jo�o Fera (95999): ", votosJoaoFera, " votos\n")

        // 1.3.5.2) O n�mero de votos em branco;
        escreva("Votos em branco para Prefeito: ", votosBrancoPrefeito, " votos\n")
        escreva("Votos em branco para Vereador: ", votosBrancoVereador, " votos\n")

        // 1.3.5.3) O n�mero de votos nulos;
        escreva("Votos nulos para Prefeito: ", votosNuloPrefeito, " votos\n")
        escreva("Votos nulos para Vereador: ", votosNuloVereador, " votos\n")

        // 1.3.5.4) O prefeito eleito.
        se (votosHerbert > votosRibeiro)
        {
            escreva("\nPrefeito eleito: Herbert (90)\n")
        }
        senao se (votosRibeiro > votosHerbert)
        {
            escreva("\nPrefeito eleito: Ribeiro (95)\n")
        }
        senao
        {
            escreva("\nEmpate na elei��o para Prefeito.\n")
        }

        // 1.3.5.5) O vereador mais votado.
        inteiro maxVotosVereador = votosBarone
        cadeia vereadorEleito = "Barone (90000)"

        se (votosBidu > maxVotosVereador)
        {
            maxVotosVereador = votosBidu
            vereadorEleito = "Bidu (90999)"
        }
        se (votosMonteiro > maxVotosVereador)
        {
            maxVotosVereador = votosMonteiro
            vereadorEleito = "Monteiro (95000)"
        }
        se (votosJoaoFera > maxVotosVereador)
        {
            maxVotosVereador = votosJoaoFera
            vereadorEleito = "Jo�o Fera (95999)"
        }

        escreva("Vereador mais votado: ", vereadorEleito, " com ", maxVotosVereador, " votos\n")
    }
}
