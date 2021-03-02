//
//  AppearanceHero.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

struct AppearanceHero: Decodable {
    enum CodingKeys: String, CodingKey {
        case gender
        case race
        case height
        case weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
    
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
    let eyeColor: String?
    let hairColor: String?
    
    var description: String {
        """
        Gender: \(gender ?? "unknown")
        Race: \(race ?? "unknown")
        Height: \(height?.joined(separator: ", ") ?? "unknown")
        Weight: \(weight?.joined(separator: ", ") ?? "unknown")
        Eye Color: \(eyeColor ?? "unknown")
        Hair Color: \(hairColor ?? "unknown")
        """
    }
}
