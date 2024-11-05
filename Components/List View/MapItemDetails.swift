//
//  MapItemDetails.swift
//  Components
//
//  Created by Avinash on 05/11/2024.
//

import SwiftUI
import MapKit

struct MapItemDetails: View {
    
    @State private var lookaroundScene : MKLookAroundScene?
    @Binding var route : MKRoute?
    @Binding var selected : MKMapItem?

    private var travelTime: String? {
        guard let route else { return nil }
        let formatter = DateComponentsFormatter ()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string (from: route.expectedTravelTime)
    }
    
    func getLookAroundScene(){
        lookaroundScene = nil
        Task{
            guard let selected else { return }
            let request = MKLookAroundSceneRequest(mapItem: selected)
            lookaroundScene = try? await request.scene
        }
    }
    
    var body: some View {
        LookAroundPreview(initialScene: lookaroundScene)
            .overlay(alignment: .bottomTrailing) {
                HStack{
                    Text(selected?.name ?? "")
                    if let travelTime{
                        Text(travelTime)
                    }
                }
                .font(.caption)
                .padding(10)
            }
            .onAppear {
                getLookAroundScene()
            }
            .onChange(of: selected) {
                getLookAroundScene()
            }
    }
}

