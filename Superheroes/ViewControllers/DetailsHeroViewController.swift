//
//  DetailsHeroViewController.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 02.03.2021.
//

import UIKit
import Alamofire

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
        AF.request(stringURL)
            .validate()
            .responseData { responseData in
                switch responseData.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        self.imageHeroImageView.image = UIImage(data: value)
                        self.imageHeroImageView.isHidden.toggle()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
