//
//  ProductsView.swift
//  Components
//
//  Created by Avinash on 03/10/2024.
//

import Foundation
import SwiftUI
import SwiftData


/*
 Multithreading
 1. GCD - Grand Central Dispatch - Written in C - Faster , limited Priority, no dependency, grouping is possible, Non cancellable, no resume functionality, No pause
 2. Nsoperation, Operation - Swiftui Task- Set prioirty, dependency, Cancellable, Resume, Pause, suspend
 
 Note:
 
 - Show data on view *Always be on main thread else Crash
 */


struct ProductsView: View {
    
    @Query var products: [Product]
    
    @Binding var searchText: String 
    @State private var presentFilterSheet: Bool = false
    @State private var filtersDataSource: [Filter] = [
        Filter(category: .electronics, isSelected: false),
        Filter(category: .jewelery, isSelected: false),
        Filter(category: .menSClothing, isSelected: false),
        Filter(category: .womenSClothing, isSelected: false)]

    var filteredProducts: Products? {
        if searchText.isEmpty { return products }
        else {
            return products.filter({$0.title.lowercased().contains(searchText.lowercased())})
        }
    }

    var body: some View {
        
        List {
            ForEach(filteredProducts ?? [], id: \.self){ product in
                
                NavigationLink {
                    ProductDetailView(product: Binding(get: {product}, set: {_ in }), didComplete: { productTitle in
                        print("\(productTitle)")
                    })
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
//                    products = products?.filter({categories.contains($0.category)})
                    print(category, categories)
                }
                
            })
        })
        .task {

            NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "ProductSyncesSuccess"), object: nil, queue: nil) { notification in
                //Here you can write the code after your notification
                
                
                print("Product List")
            }
        }
        
        
    }
}

//#Preview {
//    
//    NavigationStack {
//        ProductsView(products: Binding(get: {
//            
//            
//            let products: Products?  = try? Bundle.main.decode(resource: "Products", extension: "json")
//            return products
//            
//        }, set: {_ in }))
//    }
//}

//1. i need Data -> Json File -> Load json file
//Create Model using https://app.quicktype.io




//Assigment
//@State: It is more like a local variable, scope is confined to a view and data is kind of private
//@binding: It is more to access across different views.


//7october
//Error Enum
//Extension -> Bundle
//Func of T type 


//TODO: Assigment 11 Nov
/*
 1. Work with category filteration
 2. Read Notification
 */
