//
//  Products.swift
//  lab2_2
//
//  Created by Nemo on 22/04/2026.
//

import UIKit
import Foundation

class ProductResponse: Codable {
    let products: [Product]
    init(products: [Product]) {
        self.products = products
    }
}

class Product: Codable {
    let title: String
    let description: String
    let price: Double
    let thumbnail: String
    
    init(title: String, description: String, price: Double, thumbnail: String) {
        self.title = title
        self.description = description
        self.price = price
        self.thumbnail = thumbnail
    }
}
