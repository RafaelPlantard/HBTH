//
//  PageRepository.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/10/21.
//

final class PageRepository: PageRepositoryProtocol {
    func list() -> [PageViewModel] {
        [
            PageViewModel(button: "Entrar", image: #imageLiteral(resourceName: "marvel-step-4")),
            PageViewModel(
                text: """
                    Para cada tela: 1 dica\nPara cada dica: 1 lugar\nPara cada lugar: 1 código\n\n E de código em código
                    você chega lá!
                """,
                button: "Entrar", image: #imageLiteral(resourceName: "marvel-step-5")
            ),
            PageViewModel(
                text: "Uma boa música é constituída por teclas brancas e pretas",
                passcode: "MTIzMg==",
                image: #imageLiteral(resourceName: "marvel-step-7")
            ),
            PageViewModel(
                text: "Em Minas é Quiboa, em São Paulo é Cândida",
                passcode: "NzE4NA==",
                image: #imageLiteral(resourceName: "marvel-step-3")
            ),
            PageViewModel(
                text: "Um lugar escuro, onde se encontram as caixas de água! Lá tem uma cadeira/banco diferente",
                passcode: "OTIzOA==",
                image: #imageLiteral(resourceName: "marvel-step-2")
            ),
            PageViewModel(
                text: """
                    Você encontrou a chave de uma porta que tem um enfeite vermelho na frente.
                """,
                button: "Entrar", image: #imageLiteral(resourceName: "marvel-step-6")
            ),
            PageViewModel(
                text: "Embaixo da mesa o último código",
                passcode: "MTk4NA==",
                image: #imageLiteral(resourceName: "marvel-step-2")
            ),
            PageViewModel(
                text: """
                    Abra a segunda porta mais perto da parede e pegue a maior sacola.
                """,
                button: "Entrar", image: #imageLiteral(resourceName: "marvel-step-1")
            ),
            PageViewModel(
                text: """
                    Parabéns Douglas pelos seus 17 anos. \n
                    Muitos felicidades e trades de vida para você.\n
                    Nunca foi sorte, sempre foi Deus!
                """,
                button: "Finalizar", image: #imageLiteral(resourceName: "douglas")
            ),
        ]
    }
}
