//
//  CervejaViewControler.swift
//  Biere
//
//  Created by ademir on 01/12/20.
//

import UIKit
import CoreData

class CervejaViewControler: UITableViewController {
    var context : NSManagedObjectContext!
    var cerv : [NSManagedObject] = []
    var usuario : String?
    
    //var cervejas: [Cerveja] = []
    var btndesabilitado = false
    
    func alertas(mensagem: String, titulo: String){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let confirma = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(confirma)
        present(alerta, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("teste viewDidAppear: "+usuario!)
        recuperarCervejas(usuario: usuario!)
    }
    
    func recuperarCervejas(usuario: String){
        print("teste recupera: "+usuario)
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "CervejaCD")
        
        let predicado = NSPredicate(format: "usuario == %@", usuario)
        let ordenacao = NSSortDescriptor (key: "nome", ascending: true)
        requisicao.sortDescriptors = [ordenacao]
        requisicao.predicate = predicado
        
        do {
            let cervejaBD = try context.fetch(requisicao)
            self.cerv = cervejaBD as! [NSManagedObject]
            self.tableView.reloadData()
            
        } catch let erro {
            alertas(mensagem: erro.localizedDescription, titulo: "Erro retornar dados!")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cerv.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
        let cerveja = self.cerv[indexPath.row]
        
        print(cerveja.value(forKey: "usuario") as! String)
        celula.textLabel?.text = cerveja.value(forKey: "nome") as? String
        celula.detailTextLabel?.text = cerveja.value(forKey: "tipo") as? String
        
        return celula
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar"{
            btndesabilitado = true
            let viewControlerDestinoAdic = segue.destination as! DetalheCervejaViewController
            viewControlerDestinoAdic.btndesabilitado = btndesabilitado
            viewControlerDestinoAdic.usuario = usuario
            viewControlerDestinoAdic.incAlt = "I"
        }
        
        if segue.identifier == "alterar"{
            
            if let indexPath = tableView.indexPathForSelectedRow{
                btndesabilitado = false
                let cervejaSelecionada = self.cerv[indexPath.row] //self.cervejas[indexPath.row]
                let viewControlerDestino = segue.destination as! DetalheCervejaViewController
                viewControlerDestino.btndesabilitado = btndesabilitado
                viewControlerDestino.usuario = usuario
                viewControlerDestino.incAlt = "A"
                viewControlerDestino.cervejaD = cervejaSelecionada
            }
        }
    }
    
    
    
}
