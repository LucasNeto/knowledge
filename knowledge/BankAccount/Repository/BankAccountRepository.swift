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
            completion(.failure(NSError(domain: "Favor preencher o campo com numero", code: -1)))
            return
        }
        // Valida se há uma conta selecionada
        guard let index = indexSelected else {
            completion(.failure(NSError(domain: "Favor selecione um usuario", code: -1)))
            return
        }
        // Calcula e atualiza o saldo
        let calculation = accountList[index].balance - withdrawValue
        accountList[index].balance = calculation
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
            completion(.failure(NSError(domain: "Favor preencher o campo com numero", code: -1)))
            return
        }
        guard let index = indexSelected else {
            completion(.failure(NSError(domain: "Favor selecione um usuario", code: -1)))
            return
        }
        let calculation = accountList[index].balance + depositValue
        accountList[index].balance = calculation
        completion(.success("Voce depositou R$\(depositValue)"))
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
