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
        
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional1: String? = campoText1.text
        
        var campoDeTextoUmEmString1 : String
        
        if campoDeTextoUmEmStringOpcional1 != nil {
            campoDeTextoUmEmString1 = campoDeTextoUmEmStringOpcional1!
        } else {
            campoDeTextoUmEmString1 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional1 : Int? = Int(campoDeTextoUmEmString1)
        var numberCampoText1: Int
        
        if campoDeTextoUmEmNumeroOpcional1 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText1 = campoDeTextoUmEmNumeroOpcional1!
        }
        
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional2: String? = campoText2.text
        
        var campoDeTextoUmEmString2 : String
        
        if campoDeTextoUmEmStringOpcional2 != nil {
            campoDeTextoUmEmString2 = campoDeTextoUmEmStringOpcional2!
        } else {
            campoDeTextoUmEmString2 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional2 : Int? = Int(campoDeTextoUmEmString2)
        var numberCampoText2: Int
        
        if campoDeTextoUmEmNumeroOpcional2 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText2 = campoDeTextoUmEmNumeroOpcional2!
        }
        
        let resultsoma = numberCampoText1 + numberCampoText2
        Result.text = "Seu resultado e \(resultsoma)"
    }
    
    
    @IBAction func sub(_ sender: Any) {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
            return
        }
        
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional1: String? = campoText1.text
        
        var campoDeTextoUmEmString1 : String
        
        if campoDeTextoUmEmStringOpcional1 != nil {
            campoDeTextoUmEmString1 = campoDeTextoUmEmStringOpcional1!
        } else {
            campoDeTextoUmEmString1 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional1 : Int? = Int(campoDeTextoUmEmString1)
        var numberCampoText1: Int
        
        if campoDeTextoUmEmNumeroOpcional1 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText1 = campoDeTextoUmEmNumeroOpcional1!
        }
        
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional2: String? = campoText2.text
        
        var campoDeTextoUmEmString2 : String
        
        if campoDeTextoUmEmStringOpcional2 != nil {
            campoDeTextoUmEmString2 = campoDeTextoUmEmStringOpcional2!
        } else {
            campoDeTextoUmEmString2 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional2 : Int? = Int(campoDeTextoUmEmString2)
        var numberCampoText2: Int
        
        if campoDeTextoUmEmNumeroOpcional2 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText2 = campoDeTextoUmEmNumeroOpcional2!
        }
        
        let resultsub = numberCampoText1 - numberCampoText2
        Result.text = "Seu resultado e \(resultsub)"
    }
    
    @IBAction func mult(_ sender: Any) {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
            return
        }
        
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional1: String? = campoText1.text
        
        var campoDeTextoUmEmString1 : String
        
        if campoDeTextoUmEmStringOpcional1 != nil {
            campoDeTextoUmEmString1 = campoDeTextoUmEmStringOpcional1!
        } else {
            campoDeTextoUmEmString1 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional1 : Int? = Int(campoDeTextoUmEmString1)
        var numberCampoText1: Int
        
        if campoDeTextoUmEmNumeroOpcional1 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText1 = campoDeTextoUmEmNumeroOpcional1!
        }
        
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional2: String? = campoText2.text
        
        var campoDeTextoUmEmString2 : String
        
        if campoDeTextoUmEmStringOpcional2 != nil {
            campoDeTextoUmEmString2 = campoDeTextoUmEmStringOpcional2!
        } else {
            campoDeTextoUmEmString2 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional2 : Int? = Int(campoDeTextoUmEmString2)
        var numberCampoText2: Int
        
        if campoDeTextoUmEmNumeroOpcional2 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText2 = campoDeTextoUmEmNumeroOpcional2!
        }
        
        let resultmult = numberCampoText1 * numberCampoText2
        Result.text = "Seu resultado e \(resultmult)"
    }
    
    @IBAction func divisao(_ sender: Any) {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
            return
        }
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional1: String? = campoText1.text
        
        var campoDeTextoUmEmString1 : String
        
        if campoDeTextoUmEmStringOpcional1 != nil {
            campoDeTextoUmEmString1 = campoDeTextoUmEmStringOpcional1!
        } else {
            campoDeTextoUmEmString1 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional1 : Int? = Int(campoDeTextoUmEmString1)
        var numberCampoText1: Int
        
        if campoDeTextoUmEmNumeroOpcional1 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText1 = campoDeTextoUmEmNumeroOpcional1!
        }
        
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional2: String? = campoText2.text
        
        var campoDeTextoUmEmString2 : String
        
        if campoDeTextoUmEmStringOpcional2 != nil {
            campoDeTextoUmEmString2 = campoDeTextoUmEmStringOpcional2!
        } else {
            campoDeTextoUmEmString2 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional2 : Int? = Int(campoDeTextoUmEmString2)
        var numberCampoText2: Int
        
        if campoDeTextoUmEmNumeroOpcional2 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText2 = campoDeTextoUmEmNumeroOpcional2!
        }
        
        let resultDivisao = numberCampoText1 / numberCampoText2
        Result.text = "Seu resultado e \(resultDivisao)"
    }
    
    @IBAction func resto(_ sender: Any) {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
            return
        }
        
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional1: String? = campoText1.text
        
        var campoDeTextoUmEmString1 : String
        
        if campoDeTextoUmEmStringOpcional1 != nil {
            campoDeTextoUmEmString1 = campoDeTextoUmEmStringOpcional1!
        } else {
            campoDeTextoUmEmString1 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional1 : Int? = Int(campoDeTextoUmEmString1)
        var numberCampoText1: Int
        
        if campoDeTextoUmEmNumeroOpcional1 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText1 = campoDeTextoUmEmNumeroOpcional1!
        }
        
        //Torna String Opcional em Obrigatorio
        let campoDeTextoUmEmStringOpcional2: String? = campoText2.text
        
        var campoDeTextoUmEmString2 : String
        
        if campoDeTextoUmEmStringOpcional2 != nil {
            campoDeTextoUmEmString2 = campoDeTextoUmEmStringOpcional2!
        } else {
            campoDeTextoUmEmString2 = ""
        }
        
        // Tranforma String em Num Opcional
        let campoDeTextoUmEmNumeroOpcional2 : Int? = Int(campoDeTextoUmEmString2)
        var numberCampoText2: Int
        
        if campoDeTextoUmEmNumeroOpcional2 == nil{
            Result.text = "Prencher todos os campos com Numero"
            return
        } else {
            numberCampoText2 = campoDeTextoUmEmNumeroOpcional2!
        }
        let resultResto = numberCampoText1 % numberCampoText2
        Result.text = "Seu resultado e \(resultResto)"
    }
}
