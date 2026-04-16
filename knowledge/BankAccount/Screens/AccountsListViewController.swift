//
//  AccountsListViewController.swift
//  knowledge
//
//  Created by Gui on 13/04/26.
//

import UIKit

class AccountsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, AccountDetailDelegate {
    
    let cellReuseIdentifier = "cell"   // Identificador reutilizável da célula da tabela
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var statusNewAccountLabel: UILabel!
    @IBOutlet weak var idAccountTextField: UITextField!
    @IBOutlet weak var nameAccountTextField: UITextField!
    
    // Repositório único compartilhado com a AccountDetailViewController
    let repository: BankAccountRepository = BankAccountRepository()

    // Configura a tabela e os delegates ao carregar a tela pela primeira vez
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        listTableView.delegate = self
        listTableView.dataSource = self
        idAccountTextField.delegate = self
    }
    
    // Recarrega a tabela toda vez que a tela aparecer para refletir alterações de saldo
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listTableView.reloadData()
    }
    
    // Abre a tela de detalhes ao selecionar uma conta na lista
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = AccountDetailViewController(nibName: "AccountDetailViewController", bundle: nil)
        repository.indexSelected = indexPath.row   // Informa ao repositório qual conta foi selecionada
        viewController.repository = repository     // Compartilha o repositório com a próxima tela
        viewController.delegate = self             // Registra o delegate para receber atualizações
        self.present(viewController, animated: true)
    }
    
    // Retorna o número total de contas na lista
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repository.accountList.count
    }
    
    // Configura cada célula da tabela com o nome da conta
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let bank = repository.accountList[indexPath.row]
        cell.textLabel?.text = bank.name
        return cell
    }
    
    // Implementação do protocolo — atualiza o saldo da conta no repositório
    func didUpdateBalance(index: Int, newBalance: Double) {
        repository.accountList[index].balance = newBalance
    }
    
    // Adiciona uma nova conta chamando o repositório e atualiza a tabela
    @IBAction func buttonClickedAddNewAccount(_ sender: Any) {
        repository.addAccount(name: nameAccountTextField.text) { result in
            switch result {
            case .success(let message):
                self.statusNewAccountLabel.text = message
                self.listTableView.reloadData()   // Atualiza a tabela com a nova conta
            case .failure(let error):
                self.statusNewAccountLabel.text = error.domain  // Exibe mensagem de erro
            }
        }
    }
}
