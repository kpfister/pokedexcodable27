//
//  PokemonViewController.swift
//  PokedexCodable27
//
//  Created by Karl Pfister on 6/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonSpriteImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonSearchBar.delegate = self
    }
    
    func updatesView(with pokeball: TopLevelDictionary) {
        DispatchQueue.main.async {
            self.pokemonNameLabel.text = pokeball.name
            self.pokemonAbilitiesLabel.text = pokeball.abilities[0].ability.name
            self.pokemonIDLabel.text = "\(pokeball.id)"
            // idk Image?
        }
    }
    
}
extension PokemonViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        PokemonControler.sharedInstance.fetchPokemonWith(searchTerm: searchText) { (pokemon) in
            guard let pokeball = pokemon else {return}
            PokemonControler.sharedInstance.fetchPokemonImage(pokemon: pokeball, completion: { (image) in
                DispatchQueue.main.async {
                    self.pokemonSpriteImage.image = image
                }
                self.updatesView(with: pokeball)
            })
        }
    }
}
