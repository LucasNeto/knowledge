//
//  ComparisonViewController.swift
//  knowledge
//
//  Created by Gui on 10/04/26.
//

import UIKit

class ComparisonViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let comp = ["==", ">", "<", "!=", ">=", "<="] // Lista Comparacao
    
    //Funcao que define quantas colunas (Chamados - Componentes)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // funcao que determina a altura Height
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    // funcao que me retorna a quantade de acordo com a variavel por isso no final .count
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return comp.count
    }
    // -> Retornando esse tipo de dado
    
    // func determina o texto que aparece em cada linha d
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return comp[row]
    }

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var campoText1: UITextField!
    @IBOutlet weak var CampoText2: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func botaoComp(_ sender: Any) {
        let MensagemPrencherCampo : Bool = campoText1.text == "" || CampoText2.text == ""
        if (MensagemPrencherCampo){
            resultLabel.text = "Favor preencher todos os campos"
            return
        }
        
        // correcao com ajuda                                      Componente 0 (Caso eu tivesse outros componentes comom DD/MM/AA                                                          poderia ser 3 componente [0,1,2]
        let comparacaoSelecionada = comp[pickerView.selectedRow(inComponent: 0)] // criado uma variavel para o opcao selecionada no pickerView

        let valorInserido1 = campoText1.text! // Cirado variavel para preenchido no campo de texto, forcando com ! PQ O CAMPO E OPICIONAL
        let valorInserido2 = CampoText2.text! // Cirado variavel para preenchido no campo de texto
        
        // IF criado para as possibilidades selecionadas:
        if comparacaoSelecionada == "==" {
            let resultLabel01: Bool = valorInserido1 == valorInserido2 // variavel criada para opcao, agora replicar para os demais
            resultLabel.text = String (resultLabel01) // ERRO no texto, necessasrio transformar a informacao Bool em  String,                       assim : String (VARIAVEL)
        } else if comparacaoSelecionada == ">" {
            let resultLabel01 = valorInserido1 > valorInserido2
            resultLabel.text = String(resultLabel01)
        } else if comparacaoSelecionada == "<" {
            let resultLabel01 = valorInserido1 < valorInserido2
            resultLabel.text = String(resultLabel01)
        }  else if comparacaoSelecionada == "!=" {
            let resultLabel01 = valorInserido1 != valorInserido2
            resultLabel.text = String(resultLabel01)
        }  else if comparacaoSelecionada == ">=" {
            let resultLabel01 = valorInserido1 >= valorInserido2
            resultLabel.text = String(resultLabel01)
        }  else if comparacaoSelecionada == "<=" {
            let resultLabel01 = valorInserido1 <= valorInserido2
            resultLabel.text = String(resultLabel01)
        } else {
            resultLabel.text = "Nao e possivel comparar" //Seguranca para nao dar erro, como nao tem mais nada apos a func, nao necessita do return
        }
    }

    override func viewDidLoad(){
        super.viewDidLoad()
    }
}
