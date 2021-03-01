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


//struct Hero: Decodable {
//    let id: String?
//    let name: String?
//    let powerstats: [PowerstatsHero]?
//    let biography: [BiographyHero]?
//    let appearance: [AppearanceHero]?
//    let work: [WorkHero]?
//    let connections: [ConnectionsHero]?
//    let image: [ImageHero]?
//}


let JSON = ["response":"success",
            "id":"70",
            "name":"Batman",
            "powerstats":["intelligence":"100","strength":"26","speed":"27","durability":"50","power":"47","combat":"100"],
            "biography":["full-name":"Bruce Wayne","alter-egos":"No alter egos found.","aliases":["Insider","Matches Malone"],"place-of-birth":"Crest Hill, Bristol Township; Gotham County","first-appearance":"Detective Comics #27","publisher":"DC Comics","alignment":"good"],
            "appearance":["gender":"Male","race":"Human","height":["6'2","188 cm"],"weight":["210 lb","95 kg"],"eye-color":"blue","hair-color":"black"],
            "work":["occupation":"Businessman","base":"Batcave, Stately Wayne Manor, Gotham City; Hall of Justice, Justice League Watchtower"],
            "connections":["group-affiliation":"Batman Family, Batman Incorporated, Justice League, Outsiders, Wayne Enterprises, Club of Heroes, formerly White Lantern Corps, Sinestro Corps","relatives":"Damian Wayne (son), Dick Grayson (adopted son), Tim Drake (adopted son), Jason Todd (adopted son), Cassandra Cain (adopted ward)\nMartha Wayne (mother, deceased), Thomas Wayne (father, deceased), Alfred Pennyworth (former guardian), Roderick Kane (grandfather, deceased), Elizabeth Kane (grandmother, deceased), Nathan Kane (uncle, deceased), Simon Hurt (ancestor), Wayne Family"],
            "image":["url":"https:\\/www.superherodb.compictures2portraits10100/639.jpg"]] as [String : Any]


