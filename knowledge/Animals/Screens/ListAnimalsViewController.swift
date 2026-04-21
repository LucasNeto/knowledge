//
//  ListAnimalsViewController.swift
//  knowledge
//
//  Created by Gui on 02/04/26.
//

import UIKit

class ListAnimalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let animals: [Animal] = [
        Animal(name: "Elefante 🐘", habitat: "Natural de Africa e Asia", yearsOld: "Vive 70 anos", color: .gray),
        Animal(name: "Pinguim 🐧", habitat: "Natural da Antartica", yearsOld: "Vive 20 anos", color: .white),
        Animal(name: "Lobo 🐺", habitat: "Natural em Floresta e Montanhas", yearsOld: "Vive 16 anos", color: .purple),
        Animal(name: "Tartaruga-Gigante 🐢", habitat: "Natural de Galapagos", yearsOld: "Vive mais de 100 anos", color: .green),
        Animal(name: "Tigre 🐅", habitat: "Natural em Florestas e Savanas da Asia", yearsOld: "Vive 20", color: .orange)
    ]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! UITableViewCell
        
        // set the text from the data model
        cell.textLabel?.text = self.animals[indexPath.row].name
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        print("You tapped cell \(self.animals[indexPath.row]).")
        let viewController = AnimalDetailViewController()
        viewController.animals = self.animals[indexPath.row]
        self.present(viewController,animated: true)
            }
}
