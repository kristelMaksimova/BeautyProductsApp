//
//  Cosmetics.swift
//  BeautyProductsApp
//
//  Created by Kristi on 15.06.2022.
//
import Foundation

struct Cosmetics: Decodable {
    let name: String?
    let brand: String?
    let price: String?
    let image_link: String?
    let description: String?
}

struct WebsiteDescription: Decodable {
    let cosmetics: [Cosmetics]?
    let websiteDescription: String?
    let websiteName: String?
}
