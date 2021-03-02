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
        case placeOfBirth = "place_of_birth"
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
        """
        fullName: \(fullName ?? "unknown")
        alterEgos: \(alterEgos ?? "unknown")
        aliases: \(aliases?.joined(separator: ", ") ?? "unknown")
        placeOfBirth: \(placeOfBirth ?? "unknown")
        firstAppearance: \(firstAppearance ?? "unknown")
        publisher: \(publisher ?? "unknown")
        alignment: \(alignment ?? "unknown")
        """
    }
}
