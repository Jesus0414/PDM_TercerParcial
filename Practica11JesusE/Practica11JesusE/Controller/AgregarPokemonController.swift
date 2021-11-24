//
//  AgregarContactoController.swift
//  Practica11JesusE
//
//  Created by Alumno on 11/8/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import Foundation
import UIKit

class AgregarPokemonController : UIViewController{
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtRegion: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var txtPeso: UITextField!
    @IBOutlet weak var txtAltura: UITextField!
    @IBOutlet weak var txtCategoria: UITextField!
    @IBOutlet weak var txtHabilidad: UITextField!
    @IBOutlet weak var txtHabOcult: UITextField!
    @IBOutlet weak var txtTipo1: UITextField!
    @IBOutlet weak var txtTipo2: UITextField!
    
    
    var callbackAgregarPokemon : ((Pokemon) -> Void)?
    
    override func viewDidLoad() {
        self.title = "Agregar pokémon"
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {
        let nombre = txtNombre.text!
        let region = txtRegion.text!
        let numero = txtNumero.text!
        let peso = txtPeso.text!
        let altura = txtAltura.text!
        let categoria = txtCategoria.text!
        let habilidad = txtHabilidad.text!
        let habOcult = txtHabOcult.text!
        let tipo1 = txtTipo1.text!
        let tipo2 = txtTipo2.text!
        
        let pokemon = Pokemon(nombre: nombre, region: region, numero: numero, peso: peso, altura: altura, categoria: categoria, habilidad: habilidad, habOcult: habOcult, tipo1: tipo1, tipo2: tipo2)
        callbackAgregarPokemon!(pokemon)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
