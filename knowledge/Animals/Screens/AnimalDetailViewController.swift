import UIKit

class AnimalDetailViewController: UIViewController {
    
    @IBOutlet weak var animalLabel: UILabel!
    
    var animals: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let animals = animals {
            print("\(animals.name), \(animals.habitat), \(animals.yearsOld).")
            self.animalLabel.text = ("\(animals.name),\n\(animals.habitat),\n \(animals.yearsOld).")
            self.view.backgroundColor = animals.color
        } else {
            self.animalLabel.text = "--"
        }
    }
    
}
