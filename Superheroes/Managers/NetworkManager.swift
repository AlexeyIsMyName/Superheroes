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
    
    private var heroesCash: [Hero] = []
    
    private init() {}
    
    func fetchHeroData(getAll: Bool, with complition: @escaping ([Hero]) -> Void) {
        heroesCash = []
        
        let rangeRandom = 1...21
        let rangeAll = 1...732
        
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
                            self.heroesCash += Hero.getHeroArrayCell(from: value)
                            
                            if !getAll && id == rangeRandom.max() || getAll && id == rangeAll.max() {
                                self.heroesCash.sort { (hero1, hero0) -> Bool in
                                    if let name1 = hero1.name, let name0 = hero0.name {
                                        return name1 < name0
                                    }
                                    return false
                                }
                                complition(self.heroesCash)
                            }
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
        }
    }
    
    func fetchImageData(from url: String, with complition: @escaping (UIImage?) -> Void) {
        AF.request(url)
            .validate()
            .responseData { responseData in
                switch responseData.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        complition(UIImage(data: value))
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
