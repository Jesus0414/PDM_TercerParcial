//
//  EditarContactoController.swift
//  Practica11JesusE
//
//  Created by Alumno on 11/3/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import Foundation
import UIKit

class EditarPokemonController : UIViewController{
    
    var indice : Int = -1
    var pokemon : Pokemon?
    var callbackActualizarTablaPokemon : (() -> Void)?
    var callbackEliminarPokemon : ((Int) -> Void)?
    
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
    @IBOutlet weak var btnEditar: UIButton!
    @IBOutlet weak var btnGuardar: UIButton!
    @IBOutlet weak var btnEliminar: UIButton!
    
    override func viewDidLoad() {
        self.title = "Editar Entrada Pokédex"
        
        txtNombre.text = pokemon!.nombre
        txtRegion.text = pokemon!.region
        txtNumero.text = pokemon!.numero
        txtPeso.text = pokemon!.peso
        txtAltura.text = pokemon!.altura
        txtCategoria.text = pokemon!.categoria
        txtHabilidad.text = pokemon!.habilidad
        txtHabOcult.text = pokemon!.habOcult
        txtTipo1.text = pokemon!.tipo1
        txtTipo2.text = pokemon!.tipo2
        
        txtNombre.isEnabled = false
        txtRegion.isEnabled = false
        txtNumero.isEnabled = false
        txtPeso.isEnabled = false
        txtAltura.isEnabled = false
        txtCategoria.isEnabled = false
        txtHabilidad.isEnabled = false
        txtHabOcult.isEnabled = false
        txtTipo1.isEnabled = false
        txtTipo2.isEnabled = false
    }
    
    @IBAction func doTapEditar(_ sender: Any) {
        btnGuardar.isEnabled = true
        btnEditar.isEnabled = false
        btnGuardar.isHidden = false
        btnEditar.isHidden = true
        
        txtNombre.isEnabled = true
        txtRegion.isEnabled = true
        txtNumero.isEnabled = true
        txtPeso.isEnabled = true
        txtAltura.isEnabled = true
        txtCategoria.isEnabled = true
        txtHabilidad.isEnabled = true
        txtHabOcult.isEnabled = true
        txtTipo1.isEnabled = true
        txtTipo2.isEnabled = true
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {
        btnGuardar.isEnabled = false
        btnEditar.isEnabled = true
        btnGuardar.isHidden = true
        btnEditar.isHidden = false
        
        pokemon!.nombre = txtNombre.text!
        pokemon!.region = txtRegion.text!
        pokemon!.numero = txtNumero.text!
        pokemon!.peso = txtPeso.text!
        pokemon!.altura = txtAltura.text!
        pokemon!.categoria = txtCategoria.text!
        pokemon!.habilidad = txtHabilidad.text!
        pokemon!.habOcult = txtHabOcult.text!
        pokemon!.tipo1 = txtTipo1.text!
        pokemon!.tipo2 = txtTipo2.text!
        
        callbackActualizarTablaPokemon!()
    }
    @IBAction func doTapEliminar(_ sender: Any) {
        callbackEliminarPokemon!(indice)
        self.navigationController!.popViewController(animated: true)
    }
    
}
