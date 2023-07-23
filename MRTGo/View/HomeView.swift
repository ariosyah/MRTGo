//
//  HomeView.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var isKeyboardActive = false
    @State private var departure = ""
    @State private var destination = ""
    @State private var isDepartureChosen = false
    @State private var isDestinationChosen = false
    @Environment(\.colorScheme) var colorScheme

    // manage focus on text fields
    @FocusState private var isDepartureFieldFocused: Bool
    @FocusState private var isDestinationFieldFocused: Bool

    let stations = [Station]()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Header
                Header(departure: $departure, destination: $destination, isDepartureChosen: $isDepartureChosen, isDestinationChosen: $isDestinationChosen)
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
                        // Show TripPlan_Ario when both departure and destination are chosen
                        OntripView(departure: $departure, destination: $destination, stations: stations)
                    } else {
                        EmptyState(departure: $departure, destination: $destination, isDepartureChosen: $isDepartureChosen, isDestinationChosen: $isDestinationChosen)
                            .opacity(1)
                    }
                }

                Spacer()
            }
        }
        .background(colorScheme == .light ? Color.white : Color("Gray-950"))
        .onTapGesture {
            // Dismiss keyboard when outside field
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
        .onChange(of: isDepartureChosen) { newValue in
            // When departure is chosen, set focus on the destination field
            if newValue {
                isDestinationFieldFocused = true
            }
        }
        .onChange(of: isDestinationChosen) { newValue in
            // When destination is chosen, resign focus from both fields
            if newValue {
                isDestinationFieldFocused = false
                isDepartureFieldFocused = false
            }
        }
        .focused($isDepartureFieldFocused) // Focus the departure field when isDepartureFieldFocused is true
        .focused($isDestinationFieldFocused) // Focus the destination field when isDestinationFieldFocused is true
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
