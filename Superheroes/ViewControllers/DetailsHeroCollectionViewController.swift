//
//  DetailsHeroCollectionViewController.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 07.03.2021.
//

import UIKit

class DetailsHeroCollectionViewController: UICollectionViewController {

    var hero: Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = hero.name
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageHeroViewCell
        
        cell.configureImage(with: hero.image?.url)
        
        return cell
    }
}

extension DetailsHeroCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width  - 48, height: 550)
    }
}
