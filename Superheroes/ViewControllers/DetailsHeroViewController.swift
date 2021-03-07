//
//  DetailsHeroViewController.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

import UIKit
class DetailsHeroViewController: UIViewController {

    @IBOutlet var workView: UIView!
    @IBOutlet var connectionsView: UIView!
    @IBOutlet var appearanceView: UIView!
    @IBOutlet var biographyView: UIView!
    @IBOutlet var powerstatsView: UIView!
    
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
        navigationItem.title = hero.name
        configureDetailViews()
        configureImage()
    }
    
    private func configureDetailViews() {
        if let powerstatsText = hero.powerstats?.description {
            powerstatsLabel.text = powerstatsText
            powerstatsView.isHidden = false
        }
        
        if let biographyText = hero.biography?.description {
            biographyLabel.text = biographyText
            biographyView.isHidden = false
        }
        
        if let appearanceText = hero.appearance?.description {
            appearanceLabel.text = appearanceText
            appearanceView.isHidden = false
        }
        
        if let workText = hero.work?.description {
            workLabel.text = workText
            workView.isHidden = false
        }
        
        if let connectionsText = hero.connections?.description {
            connectionsLabel.text = connectionsText
            connectionsView.isHidden = false
        }
    }
    
    private func configureImage() {
        guard let stringURL = self.hero.image?.url else {
            self.activityIndicator.stopAnimating()
            return
        }
        NetworkManager.shared.fetchImageData(from: stringURL) { image in
            self.imageHeroImageView.image = image
            self.imageHeroImageView.isHidden.toggle()
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func showSpinner() {
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
    }
}
