//
//  AccountsListViewController.swift
//  knowledge
//
//  Created by Gui on 13/04/26.
//

import UIKit

class AccountsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, AccountDetailDelegate {
    
    let cellReuseIdentifier = "cell"
    var accountList: [BankAccount] = [
        BankAccount(name: "Guilherme D.", account: "4669", balance: 2000),
        BankAccount(name: "Larissa D.", account: "5889", balance: 3000)
    ]
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var statusNewAccountLabel: UILabel!
    @IBOutlet weak var idAccountTextField: UITextField!
    @IBOutlet weak var nameAccountTextField : UITextField!

    
    
    // Copiado da LIST ANIMALS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        listTableView.delegate = self
        listTableView.dataSource = self
        idAccountTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // Chama o comportamento padrão da tela antes de aparecer
        listTableView.reloadData() // Recarrega a tabela toda vez que a tela aparecer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // 1. Carrega o arquivo XIB pelo nome exato dele (geralmente o mesmo da classe)
        let viewController = AccountDetailViewController(nibName: "AccountDetailViewController", bundle: nil)
        // 2. Passa os dados
        viewController.userBankIndex = indexPath.row
        viewController.userBank = self.accountList[indexPath.row]
        // 3. FAZ O "APERTO DE MÃO" (Delegado)
        viewController.delegate = self
        // 4. Abre a tela
        self.present(viewController, animated: true)
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
    
    //aualizacao dos valores
    func didUpdateBalance(index: Int, newBalance: Double) {
        accountList[index].balance = newBalance
    }
    
    // Cria acoes necessarias para criacao de um novo usuario, if na funcao checkEmptyFields e necessario, para cheagem do campo de texto e por ser um campo opcional, no if criado 3 variaveis e senfo a ultima no tipo BankAccount, depois bankList.appende para adicionar a infomacao na variavel bankList, e por fim ListTableView.reloadData() para atualizar as infos na tabela.
    @IBAction func buttonClickedAddNewAccount(_ sender: Any) {
        if !checkEmptyFields() {
            if let nameNew = nameAccountTextField.text,
               let accountNew = idAccountTextField.text{
                let newRegistration = BankAccount(name:nameNew , account:accountNew, balance:0)
                accountList.append(newRegistration)
                listTableView.reloadData()
            }
        }
    }
    
    // fuincao para textos vazios
    private func checkEmptyFields () -> Bool {
        let fieldsEmpty : Bool = nameAccountTextField.text == "" || idAccountTextField.text == ""
        if (fieldsEmpty){
            statusNewAccountLabel.text = "Favor preencher todos os campos"
        }
        return fieldsEmpty
    }
}
