//
//  MainTableViewController.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

import UIKit

class MainTableViewController: UITableViewController {

    var heroes: [Hero] = []
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHeroes()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let hero = heroes[indexPath.row]
        cell.textLabel?.text = hero.name
        cell.detailTextLabel?.text = String(indexPath.row + 1)
        
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
}

// MARK: - Networking
extension MainTableViewController {
    func fetchHeroes() {
        for _ in 1...20 {
            let stringURL = "https://superheroapi.com/api/3898713710192169/\(Int.random(in: 1...732))"

            guard let url = URL(string: stringURL) else { return }

            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let data = data else { return }
                    do {
                        self.heroes.append(try JSONDecoder().decode(Hero.self, from: data))
                    } catch let error {
                        print(error)
                    }
                    DispatchQueue.main.async {
                        self.heroes.sort { (hero1, hero0) -> Bool in
                            if let name1 = hero1.name, let name0 = hero0.name {
                                return name1 < name0
                            }
                            return false
                        }
                        self.tableView.reloadData()
                    }
                }
            }.resume()
        }
    }
}
