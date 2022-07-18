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
  
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    let imageView = UIImageView()
    
    var selectedPlace: Place?
    var contentWidth: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedPlace = selectedPlace else { return }
        setupInfo(with: selectedPlace)
        navigationController?.navigationBar.backItem?.title = "Place"
        
        scrollView.delegate = self
    //    pageControl.currentPage = 4
        for image in selectedPlace.images {
            FileServiceManager.shared.getImage(from: image, completed: { [weak self] image in
                self?.imageView.image = image
            })
            
            let xCoordinate = scrollView.frame.midX + scrollView.frame.width * CGFloat(selectedPlace.images.count)
            contentWidth += scrollView.frame.width
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: xCoordinate - 100, y: (scrollView.frame.height / 2) - 100, width: 200, height: 200)
        }
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.height)
        
    }
    
    func setupInfo(with selectedPlace: Place) {
        namePlaceLabel.text = selectedPlace.name
        textLabel.text = String(htmlEncodedString: selectedPlace.text)
        dateLabel.text = "Дата публикации: \(selectedPlace.creationDate)"
    }
    

  
    
}
 
extension ShowPlaceViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
//    }
    
//    let onePageOffSet = scrollView.contentSize.width /
//    CGFloat(pageControl.numberOfPages)
//    pageControl.currentPage = Int(scrollView.contentOffset.x / onePageOffSet)
}
