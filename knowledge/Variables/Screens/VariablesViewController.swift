//
//  variaveisViewController.swift
//  knowledge
//
//  Created by Gui on 08/04/26.
//

import UIKit

class VariablesViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // Ex:
        
        
        // tipos : Sting, Number (Float e Double)
        let name :String = "Guilherme"
        var yearsOld: Int = 26
        let height: Double = 1.72
        
        print ("Ola meu nome e \(name), tenho \(yearsOld) e tenho \(height)cm de altura")
        
        yearsOld = 27 // Pode ser alterada de acordo com a posicao
        
        print ("Ola meu nome e \(name), tenho \(yearsOld) e tenho \(height)cm de altura")
        
        // Para chamar a classe USER basta colocar os dois pontos apos nomear a variavel, para puxar a estrutura = e User novamnete com () para preencher a infomacoes *********refazer
       
        // quando colocamos 2 pontos, falamos que tipo vai ser aquela variavel
        // para chamar qualquer classe, colocamos o nome dela e depois abrimos e fechamos parentezses, exemplo Tela()
        
        // LISTA Array
        
        
        //Objeto
        
        //Variavel tipo USER
        let user1 : User =
        User(name: "Lucas", yearsOld: 30, cellNumber: "11 9877777", email: "lucas@gmail.com", adress: "Rua dos baianos 01", maried: false)
        
        //Array (Lista) do tipo User
        let users: [User] = [
            User(name: "Gabreil", yearsOld: 24, cellNumber: "11 99888822", email: "gabreildoria@gmail.com", adress: "R gabreildoria 13", maried: true),
            User(name: "Gustavo", yearsOld: 21, cellNumber: "11 9998877", email: "gustavodoria@gmail.com", adress: "Rua gustavo 01", maried: false),
            User(name: "Guilherme Doria", yearsOld: 26, cellNumber: "11 9987182111", email: "guilhermedsantos@gmail,.com", adress: "Rua Joao Gomes 12", maried: true)
        ]
        
        print("nome usuario1 \(user1.name)")
        print("nome do segundo da lista \(users[1].name)")
        
        // Dicionario
        let armarios: Dictionary = [ 1:"Gui", 2:"Gu", 3:"Lucas", 4:"Lala", 5:"Gabs"]
        print ("Cada coladorador possui um armario, segue armario 3: \(armarios[3] ?? "") ")
        
        
        let armarios2: [Int : String ] = [
            1:"Guii",
            2:"Lucao",
            3:"Seu Jose",
            4:"Dona Maria"
        ]
        print("o armario do 3 e do \(armarios2[3] ?? "")")
        
//Outra fomra de fazer:
//        var armario: [Float : String] = [:]
//        armarios2 [1] = "Guii"
//        armarios2 [2] = "Lucao"
//        armarios2 [3] = "Seu jose"
//        armarios2 [4] = "Dona Maria"
        
    
        
        let vagas: Dictionary = ["a1":"", "b2":"HB20" , "c3":"Onix"]
        print ("O carro que esta na b2 e: \(vagas["b2"] ?? "" )")
        
        
        let vagas2: [String: String] = [
            "A1":"",
            "B2":"HB20",
            "C3":"Onix"
        ]
        print("A vaga do b2 esta ocupado com: \(vagas2["B2"] ?? "" )")
        
        if let vagab2 = vagas2["B2"] {
            print("A vaga do b2 esta ocupado com: \(vagab2)")
        } else {
            print("A vaga do b2 esta ocupado com: ")
        }
        
        print("A vaga do b2 esta ocupado com: \(vagas2["B2"] ?? "" )")
        
    }
    
//    
//    // Opcional
//    // Reotnar a quantidade de linhas na tebela, baseado na lista opcional
//        
//    var lista1: [String]? = [""]
//    var quantidadec = 0
//    
//    if (lista1 != nil) {
//        quantidadec =  lista1!.count
//    } else {
//        quantidadec =  0
//    }
//    
//    
//    if (lista1 != nil) {
//        return lista!.count
//    } else {
//        return 0
//    }
//
//    if let templist = lista1 {
//            return templist.count
//        } else {
//            return 0
//        }
//    
//        guard let templist = lista1 else {
//            return 0
//        }
//        return templist.count
//    
//            
//        return lista1?.count ?? 0
//    
//    
}







        var name: String = "Gui"
        var Number: Int = 19
        var falso: Bool = true
        var armarios: Dictionary = ["A1":"Lucas"]
        var Array: Array = [1,2]

