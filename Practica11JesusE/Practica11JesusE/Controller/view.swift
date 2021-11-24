//
//  viewController.swift
//  Practica11JesusE
//
//  Created by Alumno on 11/3/21.
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
        pokemones.append(Pokemon(nombre: "Venusaur", region: "Kanto", numero: "003", peso: "100,0 kg", altura: "2,0 m", categoria: "Semilla", habilidad: "Espesura", habOcult: "Clorofila", tipo1: "Planta", tipo2: "Veneno"))
        pokemones.append(Pokemon(nombre: "Charmander", region: "Kanto", numero: "004", peso: "8,5 kg", altura: "0,6 m", categoria: "Lagartija", habilidad: "Mar llamas", habOcult: "Poder solar", tipo1: "Fuego", tipo2: ""))
        pokemones.append(Pokemon(nombre: "Charmeleon", region: "Kanto", numero: "005", peso: "19,0 kg", altura: "1,1 m", categoria: "Llama", habilidad: "Mar llamas", habOcult: "Poder solar", tipo1: "Fuego", tipo2: ""))
        pokemones.append(Pokemon(nombre: "Charizard", region: "Kanto", numero: "006", peso: "90,5 kg", altura: "1,7 m", categoria: "Llama", habilidad: "Mar llamas", habOcult: "Poder solar", tipo1: "Fuego", tipo2: "Volador"))
        pokemones.append(Pokemon(nombre: "Squirtle", region: "Kanto", numero: "007", peso: "9,0 kg", altura: "0,5 m", categoria: "Tortuguita", habilidad: "Torrente", habOcult: "Cura lluvia", tipo1: "Agua", tipo2: ""))
        pokemones.append(Pokemon(nombre: "Wartortle", region: "Kanto", numero: "008", peso: "22,5 kg", altura: "1,0 m", categoria: "Tortuga", habilidad: "Torrente", habOcult: "Cura lluvia", tipo1: "Agua", tipo2: ""))
        pokemones.append(Pokemon(nombre: "Blastoise", region: "Kanto", numero: "009", peso: "85,5 kg", altura: "1,6 m", categoria: "Armazón", habilidad: "Torrente", habOcult: "Cura lluvia", tipo1: "Agua", tipo2: ""))
        pokemones.append(Pokemon(nombre: "Caterpie", region: "Kanto", numero: "010", peso: "2,9 kg", altura: "0,3 m", categoria: "Gusano", habilidad: "Polvo escudo", habOcult: "Fuga", tipo1: "Bicho", tipo2: ""))
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

