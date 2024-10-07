//
//  ComponentError.swift
//  Components
//
//  Created by Avinash on 07/10/2024.
//

import Foundation


enum ComponentError: Error{
    case noProducts
    
    var localizedDescription: String{
        switch self {
        case .noProducts: return "No Products.json File Found in the Bundle."
        }
    }
}
