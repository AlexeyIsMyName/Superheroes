//
//  DetailsHeroViewController.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

import UIKit

class DetailsHeroViewController: UIViewController {

    @IBOutlet var imageHeroImageView: UIImageView!
    @IBOutlet var powerstatsLabel: UILabel!
    @IBOutlet var biographyLabel: UILabel!
    @IBOutlet var appearanceLabel: UILabel!
    @IBOutlet var workLabel: UILabel!
    @IBOutlet var connectionsLabel: UILabel!
    
    var hero: Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
        navigationItem.title = hero.name
        powerstatsLabel.text = hero.powerstats?.description
        biographyLabel.text = hero.biography?.description
        appearanceLabel.text = hero.appearance?.description
        workLabel.text = hero.work?.description
        connectionsLabel.text = hero.connections?.description
    }
    
    func configureImage() {
        guard let stringURL = self.hero.image?.url else { return }
        NetworkManager.shared.fetchImageData(from: stringURL) { image in
            self.imageHeroImageView.image = image
            self.imageHeroImageView.isHidden.toggle()
        }
    }
}
