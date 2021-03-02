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

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        heroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let hero = heroes[indexPath.row]
        cell.textLabel?.text = hero.name
        //cell.detailTextLabel?.text = hero.biography?.full_name
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
        
//        DispatchQueue.global().async {
//            for id in 1...100 {
//                let stringURL = "https://superheroapi.com/api/3898713710192169/\(id)"
//
//                guard let url = URL(string: stringURL) else { return }
//
//                URLSession.shared.dataTask(with: url) { (data, _, _) in
//                    guard let data = data else { return }
//                    do {
//                        self.heroes.append(try JSONDecoder().decode(Hero.self, from: data))
//                    } catch let error {
//                        print(error)
//                    }
//                }.resume()
//            }
//            DispatchQueue.main.async {
//                self.heroes.sort { (hero1, hero0) -> Bool in
//                    if let name1 = hero1.name, let name0 = hero0.name {
//                         return name1 < name0
//                    }
//                    return false
//                }
//                self.tableView.reloadData()
//            }
//        }
        
        
        for id in 1...100 {
            let stringURL = "https://superheroapi.com/api/3898713710192169/\(id)"

            guard let url = URL(string: stringURL) else { return }

            URLSession.shared.dataTask(with: url) { (data, _, _) in
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
            }.resume()
        }
    }
}
