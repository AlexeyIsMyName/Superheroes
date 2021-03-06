//
//  MainTableViewController.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

import UIKit
import Alamofire

class MainTableViewController: UITableViewController {
    var heroes: [Hero] = []
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHeroes(isAll: false)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let hero = heroes[indexPath.row]
        cell.textLabel?.text = hero.name
        cell.detailTextLabel?.text = hero.biography?.publisher
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsHeroVC = segue.destination as? DetailsHeroViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailsHeroVC.hero = heroes[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func randomBarButtonPressed(_ sender: Any) {
        heroes = []
        fetchHeroes(isAll: false)
    }
    
    @IBAction func allBarButtonPressed(_ sender: Any) {
        heroes = []
        fetchHeroes(isAll: true)
    }
    
}

// MARK: - Networking
extension MainTableViewController {
    func fetchHeroes(isAll: Bool) {
        
        let rangeRandom = 1...21
        let rangeAll = 1...732
        
        for id in isAll ? rangeAll : rangeRandom {
            var stringURL = ""
            
            switch isAll {
            case true: stringURL = "https://superheroapi.com/api/3898713710192169/\(id)"
            case false: stringURL = "https://superheroapi.com/api/3898713710192169/\(Int.random(in: rangeAll))"
            }
            
            guard let url = URL(string: stringURL) else { return }
            
            AF.request(url)
                .validate()
                .responseJSON { responseData in
                    switch responseData.result {
                    case .success(let value):
                        guard let heroData = value as? [String: Any] else { return }
                        guard let powerstatsHeroData = heroData["powerstats"] as? [String: String] else { return }
                        guard let biographyHeroData = heroData["biography"] as? [String: Any] else { return }
                        guard let appearanceHeroData = heroData["appearance"] as? [String: Any] else { return }
                        guard let workHeroData = heroData["work"] as? [String: String] else { return }
                        guard let connectionsHeroData = heroData["connections"] as? [String: String] else { return }
                        guard let imageHeroData = heroData["image"] as? [String: String] else { return }
                        
                        let imageHero = ImageHero(url: imageHeroData["url"])
                        
                        let connectionsHero = ConnectionsHero(groupAffiliation: connectionsHeroData["group-affiliation"],
                                                              relatives: connectionsHeroData["relatives"])
                        
                        let workHero = WorkHero(occupation: workHeroData["occupation"],
                                                base: workHeroData["base"])
                        
                        let appearanceHero = AppearanceHero(gender: appearanceHeroData["gender"] as? String,
                                                            race: appearanceHeroData["race"] as? String,
                                                            height: appearanceHeroData["height"] as? [String],
                                                            weight: appearanceHeroData["weight"] as? [String],
                                                            eyeColor: appearanceHeroData["eye-color"] as? String,
                                                            hairColor: appearanceHeroData["hair-color"] as? String)
                        
                        let biographyHero = BiographyHero(fullName: biographyHeroData["full-name"] as? String,
                                                          alterEgos: biographyHeroData["alter-egos"] as? String,
                                                          aliases: biographyHeroData["aliases"] as? [String],
                                                          placeOfBirth: biographyHeroData["place-of-birth"] as? String,
                                                          firstAppearance: biographyHeroData["first-appearance"] as? String,
                                                          publisher: biographyHeroData["publisher"] as? String,
                                                          alignment: biographyHeroData["alignment"] as? String)
                        
                        let powerstatsHero = PowerstatsHero(intelligence: powerstatsHeroData["intelligence"],
                                                            strength: powerstatsHeroData["strength"],
                                                            speed: powerstatsHeroData["speed"],
                                                            durability: powerstatsHeroData["durability"],
                                                            power: powerstatsHeroData["power"],
                                                            combat: powerstatsHeroData["combat"])
                        
                        let hero = Hero(id: heroData["id"] as? String,
                                        name: heroData["name"] as? String,
                                        powerstats: powerstatsHero,
                                        biography: biographyHero,
                                        appearance: appearanceHero,
                                        work: workHero,
                                        connections: connectionsHero,
                                        image: imageHero)
                        
                        DispatchQueue.main.async {
                            self.heroes.append(hero)
                            self.heroes.sort { (hero1, hero0) -> Bool in
                                if let name1 = hero1.name, let name0 = hero0.name {
                                    return name1 < name0
                                }
                                return false
                            }
                            self.tableView.reloadData()
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                }
        }
    }
}
