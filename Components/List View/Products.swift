//
//  Products.swift
//  Components
//
//  Created by Avinash on 03/10/2024.
//

import Foundation


struct Product: Codable, Hashable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: Category
    var image: String
    var rating: Rating
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable {
    var rate: Double
    var count: Int
}

typealias Products = [Product]
