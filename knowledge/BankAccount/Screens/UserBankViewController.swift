//
//  UserBank.swift
//  knowledge
//
//  Created by Gui on 13/04/26.
//

import UIKit

class UserBankViewController: UIViewController, UITextFieldDelegate {
    
    var userBank: Listbank1?
    
    @IBOutlet weak var statusTextDep: UILabel!
    @IBOutlet weak var statusTextTransfer: UILabel!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var balanceAccount: UILabel!
    @IBOutlet weak var tarnsferTextField: UITextField!
    @IBOutlet weak var depositTextField: UITextField!
    
    @IBAction func buttonTransfer(_ sender: Any) {
        if !checkEmptyFields () {
            if let convertetexto = convertStringToInt(text: tarnsferTextField.text) {
                statusTextTransfer.text = ("Voce sacou R$\(tarnsferTextField.text!)")
                let calculo = userBank!.balance - convertetexto
                balanceAccount.text = ("Saldo em conta de R$ \(calculo)")
            }
        }
      
    }
    
    @IBAction func buttonDep(_ sender: Any) {
        if !checkEmptyFields () {
            if let convertetexto = convertStringToInt(text: depositTextField.text) {
                statusTextDep.text = ("Voce depositou R$\(depositTextField.text!)")
                let calculo = userBank!.balance + convertetexto
                balanceAccount.text = ("Saldo em conta de R$ \(calculo)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        if let userBank = userBank {
            self.nameUser.text = ("Ola \(userBank.name)!")
        } else {
            self.nameUser.text = "--"
        }
        if let userBank = userBank {
            self.balanceAccount.text = ("Saldo em conta de R$ \(userBank.balance)")
        } else {
            self.balanceAccount.text = "--"
        }
    }
    
    private func convertStringToInt (text:String?) -> Int? {
        return Int(text ?? "")
    }
    
    private func checkEmptyFields () -> Bool {
        let fieldsEmpty : Bool = tarnsferTextField.text == "" && depositTextField.text == ""
        if (fieldsEmpty){
            statusTextDep.text = "Favor preencher todos os campos"
        }
        return fieldsEmpty
    }
}
