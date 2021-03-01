//
//  BiographyHero.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

struct BiographyHero: Decodable {
    let full_name: String?
    let alter_egos: String?
    let aliases: [String]?
    let place_of_birth: String?
    let first_appearance: String?
    let publisher: String?
    let alignment: String?
}
