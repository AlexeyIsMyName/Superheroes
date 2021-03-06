//
//  PowerstatsHero.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

struct PowerstatsHero: Decodable {
    let intelligence: String?
    let strength: String?
    let speed: String?
    let durability: String?
    let power: String?
    let combat: String?
    
    var description: String {
        """
        ⌁
        🤓 Intelligence: \(intelligence ?? "")
        💪 Strength: \(strength ?? "")
        🏃 Speed: \(speed ?? "")
        Durability: \(durability ?? "") 💎
        Power: \(power ?? "") 🍔
        Combat: \(combat ?? "") 🤺
        ⌁
        """
    }
    
    init(powerstatsHeroData: [String: String]) {
        intelligence = powerstatsHeroData["intelligence"]
        strength = powerstatsHeroData["strength"]
        speed = powerstatsHeroData["speed"]
        durability = powerstatsHeroData["durability"]
        power = powerstatsHeroData["power"]
        combat = powerstatsHeroData["combat"]
    }
}
