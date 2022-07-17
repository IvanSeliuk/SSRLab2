//
//  PlaceTableViewCell.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var namePlace: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
  
    func setupData(with place: Place) {
        namePlace.text = place.name
    
        FileServiceManager.shared.getImage(from: place.logo, completed: { [weak self] image in
            self?.placeImage.image = image
        })
    }
    
}
