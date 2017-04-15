//
//  Pokemon.swift
//  Pokedex
//
//  Created by Brian Murray on 4/14/17.
//  Copyright © 2017 Brian Murray. All rights reserved.
//

import Foundation

class Pokemon {
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: Int!
    private var _height: Int!
    private var _weight: Int!
    private var _baseAttack: Int!
    private var _nextEvolution: String!
    
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
            _description = ""
        }
        return _description
    }
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    var defense: Int {
        if _defense == nil {
            _defense = 0
        }
        return _defense
    }
    var height: Int {
        if _height == nil {
            _height = 0
        }
        return _height
    }
    var weight: Int {
        if _weight == nil {
            _weight = 0
        }
        return _weight
    }
    var baseAttack: Int {
        if _baseAttack == nil {
            _baseAttack = 0
        }
        return _baseAttack
    }
    var nextEvolution: String {
        if _nextEvolution == nil {
            _nextEvolution = ""
        }
        return _nextEvolution
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._description = description
        self._type = type
        self._defense = defense
        self._height = height
        self._weight = weight
        self._baseAttack = baseAttack
    }
    
    
}
