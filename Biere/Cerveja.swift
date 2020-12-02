//
//  cerveja.swift
//  Biere
//
//  Created by ademir on 30/11/20.
//

import Foundation
import UIKit

class Cerveja {
    var nome: String!
    var pais: String!
    var tipo: String!
    var bdus: String!
    var teorAlcoolico: String!
    var comentario: String!
    
    init (nome: String, pais: String,tipo: String,bdus: String,teorAlcoolico: String,comentario:String ){
        self.nome = nome
        self.pais = pais
        self.tipo = tipo
        self.bdus = bdus
        self.teorAlcoolico = teorAlcoolico
        self.comentario = comentario
    }
}
