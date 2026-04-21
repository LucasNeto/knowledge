//
//  KnowledgeViewController.swift
//  knowledge
//
//  Created by Gui on 02/04/26.
//

import UIKit

class KnowledgeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let knowledgeList: [KnowledgeItem] = [
        KnowledgeItem(title: "Animais", viewController: ListAnimalsViewController.self),
        KnowledgeItem(title: "Variables", viewController: VariablesViewController.self),
        KnowledgeItem(title: "If Else", viewController: IfelseViewController.self),
        KnowledgeItem(title: "Calculator", viewController: CalculatorViewController.self),
        KnowledgeItem(title: "Comparison", viewController: ComparisonViewController.self),
        KnowledgeItem(title: "Bank List", viewController: AccountsListViewController.self),
        KnowledgeItem(title: "Flickr Image", viewController: FlickrViewController.self),
        KnowledgeItem(title: "Life Cycle ViewController", viewController: LifeCycleViewController.self)
    ]
    
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
        return self.knowledgeList.count        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        if let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier){
            cell.textLabel?.text = self.knowledgeList[indexPath.row].title
            cell.imageView?.image = UIImage(named: "search")
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        let viewController = self.knowledgeList[indexPath.row].viewController.init()
        self.present(viewController,animated: true)
    }
}
