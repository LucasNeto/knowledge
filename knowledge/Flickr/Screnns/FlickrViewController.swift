//
//  FlickrViewController.swift
//  knowledge
//
//  Created by Gui on 17/04/26.
//
// FlickrViewController.swift

import UIKit

// ViewController responsável por exibir fotos do Flickr em uma grade
class FlickrViewController: UIViewController {
    
    let repository = FlickrRepository()
    
    // Array que armazena as fotos retornadas pela API.
    // É a "fonte da verdade" — quando muda, a CollectionView é atualizada.
    var photos: [FlickrItem] = []
    
    // Referência à CollectionView criada no Storyboard
    @IBOutlet weak var imageCollecyionView: UICollectionView!
    // Feito a barra de pesquisa
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registra PhotoCell como a célula usada para o identifier "PhotoCell".
        // Necessário porque a célula foi criada por código, não no Storyboard.
        imageCollecyionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        
        // Define quem responde as perguntas: "quantas células?" e "quanto é cada célula?"
        // CORREÇÃO: adicionado "= self" — sem isso a linha só lê o valor atual, não atribui nada
        imageCollecyionView.dataSource = self
        
        // Define quem controla o layout: tamanho e espaçamento das células
        // CORREÇÃO: adicionado "= self" — mesmo motivo acima
        imageCollecyionView.delegate = self
        
        // Define o delegate da searchBar para capturar o botão de busca
        // CORREÇÃO: adicionado "= self" — mesmo motivo acima
        searchBar.delegate = self
        
        // Inicia a busca das fotos na API
        fetchFlickrFeed()
    }
    
    func fetchFlickrFeed() {
        repository.fetchPhotos(searchText: searchBar.text) { [weak self] items in
            DispatchQueue.main.async {
                self?.photos = items
                self?.imageCollecyionView.reloadData()
            }
        }
    }
}

// Captura o botão de busca do teclado na SearchBar
extension FlickrViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // esconde o teclado
        fetchFlickrFeed()                // busca com o novo termo
    }
}

// Protocolo que responde as perguntas essenciais da CollectionView
extension FlickrViewController: UICollectionViewDataSource {
    
    // Pergunta 1: quantas células existem?
    // Retorna o número de fotos carregadas da API
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    // Pergunta 2: como é a célula na posição X?
    // Chamado para cada célula que entra na área visível da tela
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Reutiliza uma célula que saiu da tela ao invés de criar uma nova.
        // O cast "as! PhotoCell" converte para nossa classe personalizada.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        // Limpa a imagem da célula reutilizada.
        // Sem isso, ao rolar a lista, a imagem anterior aparece
        // brevemente antes da nova terminar de carregar.
        cell.imageView.image = nil
        
        // Pega o item do array correspondente a esta posição
        let photo = photos[indexPath.item]
        
        // Se a foto tiver URL válida, inicia o download da imagem
        if let urlPath = photo.imageURL {
            loadImage(from: urlPath, into: cell.imageView)
        }
        return cell
    }
    
    // Baixa uma imagem de uma URL e aplica em uma ImageView.
    // Roda em background para não travar a UI durante o download.
    func loadImage(from urlString: String, into imageView: UIImageView) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            // Verifica se vieram dados e se formam uma imagem válida
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image // aplica a imagem na Main Thread
                }
            }
        }.resume()
    }
}

// Controla o tamanho e espaçamento visual das células
extension FlickrViewController: UICollectionViewDelegateFlowLayout {
    
    // Define o tamanho de cada célula.
    // Divide a largura total em 2 colunas, subtraindo 12pt de espaço
    // (4pt entre as colunas + margens laterais)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.bounds.width - 12) / 2
        return CGSize(width: side, height: side) // célula quadrada
    }
    
    // Espaço horizontal mínimo entre células na mesma linha
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    // Espaço vertical mínimo entre linhas diferentes
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
