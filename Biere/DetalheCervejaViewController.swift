//
//  DetalheCervejaViewController.swift
//  Biere
//
//  Created by ademir on 02/12/20.
//

import UIKit
import CoreData

class DetalheCervejaViewController: UIViewController {
    var btndesabilitado = false
    var context : NSManagedObjectContext!
    var cervejaD : NSManagedObject!
    var usuario: String?
    var cerv: Cerveja!
    var incAlt : String!  //I - Inclusão / A - Alteracao
    
    @IBOutlet weak var nomeCerveja: UITextField?
    @IBOutlet weak var paisCerveja: UITextField?
    @IBOutlet weak var tipoCerveja: UITextField?
    @IBOutlet weak var bdusCerveja: UITextField?
    @IBOutlet weak var teorAlcCerveja: UITextField?
    @IBOutlet weak var comentarioCerveja: UITextView?
    @IBOutlet weak var btnExcluir: UIButton?
    
    func alertas(mensagem: String, titulo: String){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let confirma = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(confirma)
        present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func btnExcluir(_ sender: Any) {
       
        context.delete(cervejaD)
        do {
            try context.save()
            alertas(mensagem: "Dados excluidos com sucesso!", titulo: "Salvar")
        } catch  let erro {
            alertas(mensagem: "Erro ao excluir: \(erro.localizedDescription)", titulo: "Erro Excluir")
        }
        
    }
    
    @IBAction func btnSalvar(_ sender: Any) {
        
        if self.incAlt == "I" {
            let novoReg = NSEntityDescription.insertNewObject(forEntityName: "CervejaCD", into: context)
            novoReg.setValue(self.nomeCerveja?.text, forKey: "nome")
            novoReg.setValue(self.paisCerveja?.text, forKey: "pais")
            novoReg.setValue(self.tipoCerveja?.text, forKey: "tipo")
            novoReg.setValue(self.bdusCerveja?.text, forKey: "bdus")
            novoReg.setValue(self.teorAlcCerveja?.text, forKey: "teorAlcoolico")
            novoReg.setValue(self.comentarioCerveja?.text, forKey: "comentario")
            novoReg.setValue(usuario, forKey: "usuario")
            
            do {
                try context.save()
                alertas(mensagem: "Dados salvos com sucesso!", titulo: "Salvar")
            } catch let erro {
                alertas(mensagem: "Erro ao salvar: \(erro.localizedDescription)", titulo: "Erro Salvar")
            }
            
        }else{
            cervejaD.setValue(self.nomeCerveja?.text, forKey: "nome")
            cervejaD.setValue(self.paisCerveja?.text, forKey: "pais")
            cervejaD.setValue(self.tipoCerveja?.text, forKey: "tipo")
            cervejaD.setValue(self.bdusCerveja?.text, forKey: "bdus")
            cervejaD.setValue(self.teorAlcCerveja?.text, forKey: "teorAlcoolico")
            cervejaD.setValue(self.comentarioCerveja?.text, forKey: "comentario")
            do {
                try context.save()
                alertas(mensagem: "Dados salvos com sucesso!", titulo: "Salvar")
            } catch let erro {
                alertas(mensagem: "Erro ao salvar: \(erro.localizedDescription)", titulo: "Erro Salvar")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnExcluir?.isHidden = btndesabilitado
        self.nomeCerveja?.becomeFirstResponder()
        self.paisCerveja?.becomeFirstResponder()
        self.tipoCerveja?.becomeFirstResponder()
        self.bdusCerveja?.becomeFirstResponder()
        self.teorAlcCerveja?.becomeFirstResponder()
        self.comentarioCerveja?.becomeFirstResponder()
        
        if cervejaD != nil {
            self.nomeCerveja?.text = cervejaD.value(forKey: "nome") as? String
            self.paisCerveja?.text = cervejaD.value(forKey: "pais") as? String
            self.tipoCerveja?.text = cervejaD.value(forKey: "tipo") as? String
            self.bdusCerveja?.text = cervejaD.value(forKey: "bdus") as? String
            self.teorAlcCerveja?.text = cervejaD.value(forKey: "teorAlcoolico") as? String
            self.comentarioCerveja?.text = cervejaD.value(forKey: "comentario") as? String
            
        }else{
            self.nomeCerveja?.text = ""
            self.paisCerveja?.text = ""
            self.tipoCerveja?.text = ""
            self.bdusCerveja?.text = ""
            self.teorAlcCerveja?.text = ""
            self.comentarioCerveja?.text = ""
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }
    

}
