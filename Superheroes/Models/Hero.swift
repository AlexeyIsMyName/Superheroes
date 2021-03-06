//
//  Hero.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

struct Hero: Decodable {
    let id: String?
    let name: String?
    let powerstats: PowerstatsHero?
    let biography: BiographyHero?
    let appearance: AppearanceHero?
    let work: WorkHero?
    let connections: ConnectionsHero?
    let image: ImageHero?
    
    private init(heroData: [String: Any]) {
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
