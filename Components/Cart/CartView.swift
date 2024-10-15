//
//  CartView.swift
//  Components
//
//  Created by Avinash on 15/10/2024.
//

import SwiftUI

struct CartView: View {
    @Binding var products: Products?

    var body: some View {
        
        List{
            Section("Products To Buy") {
                ForEach(products ?? [], id: \.self){ product in
                    
                    CartCell(product: product)
                    
                }
            }
        }
        .navigationTitle("Cart")
        
    }
}

#Preview {
    CartView(products: Binding(get: {
        
        
        let products: Products?  = try? Bundle.main.decode(resource: "Products", extension: "json")
        return products
        
    }, set: {_ in }))
}




struct CartCell: View {
    
    @State var product: Product
    
    
    var body: some View {
        
        HStack(alignment: .top, content: {
            
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .frame(width: 80, height: 80)
                    .aspectRatio(16/9,contentMode: .fit)

            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }

            Text(product.title)
                .font(.body)

            Spacer()

            Text("$\(product.price,specifier:"%.2f")")
                .font(.body.bold())
                
        } )
        
    }
}

/*
 Assignmet 15 Oct
 1. Add section at the bottom for ,total
 2. Show sum of amounts in the bottom section
 */
