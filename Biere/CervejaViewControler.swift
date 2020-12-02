//
//  CervejaViewControler.swift
//  Biere
//
//  Created by ademir on 01/12/20.
//

import UIKit

class CervejaViewControler: UITableViewController {
    var cervejas: [Cerveja] = []
    
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
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
        
        celula.textLabel?.text = cerveja.nome
        celula.detailTextLabel?.text = cerveja.tipo
        
        return celula
        
    }
    
    
    
}
