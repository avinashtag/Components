//
//  Network.swift
//  Components
//
//  Created by Avinash on 29/10/2024.
//

import Foundation


class Network{
    
    static var shared: Network = Network()
    private var sessionURL: URLSession = URLSession.shared
    
  
    func fetch<T:Decodable>(httpMethod: HTTPMethods) async throws -> T{
        
        let urlString = "\(Endpoint.base.rawValue)\(Endpoint.products.rawValue)"
        
        guard let url = URL(string: urlString) else { throw Errors.invalidURL }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue(HTTPHeaders.contentTypeJson.rawValue, forHTTPHeaderField: HTTPHeaders.contentType.rawValue)

        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        let result = try JSONDecoder().decode(T.self, from: data)
        return result
    }

}