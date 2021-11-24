//
//  Contacto.swift
//  Practica11JesusE
//
//  Created by Alumno on 11/1/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import Foundation
import UIKit

class Pokemon{
    var nombre = ""
    var region = ""
    var numero = ""
    var peso = ""
    var altura = ""
    var categoria = ""
    var habilidad = ""
    var habOcult = ""
    var tipo1 = ""
    var tipo2 = ""

    init(nombre: String, region: String, numero: String, peso: String, altura: String, categoria: String, habilidad: String, habOcult: String, tipo1: String, tipo2: String ) {
        self.nombre = nombre
        self.region = region
        self.numero = numero
        self.peso = peso
        self.altura = altura
        self.categoria = categoria
        self.habilidad = habilidad
        self.habOcult = habOcult
        self.tipo1 = tipo1
        self.tipo2 = tipo2
    }
}
