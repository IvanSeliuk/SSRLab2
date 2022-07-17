//
//  CityViewController.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit

class CityViewController: UIViewController {

    let tableView = UITableView()
    private var city: CityJson? {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        allSetup()
        getCityData()
        navigationController?.navigationBar.tintColor = UIColor.black
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
    private func getCityData() {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = PlaceViewController.getInstanceController as? PlaceViewController else { return }
        //vc.selectedNews = city?[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else { return UITableViewCell() }
        if let item = city?[indexPath.row] {
            cell.setupData(with: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let city = city else { return 0 }
        return city.count
    }
    
    
}
