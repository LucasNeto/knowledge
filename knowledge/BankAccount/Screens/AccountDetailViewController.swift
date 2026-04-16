//
//  AccountDetailViewController.swift
//  knowledge
//
//  Created by Gui on 13/04/26.
//

import UIKit

class AccountDetailViewController: UIViewController, UITextFieldDelegate {
    
    var repository: BankAccountRepository?// Repositório compartilhado com a tela principal
    
    @IBOutlet weak var statusTextTransferLabel: UILabel!
    @IBOutlet weak var statusTextDepLabel: UILabel!
    @IBOutlet weak var statusTextWithdrawalLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var balanceAccountLabel: UILabel!
    @IBOutlet weak var withdrawalTextField: UITextField!
    @IBOutlet weak var depositTextField: UITextField!
    @IBOutlet weak var idAccountTransferTextField: UITextField!
    @IBOutlet weak var transferTextField: UITextField!
    
    // Carrega os dados do usuário selecionado ao abrir a tela
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userBank = repository?.getUserBank() {
            self.nameUserLabel.text = ("Ola \(userBank.name)! (Conta: \(userBank.accountId))")
            self.balanceAccountLabel.text = ("Saldo em conta de R$ \(userBank.balance)")
        } else {
            self.nameUserLabel.text = "--"
            self.balanceAccountLabel.text = "--"
        }
    }
    // Executa o saque chamando o repositório e atualiza a tela com o resultado
    @IBAction func buttonClickedWithdrawal(_ sender: Any) {
        repository?.withdraw(amount: withdrawalTextField.text) { [weak self] result in
            switch result {
            case .success(let message):
                self?.statusTextWithdrawalLabel.text = message
                if let userBank = self?.repository?.getUserBank() {
                    self?.balanceAccountLabel.text = ("Saldo em conta de R$ \(userBank.balance)")
                }
            case .failure(let error):
                self?.statusTextWithdrawalLabel.text = error.domain  // Exibe mensagem de erro
            }
        }
    }
    // Executa o depósito chamando o repositório e atualiza a tela com o resultado
    @IBAction func buttonClickedDeposit(_ sender: Any) {
        repository?.deposit(amount: depositTextField.text) { [weak self] result in
            switch result {
            case .success(let message):
                self?.statusTextDepLabel.text = message
                if let userBank = self?.repository?.getUserBank() {
                    self?.balanceAccountLabel.text = ("Saldo em conta de R$ \(userBank.balance)")
                }
            case .failure(let error):
                self?.statusTextDepLabel.text = error.domain  // Exibe mensagem de erro
            }
        }
    }
    // replicado conforme botoes anteriores, porem existe um parametro a mias na funcao, e idAccount recebe o valor do campo de texto do ID
    @IBAction func buttonClickedTransfer(_ sender: Any) {
        repository?.transfer(amount: transferTextField.text, accountId: idAccountTransferTextField.text) { [weak self] result in
            switch result {
            case .success(let message):
                self?.statusTextTransferLabel.text = message
                if let userBank = self?.repository?.getUserBank() {
                    self?.balanceAccountLabel.text = ("Saldo em conta de R$ \(userBank.balance)")
                }
            case .failure(let error):
                self?.statusTextTransferLabel.text = error.domain
            }
        }
    }
}
