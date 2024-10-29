//
//  Endpoint.swift
//  Components
//
//  Created by Avinash on 29/10/2024.
//

import Foundation

enum Endpoint: String{
    
    case base = "https://fakestoreapi.com"
    case products = "/products"
    
}

enum HTTPMethods: String{
    
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
}

enum HTTPHeaders: String{
    case contentType = "Content-Type"
    case contentTypeJson = "application/json"
}
