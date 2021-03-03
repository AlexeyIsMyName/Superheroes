//
//  DataManager.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 03.03.2021.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    func fetchHeroes(isAll: Bool, completionHandler: ([Hero]?) -> Void) {
        var heroes: [Hero] = []
        
        let rangeRandom = 1...21
        let rangeAll = 1...732
        
        for id in isAll ? rangeAll : rangeRandom {
            var stringURL = ""
            
            switch isAll {
            case true: stringURL = "https://superheroapi.com/api/3898713710192169/\(id)"
            case false: stringURL = "https://superheroapi.com/api/3898713710192169/\(Int.random(in: rangeAll))"
            }

            guard let url = URL(string: stringURL) else {
                completionHandler(nil)
                return
            }

            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let data = data else { return }
                    do {
                        heroes.append(try JSONDecoder().decode(Hero.self, from: data))
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
        completionHandler(heroes)
    }
    
    private init(){}
}
