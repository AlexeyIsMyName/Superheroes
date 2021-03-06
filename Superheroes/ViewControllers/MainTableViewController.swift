//
//  MainTableViewController.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    var heroes: [Hero] = []
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.addSubview(activityIndicator)
        showSpinner()
        fetchHeroes(getAll: false)
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
        fetchHeroes(getAll: false)
    }
    
    @IBAction func allBarButtonPressed(_ sender: Any) {
        fetchHeroes(getAll: true)
    }
}

// MARK: - Networking
extension MainTableViewController {
    private func fetchHeroes(getAll: Bool) {
        showSpinner()
        NetworkManager.shared.fetchHeroData(getAll: getAll) { heroes in
            self.heroes = heroes
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.tableView.isUserInteractionEnabled = true
            self.tableView.setContentOffset(CGPoint(x: 0, y: 0),
                                            animated: true)
        }
    }
    
    private func showSpinner() {
        tableView.isUserInteractionEnabled = false
        activityIndicator.center = CGPoint(x: tableView.contentOffset.x + tableView.frame.width / 2,
                                           y: tableView.contentOffset.y + tableView.frame.height / 2)
        
        activityIndicator.startAnimating()
    }
}
