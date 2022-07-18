//
//  PlaceViewController + UI.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 18.07.22.
//

import UIKit
import NVActivityIndicatorView

extension PlaceViewController {
    func setupNavigationBar() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.tintColor = UIColor(named: "ColorText")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.text = "Place"
        label.textColor = UIColor(named: "ColorText")
        label.font = UIFont(name: "Optima-Regular", size: 40)
        navigationItem.titleView = label
        navigationBar?.backItem?.title = "City"
    }
    
    func allSetup() {
        setupUI()
        setupTableViewLayout()
    }
    
    private func setupUI() {
        let midY = UIScreen.main.bounds.height / 2.5 - 25
        let midX = UIScreen.main.bounds.width / 2 - 25
        let frame = CGRect(x: midX, y: midY, width: 50, height: 50)
        
        activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .ballRotateChase, color: .white)
        tableView.addSubview(activityIndicatorView)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceTableViewCell")
        tableView.backgroundColor = UIColor(named: "ColorDark")
    }
    
    private func setupTableViewLayout() {
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    func getPlaceData() {
        NetworkManager.shared.getPlaceData(onCompletion: { [weak self] placeData in
            self?.place = placeData.filter({$0.cityID == self?.idCity}).filter({$0.name != ""})
            self?.activityIndicatorView.stopAnimating()
        }, onError: { [weak self] error in
            guard let error = error else { return }
            self?.activityIndicatorView.stopAnimating()
            self?.showAlert(with: error)
        })
    }
}
