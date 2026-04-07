//
//  IfelseViewController.swift
//  knowledge
//
//  Created by Gui on 06/04/26.
//

import UIKit

class IfelseViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var compareTextField1: UITextField!
    @IBOutlet weak var compareTextField2: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func compareButtonClicked(_ sender: Any) {
        if(compareTextField1.text == "" || compareTextField2.text == "" ){
            resultLabel.text = "Favor preencher todos os campos"
        } else if (compareTextField1.text == compareTextField2.text){
            resultLabel.text = "Sao iguais"
        } else {
            resultLabel.text = "Sao diferentes"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
