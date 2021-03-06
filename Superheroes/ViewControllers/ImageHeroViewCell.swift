//
//  ImageHeroViewCell.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 07.03.2021.
//

import UIKit

class ImageHeroViewCell: UICollectionViewCell {
    @IBOutlet var imageHero: UIImageView!
    
    func configureImage(with url: String?) {
        guard let stringURL = url else { return }
        NetworkManager.shared.fetchImageData(from: stringURL) { image in
            self.imageHero.image = image
        }
    }
}
