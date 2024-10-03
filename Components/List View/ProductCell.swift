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
        
        VStack(alignment: .leading, content: {
            Text(product.title)
            Text(product.description)
            Text("\(product.price)")
        })
        
    }
}

#Preview {
    ProductCell(product: Product(id: 0, title: "Karthik", price: 10, description: "My Description", category: .electronics, image: "", rating: .init(rate: 4, count: 5)))
}
