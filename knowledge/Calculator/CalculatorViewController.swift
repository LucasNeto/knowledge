//
//  CalculatorViewController.swift
//  knowledge
//
//  Created by Gui on 09/04/26.
//

import UIKit

// Classe principal da tela, herdando de UIViewController
// UITextFieldDelegate permite controlar comportamentos dos campos de texto
class CalculatorViewController: UIViewController, UITextFieldDelegate{
    
    // MARK: - IBOutlets (ligação com elementos da interface)

    // Label que exibe o resultado
    // Primeiro campo de texto
    // Segundo campo de texto
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var campoText1: UITextField!
    @IBOutlet weak var campoText2: UITextField!
    
    // Chamado quando a tela carrega
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    // MARK: - Ações dos botões
    // Closure que recebe 2 inteiros e retorna a soma
    // Passa a função como parâmetro para cálculo
    @IBAction func soma(_ sender: Any) {
        let handler: (Int,Int) -> Int = { number1, number2 in
            return number1 + number2
        }
        calculate(operationHandler: handler)
    }
    
    // Closure de subtração
    @IBAction func sub(_ sender: Any) {
        let handler: (Int,Int) -> Int = { number1, number2 in
            return number1 - number2
        }
        calculate(operationHandler: handler)
    }
    
    // Closure de multiplicação
    @IBAction func mult(_ sender: Any) {
        let handler: (Int,Int) -> Int = { number1, number2 in
            return number1 * number2
        }
        calculate(operationHandler: handler)
    }
    
    // Verifica se o segundo campo é "0" (evita divisão por zero)
    // Mostra mensagem de erro e interrompe execução
    // Closure de divisão
    
    @IBAction func divisao(_ sender: Any) {
        let divi0 : Bool = campoText2.text == "0"
        if (divi0) {
            Result.text = "Nao e possivel reliazar divisao com numero 0"
            return
        }
        
        let handler: (Int,Int) -> Int = { number1, number2 in
            return number1 / number2
        }
        calculate(operationHandler: handler)
    }
    // Closure passada diretamente como parâmetro (forma mais moderna)
    // forma mais simplificada de fazer do mesmo jeito
    @IBAction func resto(_ sender: Any) {
        let divi0 : Bool = campoText2.text == "0"
        if (divi0){
            Result.text = "Nao e possivel reliazar calculo com numero 0"
            return
        }
//        let handler: (Int,Int) -> Int = { number1, number2 in
//            return number1 % number2
//        }
//        calculate(operationHandler: handler)
// Criação de um tipo para representar funções que recebem 2 Int e retornam Int
        calculate { number1, number2 in
            return number1 % number2
        }
//        calculate { $0 % $1 } forma mais simplificada ainda
        
    }
    
    //funcao para calcular e retornar caso o campo de texto nao esteja com preenchido com numeros
    typealias TipoFuncao = (Int,Int)->Int
    // Verifica se os campos estão vazios
    // interrompe se estiver vazio
    // Código não utilizado (pode ser removido futuramente)
    // Converte os textos para Int de forma segura
    // Executa a função recebida (soma, sub, mult, etc.)
    
    private func calculate(operationHandler: TipoFuncao) {
        guard !checkEmptyFields() else {
            return
        }
        guard let field1 = convertStringToInt(text: campoText1.text),
              let field2 = convertStringToInt(text: campoText2.text) else{
            Result.text = "Prencher todos os campos com Numero"
            return
        }
        Result.text = "Seu resultado e \(operationHandler(field1,field2))"
    }
    
    // funcao feita para checar se o campo esta preenchdio ou nao
    // Verifica se algum campo está vazio
    // Exibe mensagem de erro
    // retorna true se estiver vazio
    
    private func checkEmptyFields () -> Bool {
        let fieldsEmpty : Bool = campoText1.text == "" || campoText2.text == ""
        if (fieldsEmpty){
            Result.text = "Favor preencher todos os campos"
        }
        return fieldsEmpty
    }
    
    // funcao para converter texto opcional e Inteiro opcional
    // -> (Defini o retorno)
    // return dentro de uma funcao, so ira me retornar de acordo com o tipo declarado, exemplo String, Int, caso eu nao tenha declarado o tipo a receber posso retornar vazio, ou seja apenas return
    // Posso criar um tipo, exemplo, TipoFuncao
    
    // Se text for nil, usa "" e tenta converter para Int
    // Se não for número válido, retorna nil
    private func convertStringToInt (text:String?) -> Int? {
        return Int(text ?? "")
    }
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
