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
                                EmptyState(isDepartureChosen: $isDepartureChosen).opacity(1)
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
