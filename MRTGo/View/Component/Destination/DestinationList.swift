//
//  DestinationList.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct Destination {
    var name: String
    var exitGate: String
    var location: (latitude: Double, longitude: Double)
}

struct DestinationList: View {

    @Binding var destination: String
    @Binding var isDestinationChosen: Bool
    @Environment(\.colorScheme) var colorScheme

    
    private func filteredDestination() -> [Destination] {
        return matchedDestination(destinationPlace: destinationPlace, destination: destination, isDestinationChosen: isDestinationChosen)
       }
    

    var body: some View {
        VStack(alignment: .leading) {
            Text("Pilih Tujuan")
                .font(Font.custom("HelveticaNeue", size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 15)

            ScrollView {
                VStack {
                    ForEach(filteredDestination(), id: \.name) { destinations in
                        Button(action: {
                            destination = destinations.name // Set the departure state to the selected station's name
                            isDestinationChosen = true
                            let destinationLocation = destinationPlace.first(where: {$0.name == destination})!.location
                            NotificationManager.shared.detectLocation(location: (destinationLocation.latitude,destinationLocation.longitude), name: destination,locationType:.destination)


                        }) {
                            HStack(spacing: 10) {
                                Image("marker-pin-destination")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(destinations.name)
                                        .font(Font.custom("HelveticaNeue", size: 16))
                                        .fontWeight(.medium)
                                        .foregroundColor(colorScheme == .light ? .black : .white)
                                    Text("\(destinations.exitGate)")
                                        .font(Font.custom("HelveticaNeue", size: 16))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("Gray-400"))
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
    }
}

//struct DestinationList_Previews: PreviewProvider {
//    static var previews: some View {
//        DestinationList()
//    }
//}
