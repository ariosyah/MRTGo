//
//  HomeView.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isKeyboardActive = false
    @State private var departure = ""
    @State private var destination = ""
    @State private var isDepartureChosen = false
    @State private var isDestinationChosen = false
    let stations = [Station]().self

    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                // Header
                Header(departure: $departure, destination: $destination, isDepartureChosen: $isDepartureChosen, isDestinationChosen: $isDestinationChosen) // Pass isDepartureChosen as a binding
                    .frame(width: geometry.size.width, height: 200)

                Spacer()

                // Empty State
                if isKeyboardActive {
                    
                    if isDepartureChosen {
                        DestinationList(destination: $destination, isDestinationChosen: $isDestinationChosen)
                    } else {
                        StationList(departure: $departure, isDepartureChosen: $isDepartureChosen)
                    }
                    
        
                } else {
                    
                    if isDestinationChosen && isDepartureChosen {
                        TripPlan_Ario(departure: $departure, destination: $destination,stations: stations)
                    } else {
                        EmptyState(departure: $departure, destination: $destination, isDepartureChosen: $isDepartureChosen, isDestinationChosen: $isDestinationChosen)
                            .opacity(1)
                    }
                    
                    
                }


                Button {
                    if isDepartureChosen && isDestinationChosen {
                        print("Notification Active!!!")
                        
                        let departureLocation = nameList.stations.first(where: { $0.name == departure })!.location
                        let bunderanHILocation = nameList.stations.first(where: {$0.name == "Stasiun Bundaran HI"})!.location
                        let destinationLocation = destinationPlace.first(where: {$0.name == destination})!.location
                        
                        NotificationManager.shared.detectLocation(location: (departureLocation.latitude, departureLocation.longitude), name: departure)
                        NotificationManager.shared.detectLocation(location: (bunderanHILocation.latitude,bunderanHILocation.longitude), name: "Stasiun Bundaran HI")
                        NotificationManager.shared.detectLocation(location: (destinationLocation.latitude,destinationLocation.longitude), name: destination)
                    }
                } label: {
                    Text("submit")
                }

                Spacer()
            }
            
        }
        
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
            withAnimation {
                isKeyboardActive = true
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
            withAnimation {
                isKeyboardActive = false
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
