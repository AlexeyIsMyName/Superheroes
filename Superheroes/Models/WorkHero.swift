//
//  WorkHero.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

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
}
