//
//  BiographyHero.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

struct BiographyHero: Decodable {
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher
        case alignment
    }
    
    let fullName: String?
    let alterEgos: String?
    let aliases: [String]?
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
    let alignment: String?
    
    var description: String {
        return """
        ⌁
        ✪ Full Name: \(fullName ?? "unknown")
        
        ⎌ Alter-egos: \(alterEgos ?? "unknown")

        ⎆ Aliases:
        \(aliases?.joined(separator: ", ") ?? "unknown")
        
        ⚓︎ Place of Birth:
        \(placeOfBirth ?? "unknown")
        
        ⚐ First Appearance:
        \(firstAppearance ?? "unknown")
        
        ® Publisher: \(publisher ?? "unknown")
        
        ⚔︎ Alignment: \(alignment ?? "unknown")
        ⌁
        """
    }
    
    init(biographyHeroData: [String: Any]) {
        fullName = biographyHeroData["full-name"] as? String
        alterEgos = biographyHeroData["alter-egos"] as? String
        aliases = biographyHeroData["aliases"] as? [String]
        placeOfBirth = biographyHeroData["place-of-birth"] as? String
        firstAppearance = biographyHeroData["first-appearance"] as? String
        publisher = biographyHeroData["publisher"] as? String
        alignment = biographyHeroData["alignment"] as? String
    }
}
