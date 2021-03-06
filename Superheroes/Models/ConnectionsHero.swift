//
//  ConnectionsHero.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

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
