//
//  ListaPokemonController.swift
//  Practica11JesusE
//
//  Created by Pauna on 24/11/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import UIKit
class ListaPokemonController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pokemones : [Pokemon] = []

    @IBOutlet weak var tvPokemon: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemones.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaPokemon") as! CeldaPokemonController
        celda.lblNombre.text = pokemones[indexPath.row].nombre
        celda.lblRegion.text = pokemones[indexPath.row].region
        celda.lblNumero.text = pokemones[indexPath.row].numero
        celda.lblCategoria.text = pokemones[indexPath.row].categoria
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEdicion"{
            let contactoSeleccionado = pokemones[tvPokemon.indexPathForSelectedRow!.row]
            let destino = segue.destination as! EditarPokemonController
            destino.pokemon = contactoSeleccionado
            destino.indice = tvPokemon.indexPathForSelectedRow!.row
            destino.callbackActualizarTablaPokemon = actualizarTablaPokemon
            destino.callbackEliminarPokemon = eliminarPokemon
        }
        
        if segue.identifier == "goToCreacion"{
            let destino = segue.destination as! AgregarPokemonController
            destino.callbackAgregarPokemon = agregarPokemon
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Pokédex"
        
        
        pokemones.append(Pokemon(nombre: "Bulbasaur", region: "Kanto", numero: "001", peso: "6,9 kg", altura: "0,7 m", categoria: "Semilla", habilidad: "Espesura", habOcult: "Clorofila", tipo1: "Planta", tipo2: "Veneno"))
        pokemones.append(Pokemon(nombre: "Ivysaur", region: "Kanto", numero: "002", peso: "13,0 kg", altura: "1,0 m", categoria: "Semilla", habilidad: "Espesura", habOcult: "Clorofila", tipo1: "Planta", tipo2: "Veneno"))
    }

    func actualizarTablaPokemon() {
        tvPokemon.reloadData()
    }
    
    func eliminarPokemon(indice : Int) {
        pokemones.remove(at: indice)
        actualizarTablaPokemon()
    }
    
    func agregarPokemon(pokemon: Pokemon) {
        pokemones.append(pokemon)
        actualizarTablaPokemon()
    }

}
