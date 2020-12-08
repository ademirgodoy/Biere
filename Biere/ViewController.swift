//
//  ViewController.swift
//  Biere
//
//  Created by ademir on 09/11/20.
//

import UIKit

class ViewController: UIViewController {

    let mensUsuarioEmpty = "Usuário não informado!"
    
    let mensSenhaEmpty = "Senha não informada!"
    
    let mensCadastro = "Cadastro realizado com sucesso!"
    
    func alertas(mensagem: String, titulo: String){
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        let confirma = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alerta.addAction(confirma)
        
        present(alerta, animated: true, completion: nil)
    }
    
    @IBOutlet weak var txtUsuario: UITextField!
    
    @IBOutlet weak var txtSenha: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
       
        if txtUsuario.text?.isEmpty==true {
            
            alertas(mensagem: mensUsuarioEmpty,titulo: "Validação de Login")
            
        }
        
        if txtSenha.text?.isEmpty==true {
            
            alertas(mensagem: mensSenhaEmpty,titulo: "Validação de Login")
        }
        
    }
    
    
    @IBAction func btnCadastrar(_ sender: Any) {
        
        if txtUsuario.text?.isEmpty==true {
            
            alertas(mensagem: mensUsuarioEmpty,titulo: "Validação de Cadastro")
            
        }else{
            if txtSenha.text?.isEmpty==true {
                
                alertas(mensagem: mensSenhaEmpty, titulo: "Validação de Cadastro")
            }else{
                alertas(mensagem: mensCadastro, titulo: "Cadastro")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

