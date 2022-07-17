//
//  PlaceViewController.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit

class PlaceViewController: UIViewController {

    let tableView = UITableView()
    private var place: PlaceJson? {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        allSetup()
        getPlaceData()
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
        tableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceTableViewCell")
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
    private func getPlaceData() {
        NetworkManager.shared.getPlaceData(onCompletion: { [weak self] placeData in
            self?.place = placeData
            
        }, onError: { [weak self] error in
            guard let error = error else { return }
            self?.showAlert(with: error)
        })
    }

}

extension PlaceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        guard let vc = OpenNewsViewController.getInstanceController as? OpenNewsViewController else { return }
//        vc.selectedNews = city?[indexPath.row]
//
//        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as? PlaceTableViewCell else { return UITableViewCell() }
        if let item = place?[indexPath.row] {
            cell.setupData(with: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let place = place else { return 0 }
        return place.count
    }
    
    
}
