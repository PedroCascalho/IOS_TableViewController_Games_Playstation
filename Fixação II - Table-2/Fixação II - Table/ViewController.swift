//
//  ViewController.swift
//  Fixação II - Table
//
//  Created by Usuário Convidado on 24/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTexto: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    
    var texto:String=""
    var foto:UIImage?=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTexto.text = texto
        imgFoto.image = foto
    }


}

