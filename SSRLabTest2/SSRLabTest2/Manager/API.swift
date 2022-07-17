//
//  API.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 14.07.22.
//

import Foundation

enum API: String {

    case city = "https://krokapp.by/api/get_cities/11/"
    case place = "http://krokapp.by/api/get_points/11/"
    
    var cityUrl: URL? {
        return URL(string: API.city.rawValue)
    }
    
    var placeUrl: URL? {
        return URL(string: API.place.rawValue)
    }
}
