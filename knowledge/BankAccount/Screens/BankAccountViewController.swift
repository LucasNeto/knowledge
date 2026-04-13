//
//  BankAccountViewController.swift
//  knowledge
//
//  Created by Gui on 13/04/26.
//

import UIKit

class BankAccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    var bankList: [Listbank1] = [
        Listbank1(name: "Guilherme D.", account: "4669", balance: 2000),
        Listbank1(name: "Larissa D.", account: "5889", balance: 3000)
    ]
    
    @IBOutlet weak var statusNewAccount: UILabel!
    
    @IBOutlet weak var nameNewAccount: UITextField!
    @IBOutlet weak var newAccount: UITextField!
    
    
    @IBAction func buttonAddNewAccount(_ sender: Any) {
        checkEmptyFields()
    }
    
    @IBOutlet weak var ListTableView: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    
    // Copiado da LIST ANIMALS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register the table view cell class and its reuse id
        self.ListTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        ListTableView.delegate = self
        ListTableView.dataSource = self
        
        // Configurar o textfield para capturar o "Enter"
        newAccount.delegate = self
    }
    
    
    // method to run when table view cell is tapped ----- COPIADO DA List Animals
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        let viewController = UserBankViewController()
        viewController.userBank = self.bankList[indexPath.row]
        self.present(viewController,animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bankList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. Use o 'tableView' que o próprio método fornece (ou ListTableView)
        // 2. Use dequeueReusableCell(withIdentifier:for:) que é o padrão moderno
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        // Como bankList é um dicionário, pegamos as chaves para listar os nomes
        let bank = bankList[indexPath.row] // pega o objeto correto
         cell.textLabel?.text = bank.name   // usa a propriedade
        
        return cell
    }
    
    
    private func checkEmptyFields () -> Bool {
        let fieldsEmpty : Bool = nameNewAccount.text == "" || newAccount.text == ""
        if (fieldsEmpty){
            statusNewAccount.text = "Favor preencher todos os campos"
        }
        return fieldsEmpty
    }
    private func addNew () {
        
    }
    
}

