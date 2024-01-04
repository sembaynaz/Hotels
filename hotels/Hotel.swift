//
//  Hotel.swift
//  hotels
//
//  Created by Nazerke Sembay on 03.01.2024.
//

import Foundation

struct Hotel: Codable {
    let id: Int
    let name: String
    let address: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel
    
    enum CodingKeys: String, CodingKey {
        case id, name, address
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

struct AboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}
