//
//  NetworkManager.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 06.03.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private var heroes: [Hero] = []
    
    private init() {}
    
    func fetchHeroData(getAll: Bool, with complition: @escaping ([Hero]) -> Void) {
        heroes = []
        
        let rangeRandom = 1...21
        let rangeAll = 1...732
        
        DispatchQueue.global().async {
            for id in getAll ? rangeAll : rangeRandom {
                var stringURL = ""
                
                switch getAll {
                case true: stringURL = "https://superheroapi.com/api/3898713710192169/\(id)"
                case false: stringURL = "https://superheroapi.com/api/3898713710192169/\(Int.random(in: rangeAll))"
                }
                
                AF.request(stringURL)
                    .validate()
                    .responseJSON { responseData in
                        switch responseData.result {
                        case .success(let value):
                            DispatchQueue.main.async {
                                self.heroes += Hero.getHeroArrayCell(from: value)
                                
                                if !getAll || id == rangeRandom.max() && getAll || id == rangeAll.max() {
                                    self.heroes.sort { (hero1, hero0) -> Bool in
                                        if let name1 = hero1.name, let name0 = hero0.name {
                                            return name1 < name0
                                        }
                                        return false
                                    }
                                    complition(self.heroes)
                                }
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
            }
        }
    }
    
    func fetchImageData(from url: String?, with complition: (UIImage) -> Void) {
        
    }
}
