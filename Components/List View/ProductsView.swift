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
        
        List {
            ForEach(products ?? [], id: \.self){ product in
                
                NavigationLink {
                    ProductDetailView(product: Binding(get: {product}, set: {_ in }))
                } label: {
                    ProductCell(product: product)
                }

            }
        }
        .navigationTitle("Products")
        
    }
}

#Preview {
    

    ProductsView(products: Binding(get: {
        
        
        let products: Products?  = try? Bundle.main.decode(resource: "Products", extension: "json")
        return products
        
    }, set: {_ in }))
}

//1. i need Data -> Json File -> Load json file
//Create Model using https://app.quicktype.io




//Assigment
//@State: It is more like a local variable, scope is confined to a view and data is kind of private
//@binding: It is more to access across different views.


//7october
//Error Enum
//Extension -> Bundle
//Func of T type 
