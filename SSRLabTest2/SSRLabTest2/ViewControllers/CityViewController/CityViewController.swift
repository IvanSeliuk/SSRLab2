//
//  CityViewController.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit

class CityViewController: UIViewController {

    let tableView = UITableView()
    private var city: CityJson?
    override func viewDidLoad() {
        super.viewDidLoad()
        allSetup()
        getPointOnTheMap()
    }
    
    private func allSetup() {
        setupUI()
        setupMapViewLayout()
        
        
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func setupMapViewLayout() {
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    private func getPointOnTheMap() {
        NetworkManager.shared.getCityData(onCompletion: { [weak self] cityData in
            self?.city = cityData
            
        }, onError: { [weak self] error in
            guard let error = error else { return }
            self?.showAlert(with: error)
        })
    }

}

extension CityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
}
