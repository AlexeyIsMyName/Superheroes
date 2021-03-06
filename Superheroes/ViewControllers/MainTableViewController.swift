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
                .responseDecodable(of: Hero.self) { responseData in
                    switch responseData.result {
                    case .success(let hero):
                        self.heroes.append(hero)
                        DispatchQueue.main.async {
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
