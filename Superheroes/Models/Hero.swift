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
    
    var description: String {
        """
        ⌁
        Gender: \(gender ?? "unknown")
        Race: \(race ?? "unknown")
        Height: \(height?.joined(separator: ", ") ?? "unknown")
        Weight: \(weight?.joined(separator: ", ") ?? "unknown")
        Eye Color: \(eyeColor ?? "unknown")
        Hair Color: \(hairColor ?? "unknown")
        ⌁
        """
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
    
    var description: String {
        """
        ⌁
        Occupation:
        \(occupation ?? "unknown")

        Bace:
        \(base ?? "unknown")
        ⌁
        """
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
    
    var description: String {
        """
        ⌁
        Group Affiliation:
        \(groupAffiliation ?? "unknown")

        Relatives:
        \(relatives ?? "unknown")
        ⌁
        """
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
