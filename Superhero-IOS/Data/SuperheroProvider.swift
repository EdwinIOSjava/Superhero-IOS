//
//  SuperheroProvider.swift
//  Superhero-IOS
//
//  Created by Mañanas on 22/5/25.
//https://superheroapi.com/api.php/366938c45782667eb4386465fa02e992/search/h

import Foundation
class SuperheroProvider{
    
    static let API_KEY = "366938c45782667eb4386465fa02e992"
    
    static func findSuperheroesByName(query: String) async -> [Superhero] {
            let url = URL(string: "https://www.superheroapi.com/api.php/\(API_KEY)/search/\(query)")
            
        /* para ver si las variables son nulas esta el if y el guard
         entra en el guard -> si es nulla la variable y toca controlarlo !
         el if es si todo va bien entonces hazlo, tambien hay un else por si no */
        
            guard let url = url else {
                print("Error building URL")
                return []
            }
            
            do {
                    let (data, response) = try await URLSession.shared.data(from: url)
                    let result = try JSONDecoder().decode(SuperheroResponse.self, from: data)
                    
                    return result.results
                } catch {
                    print(error)
                    return []
                }
        }
}
