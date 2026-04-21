//
//  LifeCycleViewController.swift
//  knowledge
//
//  Created by Gui on 20/04/26.
//

import UIKit

class LifeCycleViewController: UIViewController {

    @IBOutlet weak var didLoadTextLabel: UILabel!
    @IBOutlet weak var willAppearTextLabel: UILabel!
    @IBOutlet weak var didAppearTextLabel: UILabel!
    @IBOutlet weak var willDisappearTextLabel: UILabel!
    @IBOutlet weak var didDisappearTextLabel: UILabel!
    
    // Carregou na memória (uma única vez dentro do ciclo)
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad: A tela carregou.")
        didLoadTextLabel.text = "Status DidLoad: A tela carregou"
    }
    // A tela aparecerá
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // Passamos o parâmetro 'animated'
        self.view.backgroundColor = .darkGray
        print("viewWillAppear: A tela está prestes a aparecer")
        willAppearTextLabel.text = "Status WillAppear: A tela está prestes a aparecer"
    }
    // Apareceu na tela
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = .green
        print("viewDidAppear: A tela já está visível para o usuário.")
        didAppearTextLabel.text = "Status DidAppear: A tela já está visível para o usuário"
    }
    // Desaparecerá da tela
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.backgroundColor = .blue
        print("viewWillDisappear: A tela vai sumir agora")
        willDisappearTextLabel.text = "Status WillDisappear: A tela vai sumir agora"
        }
    // Saiu da tela
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear: A tela saiu de cena completamente.")
        didDisappearTextLabel.text = "Status DidDisappear: A tela saiu de cena completamente"
    }
    // Saiu da memória (Destruição do objeto)
    deinit {
        // Nota: deinit não recebe parâmetros e não usa 'super' ou 'self.view'
        // pois a view e o controlador estão sendo destruídos.
        print("deinit: O controlador foi removido da memória.")
    }
}
