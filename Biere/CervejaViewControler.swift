//
//  CervejaViewControler.swift
//  Biere
//
//  Created by ademir on 01/12/20.
//

import UIKit
import CoreData

class CervejaViewControler: UITableViewController {
    //var context : NSManagedObjectContext!
    
    var cervejas: [Cerveja] = []
    var btndesabilitado = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cerveja: Cerveja
                
        cerveja = Cerveja(nome: "Delirium Tremens", pais: "Bélgica", tipo: "Belgian Golden Strong Ale", bdus: "Alto", teorAlcoolico: "8,5%", comentario: "É uma cerveja belga considerada por muitos como a melhor cerveja do mundo. Uma cerveja de estilo Belgian Golden Strong Ale dourada e brilhante, com aromas frutados, alcoólicos, e sabores que mais parecem frutas cítricas, com leve toque de damasco e caramelo. É uma cerveja complexa, com uma riqueza de aromas e sabores que deixam qualquer apreciador completamente apaixonado.")
        
        cervejas.append(cerveja)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cervejas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cerveja : Cerveja = cervejas[indexPath.row]
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath) as! CervejaCelula
        
        celula.cervLabel.text = cerveja.nome
        celula.detCervLabel.text = cerveja.tipo
        
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
                
                let cervejaSelecionada = self.cervejas[indexPath.row]
                
                let viewControlerDestino = segue.destination as! DetalheCervejaViewController
                
                viewControlerDestino.btndesabilitado = btndesabilitado
                
                viewControlerDestino.cerveja = cervejaSelecionada
                
            }
        }
    }
    
    
    
}
