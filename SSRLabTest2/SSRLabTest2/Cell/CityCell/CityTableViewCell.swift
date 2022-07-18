//
//  CityTableViewCell.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var logoCity: UIImageView!
    @IBOutlet weak var nameCity: UILabel!
    
    
    func setupData(with city: City) {
        
        nameCity.text = city.name
        FileServiceManager.shared.getImage(from: city.logo, completed: { [weak self] image in
            self?.logoCity.image = image
        })
    }
}
