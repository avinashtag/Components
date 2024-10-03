//
//  ProductsView.swift
//  Components
//
//  Created by Avinash on 03/10/2024.
//

import Foundation
import SwiftUI



struct ProductsView: View {
    
    @Binding var products: Products?
    
    
    var body: some View {
        
        ForEach(products ?? [], id: \.self){ product in
            ProductCell(product: product)
        }
        
    }
}

//#Preview {
//    ProductsView()
//}

//1. i need Data -> Json File -> Load json file
//Create Model using https://app.quicktype.io




//Assigment
//@State:
//@binding: 
