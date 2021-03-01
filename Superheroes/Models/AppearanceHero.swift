//
//  AppearanceHero.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

struct AppearanceHero: Decodable {
    let gender: String?
    let race: String?
    let height: [String?]
    let weight: [String?]
    let eye_color: String?
    let hair_color: String?
}
