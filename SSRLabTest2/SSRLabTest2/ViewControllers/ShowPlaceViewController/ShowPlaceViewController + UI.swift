//
//  ShowPlaceViewController + UI.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 18.07.22.
//

extension ShowPlaceViewController {
    func setupInfo(with selectedPlace: Place) {
        namePlaceLabel.text = selectedPlace.name
        textLabel.text = String(htmlEncodedString: selectedPlace.text)
        dateLabel.text = "Дата публикации: \(selectedPlace.creationDate)"
        FileServiceManager.shared.getImage(from: selectedPlace.images.last ?? "", completed: { [weak self] image in
            self?.imageView.image = image
        })
    }
}
