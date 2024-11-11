//
//  ProductCell.swift
//  Components
//
//  Created by Avinash on 03/10/2024.
//

import SwiftUI

struct ProductCell: View {
    
    @State var product: Product
    
    var body: some View {
        
        HStack(alignment: .top, content: {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .frame(width: 80, height: 80)

            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
          
            VStack(alignment: .leading, content: {
                Text(product.title)
                    .font(.title3)
                    .padding(.bottom, 5)
                Text(product.dscription)
                    .font(.body)
                    .padding(.bottom, 5)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.body.bold())

            })

        } )
        
    }
}

//#Preview {
//    ProductCell(product: Product(id: 0, title: "Karthik", price: 10, description: "My Description", category: .electronics, image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: .init(rate: 4, count: 5)))
//}
