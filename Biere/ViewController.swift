//
//  ViewController.swift
//  Biere
//
//  Created by ademir on 09/11/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var context : NSManagedObjectContext!
    
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
        
        if txtSenha.text?.isEmpty==false {
            
            let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "UsuarioCD")
            
            let predicado = NSPredicate(format: "usuario == %@", txtUsuario.text!)
            
            requisicao.predicate = predicado
            
            do {
                let usuario =  try context.fetch(requisicao)
                if usuario.count==0 {
                    alertas(mensagem: "Usuario não cadastrado!", titulo: "Login")
                }else{
                    let usu = usuario as! [NSManagedObject]
                    if !(txtSenha.text!.contains(usu[0].value(forKey:"senha") as! String)){
                        alertas(mensagem: "Senha inválida!", titulo: "Login")
                    }
                }
            } catch let erro {
                alertas(mensagem: erro.localizedDescription, titulo: "Erro no Login")
            }
            
            /*if segue.identifier == "login"{
                btndesabilitado = true
                let viewControlerDestinoAdic = segue.destination as! DetalheCervejaViewController
                viewControlerDestinoAdic.btndesabilitado = btndesabilitado
                
            }*/
                        
        }
        
    }
    
    
    @IBAction func btnCadastrar(_ sender: Any) {
        
        if txtUsuario.text?.isEmpty==true {
            
            alertas(mensagem: mensUsuarioEmpty,titulo: "Validação de Cadastro")
            
        }else{
            if txtSenha.text?.isEmpty==true {
                
                alertas(mensagem: mensSenhaEmpty, titulo: "Validação de Cadastro")
            }else{
                SalvarCadastro(login: txtUsuario.text!,senha: txtSenha.text!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
                
    }
    
    func SalvarCadastro(login: String, senha: String){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "UsuarioCD")
        
        let predicado = NSPredicate(format: "usuario == %@", login)
        
        requisicao.predicate = predicado
        
        do {
            let usuario =  try context.fetch(requisicao)
            if usuario.count>0 {
                alertas(mensagem: "Usuario já cadastrado", titulo: "Cadastro")
            }else{
                let insUsuario = NSEntityDescription.insertNewObject(forEntityName: "UsuarioCD", into: context)
                
                insUsuario.setValue(login, forKey: "usuario")
                insUsuario.setValue(senha, forKey: "senha")
                
                do {
                    try context.save()
                    alertas(mensagem: "Usuário cadastrado com sucesso!", titulo: "Cadastro")
                } catch let erroIns {
                    alertas(mensagem: erroIns.localizedDescription, titulo: "Erro no Cadastro")
                }
            }
        } catch let erro {
            alertas(mensagem: erro.localizedDescription, titulo: "Erro no Cadastro")
        }
    }


}

