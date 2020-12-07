//
//  DetalheCervejaViewController.swift
//  Biere
//
//  Created by ademir on 02/12/20.
//

import UIKit

class DetalheCervejaViewController: UIViewController {
    var btndesabilitado = false
    
    @IBOutlet weak var nomeCerveja: UITextField?
    @IBOutlet weak var paisCerveja: UITextField?
    @IBOutlet weak var tipoCerveja: UITextField?
    @IBOutlet weak var bdusCerveja: UITextField?
    @IBOutlet weak var teorAlcCerveja: UITextField?
    @IBOutlet weak var comentarioCerveja: UITextView?
    @IBOutlet weak var btnExcluir: UIButton?
    
    /*func alertas(mensagem: String, titulo: String){
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        let confirma = UIAlertAction(title: "OK", style: ., handler: nil)
        
        alerta.addAction(confirma)
        
        present(alerta, animated: true, completion: nil)
    }*/
    
    @IBAction func btnExcluir(_ sender: Any) {
       // var btexc = sender as? UIButton
       // btexc?.isHidden = true
    }
    
    @IBAction func btnSalvar(_ sender: Any) {
    }
    var cerveja : Cerveja!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnExcluir?.isHidden = btndesabilitado
        
        nomeCerveja?.text = cerveja?.nome
        paisCerveja?.text = cerveja?.pais
        tipoCerveja?.text = cerveja?.tipo
        bdusCerveja?.text = cerveja?.bdus
        teorAlcCerveja?.text = cerveja?.teorAlcoolico
        comentarioCerveja?.text = cerveja?.comentario
        
    }
    

}
