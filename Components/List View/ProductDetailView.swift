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
    var didComplete: (String)->Void
    
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
            Text(product.dscription)
                .font(.body)
                .padding(.bottom)
            Text("\(product.price,specifier:"%.2f")")
                .font(.body)
            
            Button(action: {
                didComplete(product.title)

            }, label: {
                Label("Closure", systemImage: "ellipsis.curlybraces")
            })
            .buttonStyle(.borderedProminent)
            
            NavigationLink(destination: GalleryView()) {
                Label("Gallery", systemImage: "photo")
            }

            Spacer()
        } )
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    ProductMapView()
                } label: {
                    Image(systemName: "map")
                }
            }
        })
        .task {
            NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "ProductSyncesSuccess"), object: nil, queue: nil) { notification in
                //Here you can write the code after your notification
                
                
                print("Product Detail")
            }

        }
        
    }
}

#Preview {
    

    ProductDetailView(product: Binding(get: {
        
        
        let products: Products?  = try? Bundle.main.decode(resource: "Products", extension: "json")
        return products!.first!
        
    }, set: {_ in }), didComplete: {_ in
        
    })
}


//Assigment
//Spacing between title and description and price
// make price upto 2 decimal place 
//Image suppose to be in center , aspect ratio
