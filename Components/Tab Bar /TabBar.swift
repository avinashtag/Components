//
//  TabBar.swift
//  Components
//
//  Created by Avinash on 09/10/2024.
//

import SwiftUI
import SwiftData

struct TabBar: View {
    
    @Environment(\.modelContext) private var modelContext    
    @State private var productNavigationPath: NavigationPath = NavigationPath()
    @State private var cartNavigationPath: NavigationPath = NavigationPath()
    @State private var profileNavigationPath: NavigationPath = NavigationPath()

    @State private var searchText: String = ""
    
    var myqueue = DispatchQueue(label: "MyQueueKarthik",qos: .background, attributes: .concurrent)
    

    var body: some View {
        
        TabView {
            NavigationStack(path: $productNavigationPath) {
                ProductsView(searchText: $searchText)
            }
            .searchable(text: $searchText, placement: .automatic)
            .tabItem {
                VStack{
                    Image(systemName: "list.bullet")
                    Text("Products")
                }
            }
            
//            NavigationStack(path: $cartNavigationPath) {
//                CartView(products: $products)
//            }
//            .tabItem {
//                VStack{
//                    Image(systemName: "cart")
//                    Text("Cart")
//                }
//            }
            
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
            Task(priority: .background, operation: {
                do{
                    
                    
                   let products = try await RequestProducts().fetch()
                    //Insert pproduct in db
                    for product in products {
                        self.modelContext.insert(product)
                        
                        //To Delete product
                       // self.modelContext.delete(product)
                        
                        //To update
//                        product.price = 20
//                        try? self.modelContext.save()
                    }
                    
                    
                    
//                    products  = try Bundle.main.decode(resource: "Products", extension: "json")
                    DispatchQueue.main.async {
                        // Main  thread - Serial

                        //Load View
                        
                    }
                    
                    DispatchQueue.global().async {
                        // background thread - parallel
                    }
                    
                    myqueue.async {
                        //Code to perform on this thread
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            })
            
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
