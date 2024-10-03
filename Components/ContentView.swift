//
//  ContentView.swift
//  Components
//
//  Created by Avinash on 03/10/2024.
//

import SwiftUI

//ContentView inheritance with View
struct ContentView: View {
    @State var products: Products?

    var body: some View {
        NavigationStack {
            ProductsView(products: $products)
                .padding()
        }
        .task {
            guard let url = Bundle.main.url(forResource: "Products", withExtension: "json") else {
                //show error
                print("No Products.json File Found in the Bundle.")
                return
            }
            
            //Convert it in raw Data
            do {
                let data = try Data(contentsOf: url)
                products = try JSONDecoder().decode(Products.self, from: data)
            }
            catch{
                print(error.localizedDescription)
            }
            
        }


    }
}

#Preview {
    ContentView()
}
