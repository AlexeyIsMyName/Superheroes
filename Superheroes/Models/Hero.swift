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
}
