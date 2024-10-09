//
//  ProductDetailView.swift
//  Components
//
//  Created by Avinash on 07/10/2024.
//

import Foundation
import SwiftUI

struct ProductDetailView: View {
    
    @Binding var product: Product
    
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
            
            HStack(content: {
                Spacer()
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(16/9,contentMode: .fit)

                } placeholder: {
                    ProgressView()
                        .frame(width: 200, height: 200)
                }
                Spacer()
            })
            
            Text(product.title)
                .font(.title)
                .padding(.bottom)
            Text(product.description)
                .font(.body)
                .padding(.bottom)
            Text("\(product.price,specifier:"%.2f")")
                .font(.body)
                
            Spacer()
        } )
        .padding()
        
    }
}

#Preview {
    

    ProductDetailView(product: Binding(get: {
        Product(id: 0, title: "Karthik", price: 10, description: "Here is my description ", category: .electronics, image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 4, count: 5))
    }, set: {_ in }))
}


//Assigment
//Spacing between title and description and price
// make price upto 2 decimal place 
//Image suppose to be in center , aspect ratio
