//
//  Bundle+Extension.swift
//  Components
//
//  Created by Avinash on 07/10/2024.
//

import Foundation


extension Bundle{
    
    
    
    func decode<T:Decodable>(resource: String, extension extn: String) throws -> T{
        
        guard let url = Bundle.main.url(forResource: resource, withExtension: extn) else { throw ComponentError.noProducts }
        //Convert it in raw Data
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}
