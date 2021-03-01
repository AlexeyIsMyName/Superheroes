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
        tableView.rowHeight = 150
        
        fetchHeroes()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        heroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let hero = heroes[indexPath.row]
        cell.textLabel?.text = hero.name
        cell.imageView?.image = image
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Networking
extension MainTableViewController {
    func fetchHeroes() {
        let stringURL1 = "https://superheroapi.com/api/3898713710192169/732"
        
        guard let url1 = URL(string: stringURL1) else { return }
        
        URLSession.shared.dataTask(with: url1) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.heroes.append(try JSONDecoder().decode(Hero.self, from: data))
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.configureImage()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func configureImage() {
        DispatchQueue.global().async {
            guard let stringURL = self.heroes[0].image?.url else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
                self.tableView.reloadData()
            }
        }
    }
}
