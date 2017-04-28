//
//  Constants.swift
//  Pokedex
//
//  Created by Brian Murray on 4/15/17.
//  Copyright © 2017 Brian Murray. All rights reserved.
//

import Foundation

let BASE_URL = "https://pokeapi.co"
let API_URI = "/api/v1/pokemon/"
typealias DownloadComplete = () -> ()

func api_URL(pokedexId: Int) -> String {
    return "\(BASE_URL)\(API_URI)\(pokedexId)/"
}
