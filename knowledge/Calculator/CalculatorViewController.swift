//
//  CalculatorViewController.swift
//  knowledge
//
//  Created by Gui on 09/04/26.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var campoText1: UITextField!
    @IBOutlet weak var campoText2: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }

    
    @IBAction func soma(_ sender: Any) {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
            return
        }
        let numberCampoText1: Int = Int (campoText1.text!) ?? 0
        let numberCampoText2: Int = Int(campoText2.text!) ?? 0
        let resultsoma = numberCampoText1 + numberCampoText2
        let resultText: String? = String(resultsoma)
        Result.text = resultText
        print ("Seu resultado e \(resultsoma)")
    }
    
    @IBAction func sub(_ sender: Any) {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
            return
        }
        let numberCampoText1: Int = Int(campoText1.text!) ?? 0
        let numberCampoText2: Int = Int(campoText2.text!) ?? 0
        let resultsub = numberCampoText1 - numberCampoText2
        let resultText: String? = String(resultsub)
        Result.text = resultText
        print ("Seu resultado e \(resultsub)")    }
    
    @IBAction func mult(_ sender: Any) {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
            return
        }
        let numberCampoText1: Int = Int(campoText1.text!) ?? 0
        let numberCampoText2: Int = Int(campoText2.text!) ?? 0
        let resultmult = numberCampoText1 * numberCampoText2
        let resultText: String? = String(resultmult)
        Result.text = resultText
        print ("Seu resultado e \(resultmult)")    }
    
    @IBAction func divisao(_ sender: Any) {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
            return
        }
        let numberCampoText1: Int = Int(campoText1.text!) ?? 0
        let numberCampoText2: Int = Int(campoText2.text!) ?? 0
        let resultDivisao = numberCampoText1 / numberCampoText2
        let resultText: String? = String(resultDivisao)
        Result.text = resultText
        print ("Seu resultado e \(resultDivisao)")    }
    
    @IBAction func resto(_ sender: Any) {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
            return
        }
        let numberCampoText1: Int = Int (campoText1.text!) ?? 0
        let numberCampoText2: Int = Int (campoText2.text!) ?? 0
        let resultResto = numberCampoText1 % numberCampoText2
        let resultText: String? = String(resultResto)
        Result.text = resultText
        print ("Seu resultado e \(resultResto)")    }
    
    
}
