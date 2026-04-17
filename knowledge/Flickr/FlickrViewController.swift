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

    // Array que armazena as fotos retornadas pela API.
    // É a "fonte da verdade" — quando muda, a CollectionView é atualizada.
    var photos: [FlickrItem] = []
    
    // Referência à CollectionView criada no Storyboard
    @IBOutlet weak var imageCollecyionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registra PhotoCell como a célula usada para o identifier "PhotoCell".
        // Necessário porque a célula foi criada por código, não no Storyboard.
        imageCollecyionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        
        // Define quem responde as perguntas: "quantas células?" e "como é cada célula?"
        imageCollecyionView.dataSource = self
        
        // Define quem controla o layout: tamanho e espaçamento das células
        imageCollecyionView.delegate = self
        
        // Inicia a busca das fotos na API
        fetchFlickrFeed()
    }
    
    func fetchFlickrFeed() {
        let urlString = "https://www.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
        
        // Tenta converter a String em uma URL válida.
        // Se a URL for inválida, sai da função sem fazer nada.
        guard let url = URL(string: urlString) else {
            return
        }
        
        // Faz a requisição HTTP em background (assíncrono),
        // sem travar a interface enquanto aguarda a resposta.
        // [weak self] evita retain cycle: a closure não segura
        // o ViewController na memória caso ele seja desalocado.
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            // Se não vieram dados ou houve erro de rede, encerra aqui
            guard let data = data, error == nil else {
                print("Erro de rede: \(String(describing: error))")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                // Converte chaves snake_case do JSON (ex: "date_taken")
                // para camelCase do Swift (ex: "dateTaken") automaticamente
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                // Tenta transformar o JSON nos dados em uma struct FlickrFeed.
                // Se o JSON não bater com a struct, cai no catch.
                let feed = try decoder.decode(FlickrFeed.self, from: data)
                
                // Toda atualização de UI deve rodar na Main Thread.
                // O dataTask roda em background, por isso o DispatchQueue.main é obrigatório.
                DispatchQueue.main.async {
                    self?.photos = feed.items              // atualiza o array de fotos
                    self?.imageCollecyionView.reloadData() // redesenha a CollectionView
                }
            }
            catch {
                // Loga o erro de parse no console para facilitar o debug
                print("Erro no parse: \(error)")
            }
        }.resume() // .resume() dispara a requisição — sem ele ela nunca começa
    }
}

// ============================================================
// Protocolo que responde as perguntas essenciais da CollectionView
// ============================================================
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

// ============================================================
// Controla o tamanho e espaçamento visual das células
// ============================================================
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
