//
//  ProductMapView.swift
//  Components
//
//  Created by Avinash on 05/11/2024.
//

import SwiftUI
import MapKit


extension MKCoordinateRegion {
    
    static let boston = MKCoordinateRegion ( center: CLLocationCoordinate2D( latitude: 42.360256,
                                                                             longitude: -71.057279), span: MKCoordinateSpan ( latitudeDelta: 0.1,
                                                                                                                              longitudeDelta: 0.1))
    
    static let northShore = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.547408,
            longitude: -70.870085),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))
    
    static let delhi = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 28.6139,
            longitude: 77.2088),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))

    
}

struct ProductMapView: View {
    
    @State private  var cameraPosition : MapCameraPosition = .automatic
    @State var searchResults: [MKMapItem] = []
    @State var visibleRegion: MKCoordinateRegion?
    @State var selected: MKMapItem?
    @State var route: MKRoute?

    
    var body: some View {
        
        MapReader { proxy in
            
            Map(position: $cameraPosition, selection: $selected){
                Annotation("Parking", coordinate: .parking) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.background)
                        RoundedRectangle (cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 5)
                        Image (systemName: "car")
                            .padding (5)
                    }
                }
//                .annotationTitles(.hidden)
                
                ForEach(searchResults, id: \.self) { result in
                    Marker(item: result)
                }
                .annotationTitles(.hidden)
                
                if let route{
                    MapPolyline(route)
                        .stroke(.blue, lineWidth: 5)
                }
            }
        }
        .mapControls({
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        })
        .mapStyle(.standard(elevation: .realistic))
        .safeAreaInset(edge: .bottom) {
            HStack{
                Spacer()
                VStack(spacing: 0, content: {
                    if let selected{
                        MapItemDetails(route: $route, selected: $selected)
                            .frame(height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.top, .horizontal])
                    }
                    BeantownButton(searchResults: $searchResults, position: $cameraPosition, visibleRegion: $visibleRegion)
                        .padding(.top)
                })
                
                Spacer()
            }
            .background(.thinMaterial)
        }
        .onChange(of: searchResults) {
            cameraPosition = .automatic
        }
        .onMapCameraChange { context in
            visibleRegion = context.region
        }
        .onChange(of: selected) {
            getDirections()
        }

        
    }
    
    
    
    func getDirections(){
        route = nil
        guard let selected else { return }
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: .parking))
        request.destination = selected
        
        Task{
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }
}

#Preview {
    ProductMapView()
}
