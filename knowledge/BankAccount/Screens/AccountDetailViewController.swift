//
//  AccountDetailViewController.swift
//  knowledge
//
//  Created by Gui on 13/04/26.
//

import UIKit

// Define o que deve acontecer quando o saldo mudar
protocol AccountDetailDelegate: AnyObject {
    func didUpdateBalance(index: Int, newBalance: Double)
}

class AccountDetailViewController: UIViewController, UITextFieldDelegate {
    
    var userBank: BankAccount?
    var userBankIndex: Int?
    weak var delegate: AccountDetailDelegate?
    
    @IBOutlet weak var statusTextDepLabel: UILabel!
    @IBOutlet weak var statusTextWithdrawalLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var balanceAccountLabel: UILabel!
    @IBOutlet weak var withdrawalTextField: UITextField!
    @IBOutlet weak var depositTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userBank = userBank {
            self.nameUserLabel.text = ("Ola \(userBank.name)!")
            self.balanceAccountLabel.text = ("Saldo em conta de R$ \(userBank.balance)")
        } else {
            self.nameUserLabel.text = "--"
            self.balanceAccountLabel.text = "--"
        }
    }
    
    @IBAction func buttonClickedWithdrawal(_ sender: Any) {
        // Verifica se o campo está preenchido antes de continuar
        if !checkEmptyFields() {
            if let withdrawValue = convertStringToDouble(text: withdrawalTextField.text), // Desembrulha o texto do campo convertendo para Double e o userBank garantindo que não é nil
               var userBank = userBank {
                let calculation = userBank.balance - withdrawValue // Calcula o novo saldo somando o valor depositado
                if let index = userBankIndex {
                    delegate?.didUpdateBalance(index: index, newBalance: calculation)
                }
                userBank.balance = calculation  // Atualiza o balance no objeto userBank
                statusTextWithdrawalLabel.text = ("Voce sacou R$\(withdrawValue)")// Mostra mensagem de confirmação do depósito
                balanceAccountLabel.text = ("Saldo em conta de R$ \(userBank.balance)")// Atualiza a label com o novo saldo
            }
        }
    }
    
    @IBAction func buttonClickedDep(_ sender: Any) {
        if !checkEmptyFields() {
            if let depositAmount = convertStringToDouble(text: depositTextField.text),
               var userBank = userBank {
                let calculation = userBank.balance + depositAmount
                if let index = userBankIndex {
                    delegate?.didUpdateBalance(index: index, newBalance: calculation)
                }
                userBank.balance = calculation
                statusTextDepLabel.text = ("Voce depositou R$\(depositAmount)")
                balanceAccountLabel.text = ("Saldo em conta de R$ \(userBank.balance)")
            }
        }
    }

    private func convertStringToDouble (text:String?) -> Double? {
        return Double(text ?? "")
    }
    
    private func checkEmptyFields () -> Bool {
        let fieldsEmpty : Bool = withdrawalTextField.text == "" && depositTextField.text == ""
        if (fieldsEmpty){
            statusTextDepLabel.text = "Favor preencher todos os campos"
        }
        return fieldsEmpty
    }
}
