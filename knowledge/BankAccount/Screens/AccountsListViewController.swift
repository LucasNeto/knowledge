//
//  BankAccountViewController.swift
//  knowledge
//
//  Created by Gui on 13/04/26.
//

import UIKit

class AccountsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    let cellReuseIdentifier = "cell"
    var accountList: [BankAccount] = [
        BankAccount(name: "Guilherme D.", account: "4669", balance: 2000),
        BankAccount(name: "Larissa D.", account: "5889", balance: 3000)
    ]
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var statusNewAccount: UILabel!
    @IBOutlet weak var newAccountTextField: UITextField!
    @IBOutlet weak var nameNewAccountTextField: UITextField!
    
    // Cria acoes necessarias para criacao de um novo usuario, if na funcao checkEmptyFields e necessario, para cheagem do campo de texto e por ser um campo opcional, no if criado 3 variaveis e senfo a ultima no tipo BankAccount, depois bankList.appende para adicionar a infomacao na variavel bankList, e por fim ListTableView.reloadData() para atualizar as infos na tabela.
    @IBAction func buttonAddNewAccount(_ sender: Any) {
        if !checkEmptyFields() {
            if let nameNew = nameNewAccountTextField.text,
               let accountNew = newAccountTextField.text{
                let newRegistration = BankAccount(name:nameNew , account:accountNew, balance:0)
                accountList.append(newRegistration)
                listTableView.reloadData()
            }
        }
    }
    
    // Copiado da LIST ANIMALS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        listTableView.delegate = self
        listTableView.dataSource = self
        newAccountTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // Chama o comportamento padrão da tela antes de aparecer
        listTableView.reloadData() // Recarrega a tabela toda vez que a tela aparecer
    }

    // COPIADO DA List Animals
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        let viewController = AccountDetailViewController()
        viewController.userBank = self.accountList[indexPath.row]
        self.present(viewController,animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accountList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. Use o 'tableView' que o próprio método fornece (ou ListTableView)
        // 2. Use dequeueReusableCell(withIdentifier:for:) que é o padrão moderno
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        // Como bankList é um dicionário, pegamos as chaves para listar os nomes
        let bank = accountList[indexPath.row] // pega o objeto correto
         cell.textLabel?.text = bank.name   // usa a propriedade
        
        return cell
    }
    
    // fuincao para textos vazios
    private func checkEmptyFields () -> Bool {
        let fieldsEmpty : Bool = nameNewAccountTextField.text == "" || newAccountTextField.text == ""
        if (fieldsEmpty){
            statusNewAccount.text = "Favor preencher todos os campos"
        }
        return fieldsEmpty
    }
}
