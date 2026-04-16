//
//  exemplos.swift
//  knowledge
//
//  Created by Gui on 16/04/26.
//

import UIKit

class exemplos: UIViewController{
    
    
//    // ============================================================
//    // GUIA RÁPIDO SWIFT — Consulta rápida de conceitos
//    // ============================================================
//    
//    
//    // MARK: - OPCIONAL (?)
//    // Variável que pode ter um valor ou ser nil (nada)
//    
//    var nome: String? = "Guilherme"   // tem valor
//    var sobrenome: String? = nil      // não tem valor
//    
//    
//    // ============================================================
//    // MARK: - IF LET
//    // Desembrulha um opcional com segurança
//    // Use quando quiser executar algo SE o valor existir
//    
//    if let nomeDesembrulhado = nome {
//        print("Nome é \(nomeDesembrulhado)") // entra aqui se nome não for nil
//    } else {
//        print("Nome não existe")             // entra aqui se nome for nil
//    }
//        
//        // Desembrulhando mais de um opcional junto (separados por vírgula)
//        if let nome = nome,
//               let sobrenome = sobrenome {
//                   print("\(nome) \(sobrenome)")        // só entra se AMBOS tiverem valor
//               }
//            
//            
//            // ============================================================
//            // MARK: - GUARD LET
//            // Desembrulha um opcional com segurança
//            // Use quando quiser SAIR CEDO se o valor não existir
//            // Deixa o código mais limpo evitando vários ifs aninhados
//            
//            func exibirNome(nome: String?) {
//                guard let nomeDesembrulhado = nome else {
//                    print("Nome não existe, saindo...")
//                    return  // sai da função se nome for nil
//                }
//                // aqui nomeDesembrulhado está disponível e garantido
//                print("Nome é \(nomeDesembrulhado)")
//            }
//            
//            
//            // ============================================================
//            // MARK: - DIFERENÇA ENTRE IF LET E GUARD LET
//            
//            // IF LET → o valor desembrulhado só existe DENTRO do bloco {}
//            if let nome = nome {
//                print(nome) // nome disponível apenas aqui dentro
//            }
//                
//                // GUARD LET → o valor desembrulhado fica disponível FORA do bloco {}
//                func exemplo(nome: String?) {
//                    guard let nome = nome else { return }
//                    print(nome) // nome disponível em todo o resto da função
//                }
//                
//                
//                // ============================================================
//                // MARK: - ?? (NIL COALESCING)
//                // Se o valor for nil, usa um valor padrão
//                
//                let nomeExibido = nome ?? "Sem nome"   // se nome for nil, usa "Sem nome"
//                let saldo: Double? = nil
//                let saldoExibido = saldo ?? 0.0        // se saldo for nil, usa 0.0
//                
//                
//                // ============================================================
//                // MARK: - ! (FORCE UNWRAP)
//                // Força o desembrulho do opcional
//                // CUIDADO: se o valor for nil, o app crasha
//                
//                let nomeForçado = nome!   // use APENAS quando tiver certeza que não é nil
//                
//                
//                // ============================================================
//                // MARK: - STRUCT VS CLASS
//                
//                // STRUCT → copia o valor (cada variável tem sua própria cópia)
//                struct Produto {
//                    var preco: Double
//                }
//                var produto1 = Produto(preco: 100)
//                var produto2 = produto1       // produto2 é uma CÓPIA independente
//                produto2.preco = 999
//                // produto1.preco ainda é 100!
//                
//                // CLASS → compartilha a referência (apontam para o mesmo objeto)
//                class Carro {
//                    var preco: Double
//                    init(preco: Double) { self.preco = preco }
//                }
//                var carro1 = Carro(preco: 100)
//                var carro2 = carro1           // carro2 aponta para o MESMO objeto
//                carro2.preco = 999
//                // carro1.preco agora é 999!
//                
//                
//                // ============================================================
//                // MARK: - CLOSURE / COMPLETION
//                // Bloco de código passado como parâmetro, executado depois
//                // Muito usado para retornar resultados de funções
//                
//                func buscarDados(completion: (String) -> Void) {
//                    let resultado = "Dados encontrados"
//                    completion(resultado)   // executa o bloco passado
//                }
//                
//                buscarDados { resultado in
//                    print(resultado)        // "Dados encontrados"
//                }
//    
//    
//    // ============================================================
//    // MARK: - RESULT (SUCCESS / FAILURE)
//    // Retorna sucesso ou falha de forma organizada
//    
//    func sacar(valor: Double, completion: (Result<String, NSError>) -> Void) {
//        if valor > 0 {
//            completion(.success("Saque realizado"))
//        } else {
//            completion(.failure(NSError(domain: "Valor inválido", code: -1)))
//        }
//    }
//    
//    sacar(valor: 100) { result in
//        switch result {
//        case .success(let mensagem):
//            print(mensagem)         // "Saque realizado"
//        case .failure(let erro):
//            print(erro.domain)      // "Valor inválido"
//        }
//    }
//    
//    
//    // ============================================================
//    // MARK: - PROTOCOL
//    // Contrato que define quais funções uma classe deve implementar
//    
//    protocol Autenticavel {
//        func verificarSenha(senha: String) -> Bool   // quem assinar deve implementar isso
//    }
//    
//    class Usuario: Autenticavel {
//        func verificarSenha(senha: String) -> Bool {
//            return senha == "1234"   // implementação do contrato
//        }
//    }
//    
//    
//    // ============================================================
//    // MARK: - WEAK VAR (REFERÊNCIA FRACA)
//    // Evita retain cycle (duas classes se segurando na memória)
//    // Sempre opcional pois o objeto pode ser liberado da memória
//    
//    class TelaA {
//        weak var delegate: Autenticavel?   // referência fraca — não segura o objeto
//    }
//    
//    
//    // ============================================================
//    // MARK: - LET VS VAR
//    // let → constante, valor não pode ser alterado
//    // var → variável, valor pode ser alterado
//    
//    let idConta = 1234      // nunca vai mudar
//    var saldoConta = 500.0  // pode mudar com saques e depósitos
//    
//    
//    // ============================================================
//    // MARK: - SELF
//    // Referência ao próprio objeto atual
//    // Usado dentro de classes e structs para acessar suas propriedades
//    
//    class ContaBancaria {
//        var saldo: Double
//        init(saldo: Double) {
//            self.saldo = saldo   // self.saldo = propriedade da classe
//            // saldo = parâmetro recebido
//        }
//    }
}
