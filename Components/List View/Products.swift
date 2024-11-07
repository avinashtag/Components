//
//  Products.swift
//  Components
//
//  Created by Avinash on 03/10/2024.
//

import Foundation
import SwiftData

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
        
        let products: [Product] = try await Network.shared.fetch(httpMethod: .GET)
        
        return products
        
        //Simple Way to Implement API
//        guard let url = URL(string: "https://fakestoreapi.com/products") else { throw Errors.invalidURL }
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
//        let result = try JSONDecoder().decode([Product].self, from: data)
//        return result
    }
    
}

@Model
class Product: Codable, Hashable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    @Attribute(.unique)
    var id: Int
    
    var title: String
    var price: Double
    var dscription: String
    var category: Category
    var image: String
    var rating: Rating
    
    enum Codingkeys: String, CodingKey{
        case id
        case title
        case price
        case dscription = "description"
        case category
        case image
        case rating
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(Double.self, forKey: .price)
        self.dscription = try container.decode(String.self, forKey: .dscription)
        self.category = try container.decode(Category.self, forKey: .category)
        self.image = try container.decode(String.self, forKey: .image)
        self.rating = try container.decode(Rating.self, forKey: .rating)
    }
    
    func encode(to encoder: any Encoder) throws {
        //Posting api
        var container = try encoder.container(keyedBy: Codingkeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.price, forKey: .price)
    }
    
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
