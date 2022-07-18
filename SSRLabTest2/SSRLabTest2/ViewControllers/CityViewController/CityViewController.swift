//
//  CityViewController.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit
import NVActivityIndicatorView

class CityViewController: UIViewController {
    var activityIndicatorView: NVActivityIndicatorView!
    let tableView = UITableView()
    
    var city: CityJson? {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        allSetup()
        getCityData()
        activityIndicatorView.startAnimating()
        navigationController?.navigationBar.tintColor = UIColor(named: "ColorDark")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBar()
    }
}

extension CityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = PlaceViewController.getInstanceController as? PlaceViewController else { return }
        vc.idCity = city?[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else { return UITableViewCell() }
        if let item = city?[indexPath.row] {
            cell.setupData(with: item)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let city = city else { return 0 }
        print("------------------count-----------------\(city.count)")
        return city.count
    }
}
