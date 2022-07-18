//
//  CityJsonModel.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import Foundation

typealias CityJson = [City]

// MARK: - City
struct City: Codable {
    let idLocale, id: Int
    let name: String
    let lang: Int
    let logo: String
    let lastEditTime: Int
    let visible, cityIsRegional: Bool
    let region: String
    
    enum CodingKeys: String, CodingKey {
        case idLocale = "id_locale"
        case id, name, lang, logo
        case lastEditTime = "last_edit_time"
        case visible
        case cityIsRegional = "city_is_regional"
        case region
    }
}
