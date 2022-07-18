//
//  PlaceViewController.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit
import NVActivityIndicatorView

class PlaceViewController: UIViewController {
    var activityIndicatorView: NVActivityIndicatorView!
    let tableView = UITableView()
    var newPlaces: [Place]? = []
    var place: PlaceJson? {
        didSet {
            tableView.reloadData()
        }
    }
    var idCity: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allSetup()
        getPlaceData()
        activityIndicatorView.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBar()
    }
}

extension PlaceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = ShowPlaceViewController.getInstanceController as? ShowPlaceViewController else { return }
        vc.selectedPlace = place?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as? PlaceTableViewCell else { return UITableViewCell() }
        
        if let item = place?[indexPath.row] {
            cell.setupData(with: item)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let place = place else { return 0 }
        print("------------------count-----------------\(place.count)")
        return place.count
    }
}
