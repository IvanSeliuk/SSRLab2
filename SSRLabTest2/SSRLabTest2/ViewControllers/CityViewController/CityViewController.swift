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
    
    private var city: CityJson? {
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
        
        let navigationBar = navigationController?.navigationBar
        navigationBar?.tintColor = UIColor(named: "ColorDark")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.text = "City"
        label.textColor = UIColor(named: "ColorText")
        label.font = UIFont(name: "Optima-Regular", size: 40)
        navigationItem.titleView = label
        
    }
    private func allSetup() {
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
    private func getCityData() {
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
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
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
