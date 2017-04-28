//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Brian Murray on 4/14/17.
//  Copyright © 2017 Brian Murray. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var thumbImg:UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var nextEvolutionLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thumbImg.image = UIImage(named: "\(pokemon.pokedexId)")
        nameLbl.text = pokemon.name.capitalized
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        currentEvoImg.image = UIImage(named: "\(pokemon.pokedexId)")
        
        pokemon.downloadPokemonDetails() {
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = "\(pokemon.defense)"
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = "\(pokemon.baseAttack)"
        if pokemon.nextEvolution != "" {
            nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolution)")
            nextEvolutionLbl.text = "Next Evolution: \(pokemon.nextEvolutionName) LVL \(pokemon.nextEvolutionLevel)"
        } else {
            nextEvoImg.isHidden = true
            nextEvolutionLbl.text = "Final Evolution"
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
