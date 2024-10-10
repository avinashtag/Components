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


    var body: some View {
        
        TabView {
            NavigationStack(path: $productNavigationPath) {
                ProductsView(products: $products)
            }
            .tabItem {
                VStack{
                    Image(systemName: "list.bullet")
                    Text("Products")
                }
            }
            
            NavigationStack(path: $cartNavigationPath) {
                ProductsView(products: $products)
            }
            .tabItem {
                VStack{
                    Image(systemName: "cart")
                    Text("Cart")
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
 
 */
