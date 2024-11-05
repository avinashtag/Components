//
//  ProductMapView.swift
//  Components
//
//  Created by Avinash on 05/11/2024.
//

import SwiftUI
import MapKit


//Model
struct Location : Identifiable{
    
    let id = UUID()
    var name : String
    var coordinate: CLLocationCoordinate2D
}

struct ProductMapView: View {
    
    @State private  var cameraPosition : MapCameraPosition = .automatic
    
    @State var locations = [
        Location(name: "Kuala Lumpur", coordinate: CLLocationCoordinate2DMake(3.1319, 101.6841)),
        Location(name: "Singapore", coordinate: CLLocationCoordinate2DMake(1.3521, 103.8198))
    ]
    var body: some View {
        
        MapReader { proxy in
            Map(position: $cameraPosition){
                ForEach(locations) { location in
    //                Marker(location.name, coordinate: location.coordinate)
                    
                    Annotation(location.name, coordinate: location.coordinate) {
                        HStack{
                            Image(systemName: "car")
                                .resizable()
                                .frame(width: 30)
                                .foregroundStyle(.red)
                            Text(location.name)
                                .font(.headline)
                                .foregroundStyle(.red)

                        }
                    }
                    
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local){
                    locations.append(Location(name: "Custom", coordinate: coordinate))
                }
            }
        }

        .mapStyle(.standard)
        
    }
}

#Preview {
    ProductMapView()
}
