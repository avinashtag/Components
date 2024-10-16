//
//  TabBar.swift
//  Components
//
//  Created by Avinash on 09/10/2024.
//

import SwiftUI

struct TabBar: View {
    @State var products: Products?
    
    @State private var productNavigationPath: NavigationPath = NavigationPath()
    @State private var cartNavigationPath: NavigationPath = NavigationPath()
    @State private var profileNavigationPath: NavigationPath = NavigationPath()

    @State private var searchText: String = ""
    
    var filteredProducts: Products? {
        if searchText.isEmpty { return products }
        else {
            return products?.filter({$0.title.lowercased().contains(searchText.lowercased())})
        }
    }

    var body: some View {
        
        TabView {
            NavigationStack(path: $productNavigationPath) {
                ProductsView(products: searchText.isEmpty ? $products : Binding(get: {filteredProducts}, set: {_ in }))
            }
            .searchable(text: $searchText, placement: .automatic)
            .tabItem {
                VStack{
                    Image(systemName: "list.bullet")
                    Text("Products")
                }
            }
            
            NavigationStack(path: $cartNavigationPath) {
                CartView(products: $products)
            }
            .tabItem {
                VStack{
                    Image(systemName: "cart")
                    Text("Cart")
                }
            }
            
            NavigationStack(path: $profileNavigationPath) {
                ProfileView()
            }
            .tabItem {
                VStack{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }

            
        }
        .tint(.blue)
        .task {
            do{
                products  = try Bundle.main.decode(resource: "Products", extension: "json")
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
        
}

#Preview {
    TabBar()
}

/*
 //Assigment
 1. Tint color for tabbar
 
 
 Left item 16 oct
 1. Searchbar
 2. Swipe to remove from cart
 3. Detail page add to cart
 
 */
