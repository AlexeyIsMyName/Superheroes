//
//  HeroShortInfoCell.swift
//  Superheroes
//
//  Created by ALEKSEY SUSLOV on 07.03.2021.
//

import UIKit

class HeroShortInfoCell: UICollectionViewCell {
    
    @IBOutlet var nameHeroLabel: UILabel!
    @IBOutlet var publisherHeroLabel: UILabel!
    
    func configureCell(with name: String?, and publisher: String?) {
        
        let color = UIColor(red: CGFloat.random(in: 0.6...0.9),
                            green: CGFloat.random(in: 0.6...0.9),
                            blue: CGFloat.random(in: 0.6...0.9),
                            alpha: 1)
        
        contentView.backgroundColor = color
        
        nameHeroLabel.text = name
        publisherHeroLabel.text = publisher
    }
    
}
