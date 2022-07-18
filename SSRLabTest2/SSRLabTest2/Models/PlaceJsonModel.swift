//
//  PlaceJsonModel.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import Foundation

typealias PlaceJson = [Place]
// MARK: - PlaceElement
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

//typealias PlaceJson = [Place]
//// MARK: - PlaceElement
//struct Place: Codable {
//    let id: Int
//    let url: String
//    let pointKeyName: String
//    let lat, lng: Double
//    let pointImages: [PointImage]
//    let tags: [Tag]
//    let city: CityPlace
//
//    enum CodingKeys: String, CodingKey {
//        case id, url
//        case pointKeyName = "point_key_name"
//        case lat, lng
//        case pointImages = "point_images"
//        case tags, city
//    }
//}
//
//// MARK: - City
//struct CityPlace: Codable {
//    let id: Int
//}
//
//// MARK: - PointImage
//struct PointImage: Codable {
//    let file: String
//}
//
//// MARK: - Tag
//struct Tag: Codable {
//    let id: Int
//    let tagKey: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case tagKey = "tag_key"
//    }
//}
