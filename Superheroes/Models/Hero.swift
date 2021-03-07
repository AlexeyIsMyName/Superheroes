//
//  Hero.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

// MARK: - HERO DATA MODEL -
// MARK: - HEAD -
struct Hero: Decodable {
    let id: String?
    let name: String?
    let powerstats: PowerstatsHero?
    let biography: BiographyHero?
    let appearance: AppearanceHero?
    let work: WorkHero?
    let connections: ConnectionsHero?
    let image: ImageHero?
    
    init(heroData: [String: Any]) {
        let powerstatsHeroData = heroData["powerstats"] as? [String: String] ?? ["": ""]
        let biographyHeroData = (heroData["biography"] as? [String: Any]) ?? ["": ""]
        let appearanceHeroData = (heroData["appearance"] as? [String: Any]) ?? ["": ""]
        let workHeroData = (heroData["work"] as? [String: String]) ?? ["": ""]
        let connectionsHeroData = (heroData["connections"] as? [String: String]) ?? ["": ""]
        let imageHeroData = (heroData["image"] as? [String: String]) ?? ["": ""]
        
        id = heroData["id"] as? String
        name = heroData["name"] as? String
        powerstats = PowerstatsHero(powerstatsHeroData: powerstatsHeroData)
        biography = BiographyHero(biographyHeroData: biographyHeroData)
        appearance = AppearanceHero(appearanceHeroData: appearanceHeroData)
        work = WorkHero(workHeroData: workHeroData)
        connections = ConnectionsHero(connectionsHeroData: connectionsHeroData)
        image = ImageHero(imageHeroData: imageHeroData)
    }
    
    static func getHeroArrayCell(from value: Any) -> [Hero] {
        guard let heroData = value as? [String: Any] else { return []}
        return [Hero(heroData: heroData)]
    }
}

// MARK: - POWERSTATS -
struct PowerstatsHero: Decodable {
    let intelligence: String?
    let strength: String?
    let speed: String?
    let durability: String?
    let power: String?
    let combat: String?
    
    var description: String? {
        var description = "⌁\n"
        
        if let intelligence = intelligence, intelligence != "null" {
            description += "🤓 Intelligence: \(intelligence)\n"
        }
        
        if let strength = strength, strength != "null" {
            description += "💪 Strength: \(strength)\n"
        }
        
        if let speed = speed, speed != "null" {
            description += "🏃 Speed: \(speed)\n"
        }
        
        if let durability = durability, durability != "null" {
            description += "Durability: \(durability) 💎\n"
        }
        
        if let power = power, power != "null" {
            description += "Power: \(power) 🍔\n"
        }
        
        if let combat = combat, combat != "null" {
            description += "Combat: \(combat) 🤺\n"
        }
        
        if description == "⌁\n" {
            return nil
        } else {
            return (description + "⌁")
        }
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

// MARK: - BIOGRAPHY -
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
    
    var description: String? {
        var description = "⌁\n"
        
        if let fullName = fullName, fullName != "" {
            description += "✪ Full Name:\n\(fullName)\n\n"
        }
        
        if let alterEgos = alterEgos, alterEgos != "No alter egos found." {
            description += "⎌ Alter-egos:\n\(alterEgos)\n\n"
        }
        
        if let aliases = aliases, aliases.joined(separator: ", ") != "-" {
            description += "⎆ Aliases:\n\(aliases.joined(separator: ", "))\n\n"
        }
        
        if let placeOfBirth = placeOfBirth, placeOfBirth != "-", placeOfBirth != "Place of birth unknown" {
            description += "⚓︎ Place of Birth:\n\(placeOfBirth)\n\n"
        }
        
        if let firstAppearance = firstAppearance, firstAppearance != "-" {
            description += "⚐ First Appearance:\n\(firstAppearance)\n\n"
        }
        
        if let publisher = publisher, publisher != "-",  publisher != "null" {
            description += "® Publisher: \(publisher)\n\n"
        }
        
        if let alignment = alignment, alignment != "-" {
            description += "⚔︎ Alignment: \(alignment)\n"
        }
        
        if description == "⌁\n" {
            return nil
        } else {
            return (description + "⌁")
        }
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

// MARK: - APPEARANCE -
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
    
    var description: String? {
        var description = "⌁\n"
        
        if let gender = gender, gender != "-" {
            description += "Gender: \(gender)\n"
        }
        
        if let race = race, race != "null" {
            description += "Race: \(race)\n"
        }
        
        if let height = height, height.joined(separator: ", ") != "-, 0 cm" {
            description += "Height: \(height.joined(separator: ", "))\n"
        }
        
        if let weight = weight, weight.joined(separator: ", ") != "- lb, 0 kg" {
            description += "Weight: \(weight.joined(separator: ", "))\n"
        }
        
        if let eyeColor = eyeColor, eyeColor != "-" {
            description += "Eye Color: \(eyeColor)\n"
        }
        
        if let hairColor = hairColor, hairColor != "-" {
            description += "Hair Color: \(hairColor)\n"
        }
        
        if description == "⌁\n" {
            return nil
        } else {
            return (description + "⌁")
        }
    }
    
    init(appearanceHeroData: [String: Any]) {
        gender = appearanceHeroData["gender"] as? String
        race = appearanceHeroData["race"] as? String
        height = appearanceHeroData["height"] as? [String]
        weight = appearanceHeroData["weight"] as? [String]
        eyeColor = appearanceHeroData["eye-color"] as? String
        hairColor = appearanceHeroData["hair-color"] as? String
    }
}

// MARK: - WORK -
struct WorkHero: Decodable {
    let occupation: String?
    let base: String?
    
    var description: String? {
        
        var description = "⌁\n"
        
        if let occupation = occupation, occupation != "-" {
            description += "Occupation:\n\(occupation)\n\n"
        }
        
        if let base = base, base != "-" {
            description += "Bace:\n\(base)\n"
        }
        
        if description == "⌁\n" {
            return nil
        } else {
            return (description + "⌁")
        }
    }
    
    init(workHeroData: [String: String]) {
        occupation = workHeroData["occupation"]
        base = workHeroData["base"]
    }
}

// MARK: - CONNECTIONS -
struct ConnectionsHero: Decodable {
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
    
    let groupAffiliation: String?
    let relatives: String?
    
    var description: String? {
        var description = "⌁\n"
        
        if let groupAffiliation = groupAffiliation, groupAffiliation != "-" {
            description += "Group Affiliation:\n\(groupAffiliation)\n\n"
        }
        
        if let relatives = relatives, relatives != "-" {
            description += "Relatives:\n\(relatives)\n"
        }
        
        if description == "⌁\n" {
            return nil
        } else {
            return (description + "⌁")
        }
    }
    
    init(connectionsHeroData: [String: String]) {
        groupAffiliation = connectionsHeroData["group-affiliation"]
        relatives = connectionsHeroData["relatives"]
    }
}

// MARK: - IMAGE -
struct ImageHero: Decodable {
    let url: String?
    
    init(imageHeroData: [String: String]) {
        url = imageHeroData["url"]
    }
}
