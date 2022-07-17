//
//  NetworkManager.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 14.07.22.
//

import Foundation
import UIKit
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func getCityData(onCompletion: @escaping (CityJson) -> (),
                 onError: ((String?) -> ())?) {
        
        guard let url = API.city.cityUrl else { return }
        AF.request(url).responseDecodable(of: CityJson.self) { response in
            switch response.result {
            case .success(let city):
                DispatchQueue.main.async {
                    onCompletion(city)
                }
            case .failure(let error):
                onError?(error.localizedDescription)
            }
        }
    }
    
    func getPlaceData(onCompletion: @escaping (PlaceJson) -> (),
                 onError: ((String?) -> ())?) {
        
        guard let url = API.city.cityUrl else { return }
        AF.request(url).responseDecodable(of: PlaceJson.self) { response in
            switch response.result {
            case .success(let place):
                DispatchQueue.main.async {
                    onCompletion(place)
                }
            case .failure(let error):
                onError?(error.localizedDescription)
            }
        }
    }
}
