//
//  PredatorMap.swift
//  JPApexPredators
//
//  Created by Dawood on 22/09/2025.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    
    @State var position: MapCameraPosition
    @State var satellite: Bool = false
    
    var body: some View {
        Map(position: $position ) {
            ForEach(predators.allApexPredators) { predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay {
            Button {
                satellite.toggle()
            } label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.amercias")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    // .background(.react(conerRadius: 7))
                    .shadow(radius: 2)
                    .padding()
            }
        }
        .toolbarBackground(.automatic )
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[4].location, distance: 1000, heading: 250, pitch: 80)))
        .preferredColorScheme(.dark)
}
