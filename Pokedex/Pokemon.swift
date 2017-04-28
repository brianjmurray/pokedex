//
//  Pokemon.swift
//  Pokedex
//
//  Created by Brian Murray on 4/14/17.
//  Copyright © 2017 Brian Murray. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: Int!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: Int!
    private var _nextEvolution: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionLevel: Int!
    private var _descriptionURL: String!
    private var _pokemonUrl: String!
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    var pokedexId: Int {
        if _pokedexId == nil {
            _pokedexId = 0
        }
        return _pokedexId
    }
    var description: String {
        if _description == nil {
            _description = "Description Not Available"
        }
        return _description
    }
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type!
    }
    var defense: Int {
        if _defense == nil {
            _defense = 0
        }
        return _defense!
    }
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height!
    }
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight!
    }
    var baseAttack: Int {
        if _baseAttack == nil {
            _baseAttack = 0
        }
        return _baseAttack!
    }
    var nextEvolution: String {
        if _nextEvolution == nil {
            _nextEvolution = ""
        }
        return _nextEvolution!
    }
    var nextEvolutionName: String {
        if _nextEvolutionName == nil {
            _nextEvolutionName = ""
        }
        return _nextEvolutionName!
    }
    var nextEvolutionLevel: Int {
        if _nextEvolutionLevel == nil {
            _nextEvolutionLevel = 0
        }
        return _nextEvolutionLevel!
    }
    var descriptionUrl: String {
        if _descriptionURL == nil {
            _descriptionURL = ""
        }
        return _descriptionURL!
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonUrl = api_URL(pokedexId: pokedexId)
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonUrl).responseJSON { response in
            let result = response.result
            print("\(response)")
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let attack = dict["attack"] as? Int {
                    self._baseAttack = attack
                    print("Base Attack: \(self._baseAttack!)")
                }
                if let defense = dict["defense"] as? Int {
                    self._defense = defense
                    print("Defense: \(self._defense!)")
                }
                if let height = dict["height"] as? String {
                    self._height = height
                    print("Height: \(self._height!)")
                }
                if let weight = dict["weight"]! as? String {
                    self._weight = weight
                    print("Weight: \(self._weight!)")
                }
                if let types = dict["types"]! as? [Dictionary<String, AnyObject>] {
                    var x = 0
                    while x < types.count {
                        if let name = types[x]["name"] as? String {
                            if self._type == nil {
                                self._type = name.capitalized
                            } else {
                                self._type = "\(self._type!)/\(name.capitalized)"
                            }
                        }
                        x += 1
                    }
                    print("Type: \(self._type!)")
                
                }
                if let evolutions = dict["evolutions"]! as? [Dictionary<String, AnyObject>] {
                    var x = 0
                    while x < evolutions.count {
                        if let method = evolutions[x]["method"] as? String {
                            if method == "level_up" {
                                if let resource_uri = evolutions[x]["resource_uri"] as? String {
                                    var uri_parts = resource_uri.components(separatedBy: "/")
                                    self._nextEvolution = uri_parts[4]
                                    print("\(self._nextEvolution!)")
                                }
                                if let to = evolutions[x]["to"] as? String {
                                    self._nextEvolutionName = to.capitalized
                                    print("\(self._nextEvolutionName!)")
                                }
                                if let level = evolutions[x]["level"] as? Int {
                                    self._nextEvolutionLevel = level
                                    print("\(self._nextEvolutionLevel!)")
                                }
                            }
                        }
                        x += 1
                    }
                }
                if let descriptions = dict["descriptions"]! as? [Dictionary<String, AnyObject>] {
                    if let uri = descriptions[0]["resource_uri"] as? String {
                        self._descriptionURL = uri
                        print("Description uri: \(self._descriptionURL!)")
                        var description = String()
                        Alamofire.request("\(BASE_URL)\(self._descriptionURL!)").responseJSON { response in
                            let result = response.result
                            print("\(response)")
                            if let dict = result.value as? Dictionary<String, AnyObject> {
                                description = (dict["description"] as? String)!
                                self._description = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                print("Description: \(self._description!)")
                            }
                        }
                        completed()
                    }
                }
                
            }
            completed()
        }
    }
    
//    func downloadPokemonDescription(completed: @escaping DownloadComplete){
//        let descriptionURL = "\(BASE_URL)\(self._descriptionURL!)"
//        print("Description URL: \(descriptionURL)")
//        var description = String()
//        Alamofire.request(descriptionURL).responseJSON { response in
//            let result = response.result
//            print("\(response)")
//            if let dict = result.value as? Dictionary<String, AnyObject> {
//                description = (dict["description"] as? String)!
//                self._description = description
//                print("Description: \(self._description!)")
//            }
//        }
//        completed()
//    }
}
    

