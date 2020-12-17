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
        
        /*var cerveja: Cerveja
                
        cerveja = Cerveja(nome: "Delirium Tremens", pais: "Bélgica", tipo: "Belgian Golden Strong Ale", bdus: "Alto", teorAlcoolico: "8,5%", comentario: "É uma cerveja belga considerada por muitos como a melhor cerveja do mundo. Uma cerveja de estilo Belgian Golden Strong Ale dourada e brilhante, com aromas frutados, alcoólicos, e sabores que mais parecem frutas cítricas, com leve toque de damasco e caramelo. É uma cerveja complexa, com uma riqueza de aromas e sabores que deixam qualquer apreciador completamente apaixonado.")
        
        cervejas.append(cerveja)*/
    }
    
    func recuperarCervejas(usuario: String){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "CervejaCD")
        
        let predicado = NSPredicate(format: "usuario == %@", usuario)
        let ordenacao = NSSortDescriptor (key: "nome", ascending: true)
        requisicao.sortDescriptors = [ordenacao]
        requisicao.predicate = predicado
        
        do {
            let cervejaBD = try context.fetch(requisicao)
            self.cerv = cervejaBD as! [NSManagedObject]
            self.tableView.reloadData()
            
            //if cerveja.count > 0 {
                //alertas(mensagem: "Usuario não cadastrado!", titulo: "Login")
            //}
             //else{
                //let usu = usuario as! [NSManagedObject]
                //if !(txtSenha.text!.contains(usu[0].value(forKey:"senha") as! String)){
                //    alertas(mensagem: "Senha inválida!", titulo: "Login")
                //}
            //}
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
        
        //let cerveja : Cerveja = cervejas[indexPath.row]
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
        let cerveja = self.cerv[indexPath.row]
          
        let cervNome = cerveja.value(forKey: "nome")
        let cervTipo = cerveja.value(forKey: "tipo")
        celula.textLabel?.text = String(describing: cervNome)
        celula.detailTextLabel?.text = String(describing: cervTipo)
        
        return celula
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar"{
            btndesabilitado = true
            let viewControlerDestinoAdic = segue.destination as! DetalheCervejaViewController
            viewControlerDestinoAdic.btndesabilitado = btndesabilitado
            
        }
        
        if segue.identifier == "alterar"{
            
            if let indexPath = tableView.indexPathForSelectedRow{
                btndesabilitado = false
                let cervejaSelecionada = self.cerv[indexPath.row] //self.cervejas[indexPath.row]
                let viewControlerDestino = segue.destination as! DetalheCervejaViewController
                viewControlerDestino.btndesabilitado = btndesabilitado
                //viewControlerDestino.cerveja = cervejaSelecionada
            }
        }
    }
    
    
    
}
