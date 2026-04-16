//
//  BankAccountRepository.swift
//  knowledge
//
//  Created by Gui on 15/04/26.
//

import Foundation

// Repositório central que gerencia todas as operações bancárias
// Separa a lógica de negócio das ViewControllers
class BankAccountRepository {
    
    var indexSelected: Int?          // Guarda o índice da conta selecionada na lista
    var accountList: [BankAccount] = [
        BankAccount(name: "Guilherme D.", accountId: 1, balance: 2000),
        BankAccount(name: "Larissa D.", accountId: 2, balance: 3000)
    ]
    // Realiza saque na conta selecionada
    // completion retorna sucesso com mensagem ou falha com erro
    func withdraw(amount: String?, completion: (Result<String, NSError>) -> Void) {
        // Valida se o campo foi preenchido
        guard let amount = amount, amount != "" else {
            completion(.failure(NSError(domain: "Favor preencher todos os campos", code: -1)))
            return
        }
        // Valida se o valor digitado é numérico
        guard let withdrawValue = convertStringToDouble(text: amount) else {
            completion(.failure(NSError(domain: "Valor inválido", code: -1)))
            return
        }
        // Valida se há uma conta selecionada
        guard let index = indexSelected else {
            completion(.failure(NSError(domain: "Favor selecione um usuario", code: -1)))
            return
        }
        if accountList[index].balance < withdrawValue {
            completion(.failure(NSError(domain: "Saldo insuficiente", code: -1)))
            return
        }
        // Calcula e atualiza o saldo
        accountList[index].balance -= withdrawValue
        completion(.success("Voce sacou R$\(withdrawValue)"))
    }
    // Realiza depósito na conta selecionada
    // Mesma estrutura do withdraw, porém soma o valor
    func deposit(amount: String?, completion: (Result<String, NSError>) -> Void) {
        guard let amount = amount, amount != "" else {
            completion(.failure(NSError(domain: "Favor preencher todos os campos", code: -1)))
            return
        }
        guard let depositValue = convertStringToDouble(text: amount) else {
            completion(.failure(NSError(domain: "Valor inválido", code: -1)))
            return
        }
        guard let index = indexSelected else {
            completion(.failure(NSError(domain: "Favor selecione um usuario", code: -1)))
            return
        }
        accountList[index].balance += depositValue
        completion(.success("Voce depositou R$\(depositValue)"))
    }
// Criado a funcao transfer, onde recebe os parametros responsaveis para realizar a trasngerencia, no caso amount (Valor), accountId (conta escolhida), completion (p/ mensagem ja utilizada em funcoes anteriores), entao a diferenca e que essa funcaon recebe um parametro a mais.
// amount: valor digitado
// accountId: ID da conta, tambem como String?
// completion: Devolve sucesso ou erro, ja em funcoes anterioress
    
    func transfer(amount: String?, accountId: String?, completion:(Result<String, NSError>) -> Void) {
        // Valida se o campo foi preenchido VAZIO
        guard let amount = amount, amount != "" else {
            completion(.failure(NSError(domain: "Favor preencher o valor", code: -1)))
            return
        }
        // valida valor prrenchido,funcao aux convertStringToDouble, caso seja diferente de numero, apresenta a mensagem
        guard let transferValue = convertStringToDouble(text: amount) else {
            completion(.failure(NSError(domain: "Valor inválido", code: -1)))
            return
        }
        // valida id da conta destino, como inteiro obrt
        // valida conta origem, ou seja, a conta que quem vai ennviar o valor, utiliziado o indexSelected
        guard let idText = accountId,
              let accountOriginal = indexSelected,
              let destination = Int(idText) else {
            completion(.failure(NSError(domain: "ID da conta destino inválido", code: -1)))
            return
        }
        // impede transferir para si mesmo, se Conta original foi a Mesma da Conta destino, apresneta mensagem e retorna
        if accountList[accountOriginal].accountId == destination {
            completion(.failure(NSError(domain: "Não pode transferir para a mesma conta", code: -1)))
            return
        }
        // valida saldo suficiente, ou seja, Se valor da conta original for menor que o preenchido no campo, apresenta mensagem e retorna
        if accountList[accountOriginal].balance < transferValue {
            completion(.failure(NSError(domain: "Saldo insuficiente", code: -1)))
            return
        }
        // encontra índice da conta destino
        // firstIndex(where:) ----- Responsavel por percorrer o Array accountList
        // { $0.accountId == targetId } ---- cada item da lista
        // resto da estrutura me retorna a mensagem, assim como nas anteriores
        guard let destinationIndex = accountList.firstIndex(where: { $0.accountId == destination }) else {
            completion(.failure(NSError(domain: "Conta destino não encontrada", code: -1)))
            return
        }
        // calculo da transferencia
        accountList[accountOriginal].balance -= transferValue
        accountList[destinationIndex].balance += transferValue
        completion(.success("Transferência de R$\(transferValue) realizada com sucesso"))
    }
    // Adiciona uma nova conta na lista
    // Gera o ID automaticamente baseado no último ID existente
    func addAccount(name: String?, completion: (Result<String, NSError>) -> Void) {
        guard let name = name, name != "" else {
            completion(.failure(NSError(domain: "Favor preencher todos os campos", code: -1)))
            return
        }
        let id = (accountList.last?.accountId ?? 00) + 1  // Incrementa o último ID
        let newRegistration = BankAccount(name: name, accountId: id, balance: 0)
        self.accountList.append(newRegistration)
        completion(.success("Deu certo"))
    }
    // Retorna a conta atualmente selecionada
    // Retorna nil se nenhuma conta estiver selecionada
    func getUserBank() -> BankAccount? {
        if let index = indexSelected {
            return accountList[index]
        }
        return nil
    }
    // Converte String para Double para cálculos financeiros
    private func convertStringToDouble(text: String) -> Double? {
        return Double(text)
    }
}
