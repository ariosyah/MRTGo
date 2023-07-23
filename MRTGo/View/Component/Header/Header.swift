//
//  Header.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct Header: View {
    @Binding var departure: String
    @Binding var destination: String
    @Binding var isDepartureChosen: Bool
    @Binding var isDestinationChosen: Bool
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        ZStack {
            // Blue Header
            Rectangle()
                .foregroundColor(colorScheme == .light ? Color("Primary") : Color("Gray-800"))
                .ignoresSafeArea(.all)
                .frame(width: 400, height: 200)

            // Textfield
            VStack {
                Text("Rencana Perjalanan")
                    .font(Font.custom("HelveticaNeue", size: 18))                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()

                // Departure Textfield
                ZStack(alignment: .leading) {
                    Image("marker-pin-departure")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    if departure.isEmpty {
                        Text("Pilih Stasiun Keberangkatan")
                            .font(Font.custom("HelveticaNeue", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 40)
                    }

//                    TextField("", text: $departure) // Use the binding here
                    TextField("", text: $departure)
                        .padding(.leading, 40)
                        .font(Font.custom("HelveticaNeue", size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("Primary"))
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(colorScheme == .light ? .white : Color("Gray-950"))
                .cornerRadius(200)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .onChange(of: departure) { newValue in
                    isDepartureChosen = matchedStations(stations: nameList.stations, departure: departure, isDepartureChosen: isDepartureChosen).isEmpty
                    isDepartureChosen = (nameList.stations.first(where: { station in
                        station.name == newValue
                    }) != nil)
                }

                // Destination Textfield
                ZStack(alignment: .leading) {
                    Image(!isDepartureChosen ? "marker-pin-destination-disabled" : "marker-pin-destination")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    if destination.isEmpty {
                        Text("Pilih Tujuan")
                            .font(Font.custom("HelveticaNeue", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(!isDepartureChosen ? Color("Gray-400") : Color("Primary"))
                            .padding(.leading, 40)
                    }

                    TextField("", text: $destination)
                        .padding(.leading, 40)
                        .font(Font.custom("HelveticaNeue", size: 16))
                        .fontWeight(.medium)                        .foregroundColor(Color("Primary"))
                        .disabled(!isDepartureChosen)

                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    colorScheme == .dark && !isDepartureChosen ? Color("Gray-600") : (colorScheme == .light && !isDepartureChosen ? Color("Gray-300") : (colorScheme == .light ? .white : Color("Gray-950")))

                )
                .cornerRadius(200)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .onChange(of: destination) { newValue in
                                    // Check if the entered text matches any station
                    isDestinationChosen = matchedDestination(destinationPlace: destinationPlace, destination: destination, isDestinationChosen: isDestinationChosen).isEmpty
                    isDestinationChosen = (destinationPlace.first(where: { destinations in
                        destinations.name == newValue
                    }) != nil)
                }
            }
            .padding(.bottom, 40)
        }
    }
}

//struct Header_Previews: PreviewProvider {
//    static var previews: some View {
//        Header()
//    }
//}
