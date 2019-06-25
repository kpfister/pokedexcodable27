//
//  PokemonController.swift
//  PokedexCodable27
//
//  Created by Karl Pfister on 6/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation

class PokemonControler {
    
    // Singleton
    static let sharedInstance = PokemonControler()
    
    // Create
    func fetchPokemonWith(searchTerm: String, completion: @escaping (TopLevelDictionary?) -> Void) {
        
        // Build URL
        let baseURL = URL(string: "https://pokeapi.co/api/v2")
        // Add /pokemon
        let pokemonPathComponetURL = baseURL?.appendingPathComponent("pokemon")
        // Add /searchTerm
        guard let finalURL = pokemonPathComponetURL?.appendingPathComponent(searchTerm) else {return}
        print(finalURL)
        
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            // Handle the Error
            if let error = error {
                print("There was an error \(error.localizedDescription)")
            }
            // Check if there's data
            if let data = data {
                // decode the data
                do {
                    // Handle the data
                    let pokemon =  try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                    completion(pokemon)
                } catch {
                    print("Error Fetching pokemon!")
                    completion(nil);return
                }
            }
        }.resume()
    }
}// End of class
