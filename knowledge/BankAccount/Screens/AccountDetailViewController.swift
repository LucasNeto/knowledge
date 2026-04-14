//
//  UserBank.swift
//  knowledge
//
//  Created by Gui on 13/04/26.
//

import UIKit

class AccountDetailViewController: UIViewController, UITextFieldDelegate {
    
    var userBank: BankAccount?
    @IBOutlet weak var statusTextDep: UILabel!
    @IBOutlet weak var statusTextTransfer: UILabel!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var balanceAccount: UILabel!
    @IBOutlet weak var transferTextField: UITextField!
    @IBOutlet weak var depositTextField: UITextField!
    
    @IBAction func buttonTransfer(_ sender: Any) {
        // Verifica se o campo está preenchido antes de continuar
        if !checkEmptyFields() {
            if let convertText = convertStringToInt(text: transferTextField.text), // Desembrulha o texto do campo convertendo para Double e o userBank garantindo que não é nil
               let userBank = userBank {
                let calculation = userBank.balance - convertText // Calcula o novo saldo somando o valor depositado
                userBank.balance = calculation  // Atualiza o balance no objeto userBank
                statusTextTransfer.text = ("Voce sacou R$\(convertText)")// Mostra mensagem de confirmação do depósito
                balanceAccount.text = ("Saldo em conta de R$ \(userBank.balance)")// Atualiza a label com o novo saldo
            }
        }
    }
    
    @IBAction func buttonDep(_ sender: Any) {
        if !checkEmptyFields() {
            if let convertText = convertStringToInt(text: depositTextField.text),
               let userBank = userBank {
                let calculation = userBank.balance + convertText
                userBank.balance = calculation
                statusTextDep.text = ("Voce depositou R$\(convertText)")
                balanceAccount.text = ("Saldo em conta de R$ \(userBank.balance)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userBank = userBank {
            self.nameUser.text = ("Ola \(userBank.name)!")
            self.balanceAccount.text = ("Saldo em conta de R$ \(userBank.balance)")
        } else {
            self.nameUser.text = "--"
            self.balanceAccount.text = "--"
        }
    }
    
    private func convertStringToInt (text:String?) -> Double? {
        return Double(text ?? "")
    }
    
    private func checkEmptyFields () -> Bool {
        let fieldsEmpty : Bool = transferTextField.text == "" && depositTextField.text == ""
        if (fieldsEmpty){
            statusTextDep.text = "Favor preencher todos os campos"
        }
        return fieldsEmpty
    }
}
