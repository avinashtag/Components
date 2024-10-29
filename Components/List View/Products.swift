//
//  Products.swift
//  Components
//
//  Created by Avinash on 03/10/2024.
//

import Foundation

enum Errors: Error{
    case invalidURL
    
    var localizedDescription: String{
        switch self {
        case .invalidURL: return "Invalid Url"
        }
    }
}


struct RequestProducts: Codable{
//https://fakestoreapi.com/products
    
    
    func fetch() async throws -> [Product]{
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else { throw Errors.invalidURL }
        let urlRequest = URLRequest(url: url)
        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        let result = try JSONDecoder().decode([Product].self, from: data)
        return result
    }
    
}

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
