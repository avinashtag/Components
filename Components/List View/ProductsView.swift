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
    @State private var presentFilterSheet: Bool = false
    @State private var filtersDataSource: [Filter] = [
        Filter(category: .electronics, isSelected: false),
        Filter(category: .jewelery, isSelected: false),
        Filter(category: .menSClothing, isSelected: false),
        Filter(category: .womenSClothing, isSelected: false)]

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
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    //Create a List View
                    //show all category products
                    presentFilterSheet.toggle()
                }, label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                })
            }
        })
        .sheet(isPresented: $presentFilterSheet, content: {
            FilterView( filtersDataSource: $filtersDataSource, didSelectCategory: { categories in
                print(categories)
                //Assigment to filter product with the categories
                for category in categories{
                    //Not working properly when we select two categories
                    //Assignment fis this bug 22 October
                    products = products?.filter({category.rawValue.contains($0.category.rawValue)})
                }
                
            })
        })
        
        
    }
}

#Preview {
    
    NavigationStack {
        ProductsView(products: Binding(get: {
            
            
            let products: Products?  = try? Bundle.main.decode(resource: "Products", extension: "json")
            return products
            
        }, set: {_ in }))
    }
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
