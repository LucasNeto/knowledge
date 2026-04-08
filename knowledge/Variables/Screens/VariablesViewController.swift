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
        let name :String = "Guilherme"
        var yearsOld: Int = 26
        let height: Double = 1.72
        
        print ("Ola meu nome e \(name), tenho \(yearsOld) e tenho \(height)cm de altura")
        
        yearsOld = 27 // Pode ser alterada de acordo com a posicao
        
        print ("Ola meu nome e \(name), tenho \(yearsOld) e tenho \(height)cm de altura")
        
        // Para chamar a classe USER basta colocar os dois pontos apos nomear a variavel, para puxar a estrutura = e User novamnete com () para preencher a infomacoes *********refazer
       
        // quando colocamos 2 pontos, falamos que tipo vai ser aquela variavel
        // para chamar qualquer classe, colocamos o nome dela e depois abrimos e fechamos parentezses, exemplo Tela()
        
        let user1 : User =
        User(name: "Lucas", yearsOld: 30, cellNumber: "11 9877777", email: "lucas@gmail.com", adress: "Rua dos baianos 01", maried: false)
        
        let users: [User] = [
            User(name: "Gabreil", yearsOld: 24, cellNumber: "11 99888822", email: "gabreildoria@gmail.com", adress: "R gabreildoria 13", maried: true),
            User(name: "Gustavo", yearsOld: 21, cellNumber: "11 9998877", email: "gustavodoria@gmail.com", adress: "Rua gustavo 01", maried: false),
            User(name: "Guilherme Doria", yearsOld: 26, cellNumber: "11 9987182111", email: "guilhermedsantos@gmail,.com", adress: "Rua Joao Gomes 12", maried: true)
        ]
        
        print("nome usuario1 \(user1.name)")
        print("nome do segundo da lista \(users[1].name)")
    }
}
