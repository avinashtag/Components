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
        .navigationTitle("Products")
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
    ContentView()
}
