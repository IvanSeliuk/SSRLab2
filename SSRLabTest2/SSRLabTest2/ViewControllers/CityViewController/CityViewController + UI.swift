//
//  CityViewController + UI.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 18.07.22.
//

import UIKit
import NVActivityIndicatorView

extension CityViewController {
    func setupNavigationBar() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.tintColor = UIColor(named: "ColorDark")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.text = "City"
        label.textColor = UIColor(named: "ColorText")
        label.font = UIFont(name: "Optima-Regular", size: 40)
        navigationItem.titleView = label
    }
    
    func allSetup() {
        setupUI()
        setupMapViewLayout()
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
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
        tableView.backgroundColor = UIColor(named: "ColorDark")
    }
    
    private func setupMapViewLayout() {
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    func getCityData() {
        NetworkManager.shared.getCityData(onCompletion: { [weak self] cityData in
            self?.city = cityData.filter({$0.name != ""})
            self?.activityIndicatorView.stopAnimating()
        }, onError: { [weak self] error in
            guard let error = error else { return }
            self?.activityIndicatorView.stopAnimating()
            self?.showAlert(with: error)
        })
    }
}
