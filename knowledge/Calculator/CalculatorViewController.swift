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
        guard !checkEmptyFields() else {
            return
        }
        
        guard let field1 = convertStringToInt(text: campoText1.text),
              let field2 = convertStringToInt(text: campoText2.text) else{
            Result.text = "Prencher todos os campos com Numero"
            return
        }
        Result.text = "Seu resultado e \(field1 + field2)"
    }
    @IBAction func sub(_ sender: Any) {
        guard !checkEmptyFields() else {
            return
        }
        
        guard let field1 = convertStringToInt(text: campoText1.text),
              let field2 = convertStringToInt(text: campoText2.text) else{
            Result.text = "Prencher todos os campos com Numero"
            return
        }
        Result.text = "Seu resultado e \(field1 - field2)"
    }
    
    @IBAction func mult(_ sender: Any) {
        guard !checkEmptyFields() else {
            return
        }
        
        guard let field1 = convertStringToInt(text: campoText1.text),
              let field2 = convertStringToInt(text: campoText2.text) else{
            Result.text = "Prencher todos os campos com Numero"
            return
        }
        Result.text = "Seu resultado e \(field1 * field2)"
    }
    
    @IBAction func divisao(_ sender: Any) {
        guard !checkEmptyFields() else {
            return
        }
        
        guard let field1 = convertStringToInt(text: campoText1.text),
              let field2 = convertStringToInt(text: campoText2.text) else{
            Result.text = "Prencher todos os campos com Numero"
            return
        }
        Result.text = "Seu resultado e \(field1 / field2)"
    }
    
    @IBAction func resto(_ sender: Any) {
        
        guard !checkEmptyFields() else {
            return
        }
        
        guard let field1 = convertStringToInt(text: campoText1.text),
              let field2 = convertStringToInt(text: campoText2.text) else{
            Result.text = "Prencher todos os campos com Numero"
            return
        }
        Result.text = "Seu resultado e \(field1 % field2)"
    }

    
    private func checkEmptyFields () -> Bool {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
        }
        return fieldsEmpty
    }
    
    private func convertStringToInt (text:String?) -> Int? {
        return Int(text ?? "")
        
        
        //        Torna String Opcional em Obrigatorio
        //        let campoDeTextoUmEmStringOpcional1: String? = text
        //        var campoDeTextoUmEmString1 : String
        //
        //        if campoDeTextoUmEmStringOpcional1 != nil {
        //            campoDeTextoUmEmString1 = campoDeTextoUmEmStringOpcional1!
        //        } else {
        //            campoDeTextoUmEmString1 = ""
        //        }
        //
        //        // Tranforma String em Num Opcional
        //        let campoDeTextoUmEmNumeroOpcional1 : Int? = Int(campoDeTextoUmEmString1)
        //        return campoDeTextoUmEmNumeroOpcional1
        //
    }
}
