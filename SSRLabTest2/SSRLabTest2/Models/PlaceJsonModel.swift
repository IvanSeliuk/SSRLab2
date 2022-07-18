//
//  PlaceJsonModel.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import Foundation

typealias PlaceJson = [Place]
// MARK: - Place
struct Place: Codable {
    let id, idPoint: Int
    let name, text, sound: String
    let lang, lastEditTime: Int
    let creationDate: String
    let lat, lng: Double
    let logo: String
    let photo: String
    let cityID: Int
    let visible: Bool
    let images: [String]
    let tags: [Int]
    let isExcursion: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case idPoint = "id_point"
        case name, text, sound, lang
        case lastEditTime = "last_edit_time"
        case creationDate = "creation_date"
        case lat, lng, logo, photo
        case cityID = "city_id"
        case visible, images, tags
        case isExcursion = "is_excursion"
    }
}
