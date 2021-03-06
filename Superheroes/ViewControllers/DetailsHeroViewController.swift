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
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var hero: Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.isUserInteractionEnabled = false
        configureImage()
        navigationItem.title = hero.name
        powerstatsLabel.text = hero.powerstats?.description
        biographyLabel.text = hero.biography?.description
        appearanceLabel.text = hero.appearance?.description
        workLabel.text = hero.work?.description
        connectionsLabel.text = hero.connections?.description
    }
    
    private func configureImage() {
        guard let stringURL = self.hero.image?.url else {
            self.view.isUserInteractionEnabled = true
            self.activityIndicator.stopAnimating()
            return
        }
        NetworkManager.shared.fetchImageData(from: stringURL) { image in
            self.imageHeroImageView.image = image
            self.imageHeroImageView.isHidden.toggle()
            self.view.isUserInteractionEnabled = true
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func showSpinner() {
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
    }
}
