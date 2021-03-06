//
//  MainCollectionViewController.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 07.03.2021.
//

import UIKit


class MainCollectionViewController: UICollectionViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var heroes: [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHeroes(getAll: false)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsHeroVC = segue.destination as? DetailsHeroViewController else { return }
        guard let indexPath = collectionView.indexPathsForSelectedItems?[0] else { return }
        
        detailsHeroVC.hero = heroes[indexPath.row]
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HeroShortInfoCell
        
        let hero = heroes[indexPath.row]
        cell.nameHeroLabel.text = hero.name
    
        return cell
    }
    
    @IBAction func randomBarButtonPressed(_ sender: Any) {
        fetchHeroes(getAll: false)
    }
    
    @IBAction func allBarButtonPressed(_ sender: Any) {
        fetchHeroes(getAll: true)
    }
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 2 - 24, height: 100)
    }
}

extension MainCollectionViewController {
    private func fetchHeroes(getAll: Bool) {
        showSpinner()
        NetworkManager.shared.fetchHeroData(getAll: getAll) { heroes in
            self.heroes = heroes
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func showSpinner() {
        activityIndicator.startAnimating()
    }
}
