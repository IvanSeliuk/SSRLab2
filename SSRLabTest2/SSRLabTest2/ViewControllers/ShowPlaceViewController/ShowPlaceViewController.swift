//
//  ShowPlaceViewController.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit

class ShowPlaceViewController: UIViewController {
    @IBOutlet weak var namePlaceLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var selectedPlace: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedPlace = selectedPlace else { return }
        setupInfo(with: selectedPlace)
        navigationController?.navigationBar.backItem?.title = "Place"
    }
}

