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
        
        
        yearsOld = 27
        
        print ("Ola meu nome e \(name), tenho \(yearsOld) e tenho \(height)cm de altura")

    }
    
    
}
